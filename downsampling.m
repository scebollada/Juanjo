%downsampling

url='../Datasets/Freiburg/omni_cam_2/';
url_destiny='../Datasets/Freiburg/omni_cam_2_training/';
%LOAD DATA
imds=imageDatastore(url,...
    'IncludeSubfolders',true,...
    'FileExtensions','.jpeg');


load(strcat(url,'coor_Train.mat'))
coor=coor_Train;
coor_Train=zeros(1,4);

indx=1;
for i=1:5:size(imds.Files,1)
     image=imread(imds.Files{i});
     s=imds.Files{i};
     imwrite(image,strcat(url_destiny,s(54:end))); 
     coor_Train(indx,:)=coor(i,:);
     indx=indx+1;
end

save(strcat(url_destiny,'coor_Train.mat'),'coor_Train')     
     
