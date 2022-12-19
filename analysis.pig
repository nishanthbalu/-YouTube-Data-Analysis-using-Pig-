data = LOAD '/ytda_project/*.txt' using PigStorage('\t') as 
(videoid:chararray,uploader:chararray,age:int,category:chararray,length:int,views:int,rate:int,rating:int,comments:int,related_id:chararray);
dump data;

data = FILTER data by category is not null;
grp_data = GROUP data by category;
cnt_data = FOREACH grp_data generate group,COUNT(data) as cnt;
cnt_data_sort = ORDER cnt_data by cnt desc;
top_5_category = LIMIT cnt_data_sort 5;
dump top_5_category;
STORE top_5_category into '/ytda_result/top5category/';

grp_data = FOREACH data generate videoid,category,rating;
grp_data = ORDER grp_data by rating desc;
top_10_rated = LIMIT grp_data 10;
dump top_10_rated;
STORE top_10_rated into '/ytda_result/top10rated/';

grp_data = FOREACH data generate videoid,category,views;
grp_data = ORDER grp_data by views desc;

top_10_views = LIMIT grp_data 10;
dump top_10_views;
STORE top_10_views into '/ytda_result/top10views/';

top_10_rating_by_category = FOREACH grp_data{
                           sorted = ORDER data by rating desc;
                           top_10 = LIMIT sorted 10;
                           generate FLATTEN (top_10);
};
                           

STORE top_10_rating_by_catagory into '/ytda_result/top10ratingbycategory/';

grp_data = ORDER data by category;
top_10_view_by_category = FOREACH grp_data{
                           sorted = ORDER data by views desc;
                           top_10 = LIMIT sorted 10;
                           generate FLATTEN (top_10);
};

STORE top_10_view_by_category into '/ytda_result/top10viewsbycategory/';