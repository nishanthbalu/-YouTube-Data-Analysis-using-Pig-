show databases;
create world;
use world;

create external table top5category(Top_5_Category string, Video_Count int) row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile location '/youtube_data_analysis/top5Category';
create external table top10rated(Video_Id string,Category string,Rating int) row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile location '/youtube_data_analysis/top10rated';
create external table top10views(Video_Id string,Category string,Rating int) row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile location '/youtube_data_analysis/top10views';
create external table top10ratingbycategory(Video_Id string,Category string,Viewed_count int) row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile location '/youtube_data_analysis/top10Viewedbycategory';
create external table top10viewsbycategory(Video_Id string,Category string,Viewed_count int) row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile location '/youtube_data_analysis/top10ratingbycategory';

load data inpath '/ytda_result/top5category/part-r-00000' overwrite into table top5category;
load data inpath '/ytda_result/top10rated/part-r-00000' overwrite into table top10rated;
load data inpath '/ytda_result/top10views/part-r-00000' overwrite into table top10views;
load data inpath '/ytda_result/top10ratingbycategory/part-r-00000' overwrite into table top10ratingbycategory;
load data inpath '/ytda_result/top10viewsbycategory/part-r-00000' overwrite into table top10viewsbycategory;

select * from top5category;
select * from top10rated;
select * from top10views;     
select * from top10ratingbycategory;
select * from top10viewsbycategory;

