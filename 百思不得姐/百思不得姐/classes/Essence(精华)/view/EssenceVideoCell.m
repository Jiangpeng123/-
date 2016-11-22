//
//  EssenceVideoCell.m
//  百思不得姐
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

#import "EssenceVideoCell.h"
#import "BDJEssenceModel.h"


@interface EssenceVideoCell()

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *passTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;

@property (weak, nonatomic) IBOutlet UILabel *palyNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@property (weak, nonatomic) IBOutlet UIButton *dingButton;

@property (weak, nonatomic) IBOutlet UIButton *caiButton;

@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHCons;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewHCons;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewYCons;


@end




@implementation EssenceVideoCell

+ (EssenceVideoCell *)videoCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath WithModel:(BDJEssenceDetail *)detailModel {
    
    static NSString *cellId = @"videoCellId";
    EssenceVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"EssenceVideoCell" owner:nil options:nil] lastObject];
    }
    //数据
    cell.detaiModel = detailModel;
    return cell;

}

- (void)setDetaiModel:(BDJEssenceDetail *)detaiModel {
    _detaiModel = detaiModel;
    
    //1.用户图标
    NSString *headerString = [detaiModel.u.header firstObject];
    NSURL *url = [NSURL URLWithString:headerString];
    [self.userImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"post_placeholderImager"]];
    
    //2.用户名
    self.userNameLabel.text = detaiModel.u.name;
    
    //3.时间
    self.passTimeLabel.text = detaiModel.passtime;
    
    //4.描述文字
    self.descLabel.text = detaiModel.text;
    
    //5.图片
    NSString *videoString = [detaiModel.video.thumbnail_small firstObject];
    
    NSURL *videoUrl = [NSURL URLWithString:videoString];
    [self.videoImageView sd_setImageWithURL:videoUrl placeholderImage:[UIImage imageNamed:@"post_placeholderImager"]];
    
    //修改高度
    CGFloat imageH = (kScreenWidth-20)*detaiModel.video.height.floatValue/detaiModel.video.width.floatValue;
    self.imageHCons.constant = imageH;
   
    //6.播放次数
    self.playTimeLabel.text = [detaiModel.video.playcount stringValue];
    
    //7.视频时间
    NSInteger min = 0;
    NSInteger sec = [detaiModel.video.duration integerValue];
    if (sec >= 60) {
        min = sec/60;
        sec = sec%60;
    }
    
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",min,sec];
    //8.评论文字
    if (detaiModel.top_comments.count>0) {
        BDJEssenceComment *comment = [detaiModel.top_comments firstObject];
        self.commentLabel.text = comment.content;
    }
    //9.标签
    NSMutableString *tagString = [NSMutableString string];
    for (NSInteger i=0; i<detaiModel.tags.count;i++) {
        BDJEssenceTag *tag = detaiModel.tags[i];
        [tagString appendFormat:@"%@",tag.name];
    }
    //10.顶、踩、分享、评论的数量
    [self.dingButton setTitle:detaiModel.up forState:UIControlStateNormal];
    [self.dingButton setTitle:[detaiModel.down stringValue] forState:UIControlStateNormal];
    [self.dingButton setTitle:[detaiModel.forward stringValue] forState:UIControlStateNormal];
    [self.dingButton setTitle:detaiModel.comment forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)MoreActiion:(id)sender {
}

- (IBAction)playAction {
}
- (IBAction)dingAction {
}
- (IBAction)caiAction {
}
- (IBAction)shareAction {
}
- (IBAction)commentAction {
}





@end




