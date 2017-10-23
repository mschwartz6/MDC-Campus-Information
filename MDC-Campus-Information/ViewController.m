//
//  ViewController.m
//  MDC-Campus-Information
//
//  Created by alive on 10/8/17.
//  Copyright © 2017 Matthew Schwartz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int pageNumber;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageGallery;
@property (weak, nonatomic) IBOutlet UITextView *campusDescriptions;
@property (weak, nonatomic) IBOutlet UITextView *linkTextView;
@property (weak, nonatomic) IBOutlet UIButton *prevButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *campusTitleLabel;

-(void)displayText;
-(void)checkButtons;
-(void)displayImage;
//Personal preference to separate functions for text and images
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    pageNumber = 0;
    [self displayText];
    [self displayImage];
    self.prevButtonOutlet.enabled = NO;//Previous button disabled initially}
    self.campusDescriptions.hidden = NO;
    [[UIDevice currentDevice]beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orientationChanged:)
        name:UIDeviceOrientationDidChangeNotification
        object:[UIDevice currentDevice]];
    
    
}
-(void)viewDidLayoutSubviews
{
    [self displayText];
    [self displayImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)orientationChanged:(NSNotification*) note
{
    [self displayText];
    [self displayImage];
}
- (IBAction)previousButton:(id)sender {
    --pageNumber;
    [self checkButtons];//Check buttons before displaying text/images
    [self displayText];
    [self displayImage];
}
- (IBAction)nextButton:(id)sender {
    
    ++pageNumber;
    [self checkButtons];
    [self displayText];
    [self displayImage];
    
}

-(void) displayText
{
    
    NSString *textToDisplay = [[NSString alloc]init];
    NSMutableString *pageURL =[[NSMutableString alloc]init];
    [pageURL appendString:@"https://www.mdc.edu/"];//Mutable string allows simple URL concatenation.
    NSString *campusTitle = [[NSString alloc]init];
    switch (pageNumber)
    {
        case 0:
            textToDisplay = @"With over 165,000 students from all around the world, Miami-Dade College has the largest undergraduate enrollment of any college or university in the country. We also award more Associates degrees than any other college in the United States. Lets take a look at why Miami-Dade College is recognized all over for its world-class facilities.";
            campusTitle =@"Welcome to the campus tour!";
            break;
        case 1:
            textToDisplay =@"1780 W 49th Street Hialeah, Florida 33012\n305-237-8700\nThe Hialeah Campus became MDC’s seventh campus, accorded official campus status by the Florida State Board of Education in 2005. The Campus serves the Greater Hialeah-Miami Lakes area, offering day and evening classes six days a week. Courses leading to an Associate in Arts or Associate in Science degree are offered. Educational opportunities are also available through Vocational Credit Certificate Programs, as well as through courses providing career entry in Computer Technology, Office Technology, Electronics and Early Childhood Development. The Hialeah Campus houses a large and comprehensive English language training program for speakers of other languages in various instructional formats.";
            campusTitle = @"Hialeah Campus";
            [pageURL appendString:@"hialeah/"];
            break;
        case 2:
            textToDisplay =@"500 College Terrace Homestead, Florida 33030\n305-237-5000\nIn 1990, Homestead became the fifth campus of Miami Dade College. It was opened in the historic downtown district of the City of Homestead with the mission to deliver a full range of higher education programs for the Homestead- Florida City communities. In fulfilling its mission, the campus enhances the community’s capacity to meet cultural and social needs, in turn fostering a stronger sense of community. This togetherness was very important following the devastation of Hurricane Andrew and the closing of the Homestead Air Force Base.";
            campusTitle=@"Homestead Campus ";
            [pageURL appendString:@"homestead/"];
            break;
        case 3:
            textToDisplay =@"627 SW 27th Ave. Miami, FL 33135\n305-237-6000\nThe InterAmerican Campus (IAC) is conveniently located in the heart of Little Havana near the Brickell Financial District, Coconut Grove, Coral Gables, Westchester, and Miami International Airport. The Campus is home for the School of Education, the Dual Language Honors College, and Translation and Interpretation Studies program. IAC offers comprehensive academic programs in business, accounting, computer information technology, transfer degrees, pre-nursing classes, and credit and non-credit opportunities to learn English or upgrade professional skills. Our campus community is proud to serve traditional and non-traditional students alike with day, evening, and virtual classes seven days a week";
            campusTitle=@"InterAmerican Campus ";
            [pageURL appendString:@"iac/"];
            break;
        case 4:
            textToDisplay =@"11011 SW 104 Street Miami, FL 33176-3393\n305-237-2000\nThe Kendall Campus, situated on a 185-acre tract of trees and lakes, opened in 1967. It is home to a wide variety of academic programs and specialized institutes. The campus features 13 buildings equipped with the latest technologies, a wellness center, athletic fields and an Olympic-sized pool. The Kendall Campus offers a comprehensive range of learning opportunities. Kendall provides students with transfer programs designed to facilitate the move to four-year institutions, programs that enhance and modernize professional and technical skills, and preparatory programs for licensing or certification.";
            campusTitle=@"Kendall Campus";
            [pageURL appendString:@"kendall/"];
            break;
        case 5:
            textToDisplay =@"950 NW 20th St. Miami, FL 33127\n305-237-4000\nIn 1977, Miami Dade College opened its Medical Campus on 4.3 acres within the city’s medical/ civic center complex. Along with the other members of this complex, the University of Miami School of Medicine, Jackson Memorial Hospital, Veterans Administration Hospital and Miami- Dade County Public Health Service, the Medical Campus forms the backbone of Miami’s health care community. The campus offers specialty disciplines in nursing and allied health, and state-of-the-art technologies help to ensure that students are prepared in these and other challenging medical careers.";
            campusTitle=@"Medical Campus ";
            [pageURL appendString:@"medical/"];
            break;
        case 6:
            textToDisplay =@"11380 NW 27th Ave. Miami, FL 33167-3495\n305-237-1000\nLocated on 245 acres in northern Miami-Dade County, this beautifully landscaped campus was the College’s first. It was built in 1960, on land that once hosted a World War II Naval air station. The main academic buildings of the Campus surround a serene lake and lush walking paths. The North Campus is a gateway for students wishing to upgrade skills and complete one-year certificate programs, prepare for licensing exams or start working on a bachelor’s degree";
            campusTitle=@"North Campus";
            [pageURL appendString:@"north/"];
            break;
        case 7:
            textToDisplay =@"6300 NW Seventh Ave. Miami, FL 33150\n305-237-1900\nThe Carrie P. Meek Entrepreneurial Education Center (MEEC) is a major outreach center of Miami Dade College North Campus, founded in 1989. The Meek Entrepreneurial Education Center offers a vast array of college credit and non-credit courses for both degree and non-degree seeking students. Additionally, there are opportunities to pursue certificate and vocational programs as well as take part in a variety of seminars, conferences and workshops. Students at the MEEC can obtain workforce and business skills training to enter the labor market or become successful entrepreneurs.";
            campusTitle=@"Entrepreneurial Education Center ";
            [pageURL appendString:@"north/campus-information/eec.aspx/"];
            break;
        case 8:
            textToDisplay =@"3800 NW 115th Ave. Doral, FL 33178\n305-237-8000\nThe West Campus was approved by the Florida State Board of Education in 2005 and became a designed branch campus of Miami Dade College in July 2017, with the approval of the Southern Association of Colleges and Schools Commission on Colleges. Serving one of the fastest-growing locales in Miami-Dade County, including Doral and surrounding areas, the West Campus offers courses toward the Associate in Arts and Associate in Science degrees. Corporate training programs are also offered at the campus, which opened for classes on March 1, 2006, and promises to be the next exciting learning environment for the greater Miami community. ";
            campusTitle=@"West Campus ";
            [pageURL appendString:@"west/"];
            break;
        case 9:
            textToDisplay =@"300 NE Second Ave. Miami, FL 33132\n305-237-3000\nThe Wolfson Campus opened in 1970 by holding classes in the storefronts of downtown Miami. With the completion of the campus’ first permanent facility in 1973, Wolfson catalyzed a downtown renaissance by hosting all manner of civic and cultural discourse. It is the only comprehensive urban campus in the city. Located within the city’s financial, governmental, technological and cultural hubs, Wolfson capitalizes on its unique geographic resource by offering programs in banking/financial services, business, computer technology, paralegal studies, architecture, economics, hospitality management, engineering, the arts, humanities and social sciences.";
            campusTitle=@"Wolfson Campus ";
            [pageURL appendString:@"wolfson/"];
            break;
        
    }
    
    self.campusTitleLabel.text = campusTitle;
    //self.campusDescriptions.text = textToDisplay;//Set appropriate campus information
    [self.campusDescriptions setText:textToDisplay];
    //Create attributed text with link to campus homepage
    NSURL *linkURL =[NSURL URLWithString:pageURL];
    NSMutableAttributedString *clickhereLink = [[NSMutableAttributedString alloc]initWithString:@"Click Here For More Information"];
    [clickhereLink addAttribute:NSLinkAttributeName value:linkURL range:NSMakeRange (0,[clickhereLink length])];
    self.linkTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.linkTextView.textAlignment = NSTextAlignmentCenter;
    if (pageNumber>0)
        self.linkTextView.attributedText = clickhereLink;
    else if (pageNumber<=0)//Don't display attributed text on welcome page
        self.linkTextView.text = @" ";
    
}
-(void)checkButtons
{
    if (pageNumber<=0)
        self.prevButtonOutlet.enabled = NO;
    else if (pageNumber>=9)
        self.nextButtonOutlet.enabled = NO;
    else
    {
        self.prevButtonOutlet.enabled = YES;
        self.nextButtonOutlet.enabled = YES;
    }
    
}
-(void)displayImage
{
    
    NSString *imgName = [[NSString alloc]init];
    switch(pageNumber)
    {
        case 0:
            imgName = @"mdc-logo";
            break;
        case 1:
            imgName = @"hialeah";
            break;
        case 2:
            imgName = @"homestead";
            break;
        case 3:
            imgName = @"iac";
            break;
        case 4:
            imgName = @"kendall";
            break;
        case 5:
            imgName = @"medical";
            break;
        case 6:
            imgName = @"meec";
            break;
        case 7:
            imgName = @"north";
            break;
        case 8:
            imgName = @"west-campus";
            break;
        case 9:
            imgName = @"wolfson";
            break;
    }
    //*If asset image is of file type '.png' no extension is needed
    //Assign UIImageView object the correct image
    self.imageGallery.image = [UIImage imageNamed: imgName];
    
}


@end
