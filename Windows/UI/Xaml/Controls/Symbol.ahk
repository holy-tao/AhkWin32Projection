#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a glyph from the **Segoe MDL2 Assets** font to use as the content of a [SymbolIcon](symbolicon.md).
 * @remarks
 * The Symbol enumeration is typically used to set the value of the [AppBarButton.Icon](appbarbutton_icon.md) property or the [SymbolIcon.Symbol](symbolicon_symbol.md) property. For more info and examples, see the documentation for [AppBarButton](appbarbutton.md) and [SymbolIcon](symbolicon.md).
 * 
 * If you would like to use a glyph from the **Segoe MDL2 Assets** font that is not included in the Symbol enum, then use a [FontIcon](fonticon.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symbol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Symbol extends Win32Enum{

    /**
     * E100 <img alt="Previous icon" src="images/segoe-mdl/e100.png" align="top" />
     * @type {Integer (Int32)}
     */
    static Previous => 57600

    /**
     * E101 <img alt="Next icon" src="images/segoe-mdl/e101.png" />
     * @type {Integer (Int32)}
     */
    static Next => 57601

    /**
     * E102 <img alt="Play icon" src="images/segoe-mdl/e102.png" />
     * @type {Integer (Int32)}
     */
    static Play => 57602

    /**
     * E103 <img alt="Pause icon" src="images/segoe-mdl/e103.png" />
     * @type {Integer (Int32)}
     */
    static Pause => 57603

    /**
     * E104 <img alt="Edit icon" src="images/segoe-mdl/e104.png" />
     * @type {Integer (Int32)}
     */
    static Edit => 57604

    /**
     * E105 <img alt="Save icon" src="images/segoe-mdl/e105.png" />
     * @type {Integer (Int32)}
     */
    static Save => 57605

    /**
     * E106 <img alt="Clear icon" src="images/segoe-mdl/e106.png" />
     * @type {Integer (Int32)}
     */
    static Clear => 57606

    /**
     * E107 <img alt="Delete icon" src="images/segoe-mdl/e107.png" />
     * @type {Integer (Int32)}
     */
    static Delete => 57607

    /**
     * E108 <img alt="Remove icon" src="images/segoe-mdl/e108.png" />
     * @type {Integer (Int32)}
     */
    static Remove => 57608

    /**
     * E109 <img alt="Add icon" src="images/segoe-mdl/e109.png" />
     * @type {Integer (Int32)}
     */
    static Add => 57609

    /**
     * E10A <img alt="Cancel icon" src="images/segoe-mdl/e10a.png" />
     * @type {Integer (Int32)}
     */
    static Cancel => 57610

    /**
     * E10B <img alt="Accept icon" src="images/segoe-mdl/e10b.png" />
     * @type {Integer (Int32)}
     */
    static Accept => 57611

    /**
     * E10C <img alt="More icon" src="images/segoe-mdl/e10c.png" />
     * @type {Integer (Int32)}
     */
    static More => 57612

    /**
     * E10D <img alt="Redo icon" src="images/segoe-mdl/e10d.png" />
     * @type {Integer (Int32)}
     */
    static Redo => 57613

    /**
     * E10E <img alt="Undo icon" src="images/segoe-mdl/e10e.png" />
     * @type {Integer (Int32)}
     */
    static Undo => 57614

    /**
     * E10F <img alt="Home icon" src="images/segoe-mdl/e10f.png" />
     * @type {Integer (Int32)}
     */
    static Home => 57615

    /**
     * E110 <img alt="Up icon" src="images/segoe-mdl/e110.png" />
     * @type {Integer (Int32)}
     */
    static Up => 57616

    /**
     * E111 <img alt="Forward icon" src="images/segoe-mdl/e111.png" />
     * @type {Integer (Int32)}
     */
    static Forward => 57617

    /**
     * E112 <img alt="Back icon" src="images/segoe-mdl/e112.png" />
     * @type {Integer (Int32)}
     */
    static Back => 57618

    /**
     * E113 <img alt="Favorite icon" src="images/segoe-mdl/e113.png" />
     * @type {Integer (Int32)}
     */
    static Favorite => 57619

    /**
     * E114 <img alt="Camera icon" src="images/segoe-mdl/e114.png" />
     * @type {Integer (Int32)}
     */
    static Camera => 57620

    /**
     * E115 <img alt="Setting icon" src="images/segoe-mdl/e115.png" />
     * @type {Integer (Int32)}
     */
    static Setting => 57621

    /**
     * E116 <img alt="Video icon" src="images/segoe-mdl/e116.png" />
     * @type {Integer (Int32)}
     */
    static Video => 57622

    /**
     * E117 <img alt="Sync icon" src="images/segoe-mdl/e117.png" />
     * @type {Integer (Int32)}
     */
    static Sync => 57623

    /**
     * E118 <img alt="Download icon" src="images/segoe-mdl/e118.png" />
     * @type {Integer (Int32)}
     */
    static Download => 57624

    /**
     * E119 <img alt="Mail icon" src="images/segoe-mdl/e119.png" />
     * @type {Integer (Int32)}
     */
    static Mail => 57625

    /**
     * E11A <img alt="Find icon" src="images/segoe-mdl/e11a.png" />
     * @type {Integer (Int32)}
     */
    static Find => 57626

    /**
     * E11B <img alt="Help icon" src="images/segoe-mdl/e11b.png" />
     * @type {Integer (Int32)}
     */
    static Help => 57627

    /**
     * E11C <img alt="Upload icon" src="images/segoe-mdl/e11c.png" />
     * @type {Integer (Int32)}
     */
    static Upload => 57628

    /**
     * E11D <img alt="Emoji icon" src="images/segoe-mdl/e11d.png" />
     * @type {Integer (Int32)}
     */
    static Emoji => 57629

    /**
     * E11E <img alt="Two Page icon" src="images/segoe-mdl/e11e.png" />
     * @type {Integer (Int32)}
     */
    static TwoPage => 57630

    /**
     * E11F <img alt="Leave Chat icon" src="images/segoe-mdl/e11f.png" />
     * @type {Integer (Int32)}
     */
    static LeaveChat => 57631

    /**
     * E120 <img alt="Mail Forward icon" src="images/segoe-mdl/e120.png" />
     * @type {Integer (Int32)}
     */
    static MailForward => 57632

    /**
     * E121 <img alt="Clock icon" src="images/segoe-mdl/e121.png" />
     * @type {Integer (Int32)}
     */
    static Clock => 57633

    /**
     * E122 <img alt="Send icon" src="images/segoe-mdl/e122.png" />
     * @type {Integer (Int32)}
     */
    static Send => 57634

    /**
     * E123 <img alt="Crop icon" src="images/segoe-mdl/e123.png" />
     * @type {Integer (Int32)}
     */
    static Crop => 57635

    /**
     * E124 <img alt="Rotate Camera icon" src="images/segoe-mdl/e124.png" />
     * @type {Integer (Int32)}
     */
    static RotateCamera => 57636

    /**
     * E125 <img alt="People icon" src="images/segoe-mdl/e125.png" />
     * @type {Integer (Int32)}
     */
    static People => 57637

    /**
     * E126 <img alt="Open Pane icon" src="images/segoe-mdl/e126.png" />
     * @type {Integer (Int32)}
     */
    static OpenPane => 57638

    /**
     * E127 <img alt="Close Pane icon" src="images/segoe-mdl/e127.png" />
     * @type {Integer (Int32)}
     */
    static ClosePane => 57639

    /**
     * E128 <img alt="World icon" src="images/segoe-mdl/e128.png" />
     * @type {Integer (Int32)}
     */
    static World => 57640

    /**
     * E129 <img alt="Flag icon" src="images/segoe-mdl/e129.png" />
     * @type {Integer (Int32)}
     */
    static Flag => 57641

    /**
     * E12A <img alt="Preview Link icon" src="images/segoe-mdl/e12a.png" />
     * @type {Integer (Int32)}
     */
    static PreviewLink => 57642

    /**
     * E12B <img alt="Globe icon" src="images/segoe-mdl/e12b.png" />
     * @type {Integer (Int32)}
     */
    static Globe => 57643

    /**
     * E12C <img alt="Trim icon" src="images/segoe-mdl/e12c.png" />
     * @type {Integer (Int32)}
     */
    static Trim => 57644

    /**
     * E12D <img alt="Attach Camera icon" src="images/segoe-mdl/e12d.png" />
     * @type {Integer (Int32)}
     */
    static AttachCamera => 57645

    /**
     * E12E <img alt="Zoom In icon" src="images/segoe-mdl/e12e.png" />
     * @type {Integer (Int32)}
     */
    static ZoomIn => 57646

    /**
     * E12F <img alt="Bookmarks icon" src="images/segoe-mdl/e12f.png" />
     * @type {Integer (Int32)}
     */
    static Bookmarks => 57647

    /**
     * E130 <img alt="Document icon" src="images/segoe-mdl/e130.png" />
     * @type {Integer (Int32)}
     */
    static Document => 57648

    /**
     * E131 <img alt="Protected Document icon" src="images/segoe-mdl/e131.png" />
     * @type {Integer (Int32)}
     */
    static ProtectedDocument => 57649

    /**
     * E132 <img alt="Page icon" src="images/segoe-mdl/e132.png" />
     * @type {Integer (Int32)}
     */
    static Page => 57650

    /**
     * E133 <img alt="Bullets icon" src="images/segoe-mdl/e133.png" />
     * @type {Integer (Int32)}
     */
    static Bullets => 57651

    /**
     * E134 <img alt="Comment icon" src="images/segoe-mdl/e134.png" />
     * @type {Integer (Int32)}
     */
    static Comment => 57652

    /**
     * E135 <img alt="Mail Filled icon" src="images/segoe-mdl/e135.png" />
     * @type {Integer (Int32)}
     */
    static MailFilled => 57653

    /**
     * E136 <img alt="Contact Info icon" src="images/segoe-mdl/e136.png" />
     * @type {Integer (Int32)}
     */
    static ContactInfo => 57654

    /**
     * E137 <img alt="Hang Up icon" src="images/segoe-mdl/e137.png" />
     * @type {Integer (Int32)}
     */
    static HangUp => 57655

    /**
     * E138 <img alt="View All icon" src="images/segoe-mdl/e138.png" />
     * @type {Integer (Int32)}
     */
    static ViewAll => 57656

    /**
     * E139 <img alt="Map Pin icon" src="images/segoe-mdl/e139.png" />
     * @type {Integer (Int32)}
     */
    static MapPin => 57657

    /**
     * E13A <img alt="Phone icon" src="images/segoe-mdl/e13a.png" />
     * @type {Integer (Int32)}
     */
    static Phone => 57658

    /**
     * E13B <img alt="Video Chat icon" src="images/segoe-mdl/e13b.png" />
     * @type {Integer (Int32)}
     */
    static VideoChat => 57659

    /**
     * E13C <img alt="Switch icon" src="images/segoe-mdl/e13c.png" />
     * @type {Integer (Int32)}
     */
    static Switch => 57660

    /**
     * E13D <img alt="Contact icon" src="images/segoe-mdl/e13d.png" />
     * @type {Integer (Int32)}
     */
    static Contact => 57661

    /**
     * E13E <img alt="Rename icon" src="images/segoe-mdl/e13e.png" />
     * @type {Integer (Int32)}
     */
    static Rename => 57662

    /**
     * E141 <img alt="Pin icon" src="images/segoe-mdl/e141.png" />
     * @type {Integer (Int32)}
     */
    static Pin => 57665

    /**
     * E142 <img alt="Music Info icon" src="images/segoe-mdl/e142.png" />
     * @type {Integer (Int32)}
     */
    static MusicInfo => 57666

    /**
     * E143 <img alt="Go icon" src="images/segoe-mdl/e143.png" />
     * @type {Integer (Int32)}
     */
    static Go => 57667

    /**
     * E144 <img alt="Keyboard icon" src="images/segoe-mdl/e144.png" />
     * @type {Integer (Int32)}
     */
    static Keyboard => 57668

    /**
     * E145 <img alt="Dock Left icon" src="images/segoe-mdl/e145.png" />
     * @type {Integer (Int32)}
     */
    static DockLeft => 57669

    /**
     * E146 <img alt="Dock Right icon" src="images/segoe-mdl/e146.png" />
     * @type {Integer (Int32)}
     */
    static DockRight => 57670

    /**
     * E147 <img alt="Dock Bottom icon" src="images/segoe-mdl/e147.png" />
     * @type {Integer (Int32)}
     */
    static DockBottom => 57671

    /**
     * E148 <img alt="Remote icon" src="images/segoe-mdl/e148.png" />
     * @type {Integer (Int32)}
     */
    static Remote => 57672

    /**
     * E149 <img alt="Refresh icon" src="images/segoe-mdl/e149.png" />
     * @type {Integer (Int32)}
     */
    static Refresh => 57673

    /**
     * E14A <img alt="Rotate icon" src="images/segoe-mdl/e14a.png" />
     * @type {Integer (Int32)}
     */
    static Rotate => 57674

    /**
     * E14B <img alt="Shuffle icon" src="images/segoe-mdl/e14b.png" />
     * @type {Integer (Int32)}
     */
    static Shuffle => 57675

    /**
     * E14C <img alt="List icon" src="images/segoe-mdl/e14c.png" />
     * @type {Integer (Int32)}
     */
    static List => 57676

    /**
     * E14D <img alt="Shop icon" src="images/segoe-mdl/e14d.png" />
     * @type {Integer (Int32)}
     */
    static Shop => 57677

    /**
     * E14E <img alt="Select All icon" src="images/segoe-mdl/e14e.png" />
     * @type {Integer (Int32)}
     */
    static SelectAll => 57678

    /**
     * E14F <img alt="Orientation icon" src="images/segoe-mdl/e14f.png" />
     * @type {Integer (Int32)}
     */
    static Orientation => 57679

    /**
     * E150 <img alt="Import icon" src="images/segoe-mdl/e150.png" />
     * @type {Integer (Int32)}
     */
    static Import => 57680

    /**
     * E151 <img alt="Import All icon" src="images/segoe-mdl/e151.png" />
     * @type {Integer (Int32)}
     */
    static ImportAll => 57681

    /**
     * E155 <img alt="Browse Photos icon" src="images/segoe-mdl/e155.png" />
     * @type {Integer (Int32)}
     */
    static BrowsePhotos => 57685

    /**
     * E156 <img alt="Web Cam icon" src="images/segoe-mdl/e156.png" />
     * @type {Integer (Int32)}
     */
    static WebCam => 57686

    /**
     * E158 <img alt="Pictures icon" src="images/segoe-mdl/e158.png" />
     * @type {Integer (Int32)}
     */
    static Pictures => 57688

    /**
     * E159 <img alt="Save Local icon" src="images/segoe-mdl/e159.png" />
     * @type {Integer (Int32)}
     */
    static SaveLocal => 57689

    /**
     * E15A <img alt="Caption icon" src="images/segoe-mdl/e15a.png" />
     * @type {Integer (Int32)}
     */
    static Caption => 57690

    /**
     * E15B <img alt="Stop icon" src="images/segoe-mdl/e15b.png" />
     * @type {Integer (Int32)}
     */
    static Stop => 57691

    /**
     * E15C <img alt="Show Results icon" src="images/segoe-mdl/e15c.png" />
     * @type {Integer (Int32)}
     */
    static ShowResults => 57692

    /**
     * E15D <img alt="Volume icon" src="images/segoe-mdl/e15d.png" />
     * @type {Integer (Int32)}
     */
    static Volume => 57693

    /**
     * E15E <img alt="Repair icon" src="images/segoe-mdl/e15e.png" />
     * @type {Integer (Int32)}
     */
    static Repair => 57694

    /**
     * E15F <img alt="Message icon" src="images/segoe-mdl/e15f.png" />
     * @type {Integer (Int32)}
     */
    static Message => 57695

    /**
     * E160 <img alt="Page2 icon" src="images/segoe-mdl/e160.png" />
     * @type {Integer (Int32)}
     */
    static Page2 => 57696

    /**
     * E161 <img alt="Calendar Day icon" src="images/segoe-mdl/e161.png" />
     * @type {Integer (Int32)}
     */
    static CalendarDay => 57697

    /**
     * E162 <img alt="Calendar Week icon" src="images/segoe-mdl/e162.png" />
     * @type {Integer (Int32)}
     */
    static CalendarWeek => 57698

    /**
     * E163 <img alt="Calendar icon" src="images/segoe-mdl/e163.png" />
     * @type {Integer (Int32)}
     */
    static Calendar => 57699

    /**
     * E164 <img alt="Character icon" src="images/segoe-mdl/e164.png" />
     * @type {Integer (Int32)}
     */
    static Character => 57700

    /**
     * E165 <img alt="Mail Reply All icon" src="images/segoe-mdl/e165.png" />
     * @type {Integer (Int32)}
     */
    static MailReplyAll => 57701

    /**
     * E166 <img alt="Read icon" src="images/segoe-mdl/e166.png" />
     * @type {Integer (Int32)}
     */
    static Read => 57702

    /**
     * E167 <img alt="Link icon" src="images/segoe-mdl/e167.png" />
     * @type {Integer (Int32)}
     */
    static Link => 57703

    /**
     * E168 <img alt="Account icon" src="images/segoe-mdl/e168.png" />
     * @type {Integer (Int32)}
     */
    static Account => 57704

    /**
     * E169 <img alt="Show BCC icon" src="images/segoe-mdl/e169.png" />
     * @type {Integer (Int32)}
     */
    static ShowBcc => 57705

    /**
     * E16A <img alt="Hide BCC icon" src="images/segoe-mdl/e16a.png" />
     * @type {Integer (Int32)}
     */
    static HideBcc => 57706

    /**
     * E16B <img alt="Cut icon" src="images/segoe-mdl/e16b.png" />
     * @type {Integer (Int32)}
     */
    static Cut => 57707

    /**
     * E16C <img alt="Attach icon" src="images/segoe-mdl/e16c.png" />
     * @type {Integer (Int32)}
     */
    static Attach => 57708

    /**
     * E16D <img alt="Paste icon" src="images/segoe-mdl/e16d.png" />
     * @type {Integer (Int32)}
     */
    static Paste => 57709

    /**
     * E16E <img alt="Filter icon" src="images/segoe-mdl/e16e.png" />
     * @type {Integer (Int32)}
     */
    static Filter => 57710

    /**
     * E16F <img alt="Copy icon" src="images/segoe-mdl/e16f.png" />
     * @type {Integer (Int32)}
     */
    static Copy => 57711

    /**
     * E170 <img alt="Emoji 2 icon" src="images/segoe-mdl/e170.png" />
     * @type {Integer (Int32)}
     */
    static Emoji2 => 57712

    /**
     * E171 <img alt="Important icon" src="images/segoe-mdl/e171.png" />
     * @type {Integer (Int32)}
     */
    static Important => 57713

    /**
     * E172 <img alt="Mail Reply icon" src="images/segoe-mdl/e172.png" />
     * @type {Integer (Int32)}
     */
    static MailReply => 57714

    /**
     * E173 <img alt="Slide Show icon" src="images/segoe-mdl/e173.png" />
     * @type {Integer (Int32)}
     */
    static SlideShow => 57715

    /**
     * E174 <img alt="Sort icon" src="images/segoe-mdl/e174.png" />
     * @type {Integer (Int32)}
     */
    static Sort => 57716

    /**
     * E178 <img alt="Manage icon" src="images/segoe-mdl/e178.png" />
     * @type {Integer (Int32)}
     */
    static Manage => 57720

    /**
     * E179 <img alt="All Apps icon" src="images/segoe-mdl/e179.png" />
     * @type {Integer (Int32)}
     */
    static AllApps => 57721

    /**
     * E17A <img alt="Disconnect Drive icon" src="images/segoe-mdl/e17a.png" />
     * @type {Integer (Int32)}
     */
    static DisconnectDrive => 57722

    /**
     * E17B <img alt="Map Drive icon" src="images/segoe-mdl/e17b.png" />
     * @type {Integer (Int32)}
     */
    static MapDrive => 57723

    /**
     * E17C <img alt="New Window icon" src="images/segoe-mdl/e17c.png" />
     * @type {Integer (Int32)}
     */
    static NewWindow => 57724

    /**
     * E17D <img alt="Open With icon" src="images/segoe-mdl/e17d.png" />
     * @type {Integer (Int32)}
     */
    static OpenWith => 57725

    /**
     * E181 <img alt="Contact Presence icon" src="images/segoe-mdl/e181.png" />
     * @type {Integer (Int32)}
     */
    static ContactPresence => 57729

    /**
     * E182 <img alt="Priority icon" src="images/segoe-mdl/e182.png" />
     * @type {Integer (Int32)}
     */
    static Priority => 57730

    /**
     * E184 <img alt="Go To Today icon" src="images/segoe-mdl/e184.png" />
     * @type {Integer (Int32)}
     */
    static GoToToday => 57732

    /**
     * E185 <img alt="Font icon" src="images/segoe-mdl/e185.png" />
     * @type {Integer (Int32)}
     */
    static Font => 57733

    /**
     * E186 <img alt="Font Color icon" src="images/segoe-mdl/e186.png" />
     * @type {Integer (Int32)}
     */
    static FontColor => 57734

    /**
     * E187 <img alt="Contact 2 icon" src="images/segoe-mdl/e187.png" />
     * @type {Integer (Int32)}
     */
    static Contact2 => 57735

    /**
     * E188 <img alt="Folder icon" src="images/segoe-mdl/e188.png" />
     * @type {Integer (Int32)}
     */
    static Folder => 57736

    /**
     * E189 <img alt="Audio icon" src="images/segoe-mdl/e189.png" />
     * @type {Integer (Int32)}
     */
    static Audio => 57737

    /**
     * E18A <img alt="Placeholder icon" src="images/segoe-mdl/e18a.png" />
     * @type {Integer (Int32)}
     */
    static Placeholder => 57738

    /**
     * E18B <img alt="View icon" src="images/segoe-mdl/e18b.png" />
     * @type {Integer (Int32)}
     */
    static View => 57739

    /**
     * E18C <img alt="Set Lock Screen icon" src="images/segoe-mdl/e18c.png" />
     * @type {Integer (Int32)}
     */
    static SetLockScreen => 57740

    /**
     * E18D <img alt="Set Tile icon" src="images/segoe-mdl/e18d.png" />
     * @type {Integer (Int32)}
     */
    static SetTile => 57741

    /**
     * E190 <img alt="Closed Caption icon" src="images/segoe-mdl/e190.png" />
     * @type {Integer (Int32)}
     */
    static ClosedCaption => 57744

    /**
     * E191 <img alt="Stop Slide Show icon" src="images/segoe-mdl/e191.png" />
     * @type {Integer (Int32)}
     */
    static StopSlideShow => 57745

    /**
     * E192 <img alt="Permissions icon" src="images/segoe-mdl/e192.png" />
     * @type {Integer (Int32)}
     */
    static Permissions => 57746

    /**
     * E193 <img alt="Highlight icon" src="images/segoe-mdl/e193.png" />
     * @type {Integer (Int32)}
     */
    static Highlight => 57747

    /**
     * E194 <img alt="Disable Updates icon" src="images/segoe-mdl/e194.png" />
     * @type {Integer (Int32)}
     */
    static DisableUpdates => 57748

    /**
     * E195 <img alt="Unfavorite icon" src="images/segoe-mdl/e195.png" />
     * @type {Integer (Int32)}
     */
    static UnFavorite => 57749

    /**
     * E196 <img alt="UnPin icon" src="images/segoe-mdl/e196.png" />
     * @type {Integer (Int32)}
     */
    static UnPin => 57750

    /**
     * E197 <img alt="Open Local icon" src="images/segoe-mdl/e197.png" />
     * @type {Integer (Int32)}
     */
    static OpenLocal => 57751

    /**
     * E198 <img alt="Mute icon" src="images/segoe-mdl/e198.png" />
     * @type {Integer (Int32)}
     */
    static Mute => 57752

    /**
     * E199 <img alt="Italic icon" src="images/segoe-mdl/e199.png" />
     * @type {Integer (Int32)}
     */
    static Italic => 57753

    /**
     * E19A <img alt="Underline icon" src="images/segoe-mdl/e19a.png" />
     * @type {Integer (Int32)}
     */
    static Underline => 57754

    /**
     * E19B <img alt="Bold icon" src="images/segoe-mdl/e19b.png" />
     * @type {Integer (Int32)}
     */
    static Bold => 57755

    /**
     * E19C <img alt="Move To Folder icon" src="images/segoe-mdl/e19c.png" />
     * @type {Integer (Int32)}
     */
    static MoveToFolder => 57756

    /**
     * E19D <img alt="Like Dislike icon" src="images/segoe-mdl/e19d.png" />
     * @type {Integer (Int32)}
     */
    static LikeDislike => 57757

    /**
     * E19E <img alt="Dislike icon" src="images/segoe-mdl/e19e.png" />
     * @type {Integer (Int32)}
     */
    static Dislike => 57758

    /**
     * E19F <img alt="Like icon" src="images/segoe-mdl/e19f.png" />
     * @type {Integer (Int32)}
     */
    static Like => 57759

    /**
     * E1A0 <img alt="Align Right icon" src="images/segoe-mdl/e1a0.png" />
     * @type {Integer (Int32)}
     */
    static AlignRight => 57760

    /**
     * E1A1 <img alt="Align Center icon" src="images/segoe-mdl/e1a1.png" />
     * @type {Integer (Int32)}
     */
    static AlignCenter => 57761

    /**
     * E1A2 <img alt="Align Left icon" src="images/segoe-mdl/e1a2.png" />
     * @type {Integer (Int32)}
     */
    static AlignLeft => 57762

    /**
     * E1A3 <img alt="Zoom icon" src="images/segoe-mdl/e1a3.png" />
     * @type {Integer (Int32)}
     */
    static Zoom => 57763

    /**
     * E1A4 <img alt="Zoom Out icon" src="images/segoe-mdl/e1a4.png" />
     * @type {Integer (Int32)}
     */
    static ZoomOut => 57764

    /**
     * E1A5 <img alt="Open File icon" src="images/segoe-mdl/e1a5.png" />
     * @type {Integer (Int32)}
     */
    static OpenFile => 57765

    /**
     * E1A6 <img alt="Other User icon" src="images/segoe-mdl/e1a6.png" />
     * @type {Integer (Int32)}
     */
    static OtherUser => 57766

    /**
     * E1A7 <img alt="Admin icon" src="images/segoe-mdl/e1a7.png" />
     * @type {Integer (Int32)}
     */
    static Admin => 57767

    /**
     * E1C3 <img alt="Street icon" src="images/segoe-mdl/e1c3.png" />
     * @type {Integer (Int32)}
     */
    static Street => 57795

    /**
     * E1C4 <img alt="Map icon" src="images/segoe-mdl/e1c4.png" />
     * @type {Integer (Int32)}
     */
    static Map => 57796

    /**
     * E1C5 <img alt="Clear Selection icon" src="images/segoe-mdl/e1c5.png" />
     * @type {Integer (Int32)}
     */
    static ClearSelection => 57797

    /**
     * E1C6 <img alt="Font Decrease icon" src="images/segoe-mdl/e1c6.png" />
     * @type {Integer (Int32)}
     */
    static FontDecrease => 57798

    /**
     * E1C7 <img alt="Font Increase icon" src="images/segoe-mdl/e1c7.png" />
     * @type {Integer (Int32)}
     */
    static FontIncrease => 57799

    /**
     * E1C8 <img alt="Font Size icon" src="images/segoe-mdl/e1c8.png" />
     * @type {Integer (Int32)}
     */
    static FontSize => 57800

    /**
     * E1C9 <img alt="Cell Phone icon" src="images/segoe-mdl/e1c9.png" />
     * @type {Integer (Int32)}
     */
    static CellPhone => 57801

    /**
     * E1CA <img alt="Reshare icon" src="images/segoe-mdl/e1ca.png" />
     * @type {Integer (Int32)}
     */
    static ReShare => 57802

    /**
     * E1CB <img alt="Tag icon" src="images/segoe-mdl/e1cb.png" />
     * @type {Integer (Int32)}
     */
    static Tag => 57803

    /**
     * E1CC <img alt="Repeat 1 icon" src="images/segoe-mdl/e1cc.png" />
     * @type {Integer (Int32)}
     */
    static RepeatOne => 57804

    /**
     * E1CD <img alt="Repeat All icon" src="images/segoe-mdl/e1cd.png" />
     * @type {Integer (Int32)}
     */
    static RepeatAll => 57805

    /**
     * E1CE <img alt="Outline Star icon" src="images/segoe-mdl/e1ce.png" />
     * @type {Integer (Int32)}
     */
    static OutlineStar => 57806

    /**
     * E1CF <img alt="Solid Star icon" src="images/segoe-mdl/e1cf.png" />
     * @type {Integer (Int32)}
     */
    static SolidStar => 57807

    /**
     * E1D0 <img alt="Calculator icon" src="images/segoe-mdl/e1d0.png" />
     * @type {Integer (Int32)}
     */
    static Calculator => 57808

    /**
     * E1D1 <img alt="Directions icon" src="images/segoe-mdl/e1d1.png" />
     * @type {Integer (Int32)}
     */
    static Directions => 57809

    /**
     * E1D2 <img alt="Target icon" src="images/segoe-mdl/e1d2.png" />
     * @type {Integer (Int32)}
     */
    static Target => 57810

    /**
     * E1D3 <img alt="Library icon" src="images/segoe-mdl/e1d3.png" />
     * @type {Integer (Int32)}
     */
    static Library => 57811

    /**
     * E1D4 <img alt="Phone Book icon" src="images/segoe-mdl/e1d4.png" />
     * @type {Integer (Int32)}
     */
    static PhoneBook => 57812

    /**
     * E1D5 <img alt="Memo icon" src="images/segoe-mdl/e1d5.png" />
     * @type {Integer (Int32)}
     */
    static Memo => 57813

    /**
     * E1D6 <img alt="Microphone icon" src="images/segoe-mdl/e1d6.png" />
     * @type {Integer (Int32)}
     */
    static Microphone => 57814

    /**
     * E1D7 <img alt="Post Update icon" src="images/segoe-mdl/e1d7.png" />
     * @type {Integer (Int32)}
     */
    static PostUpdate => 57815

    /**
     * E1D8 <img alt="Back To Window icon" src="images/segoe-mdl/e1d8.png" />
     * @type {Integer (Int32)}
     */
    static BackToWindow => 57816

    /**
     * E1D9 <img alt="Full Screen icon" src="images/segoe-mdl/e1d9.png" />
     * @type {Integer (Int32)}
     */
    static FullScreen => 57817

    /**
     * E1DA <img alt="New Folder icon" src="images/segoe-mdl/e1da.png" />
     * @type {Integer (Int32)}
     */
    static NewFolder => 57818

    /**
     * E1DB <img alt="Calendar Reply icon" src="images/segoe-mdl/e1db.png" />
     * @type {Integer (Int32)}
     */
    static CalendarReply => 57819

    /**
     * E1DD <img alt="Unsync Folder icon" src="images/segoe-mdl/e1dd.png" />
     * @type {Integer (Int32)}
     */
    static UnSyncFolder => 57821

    /**
     * E1DE <img alt="Report Hacked icon" src="images/segoe-mdl/e1de.png" />
     * @type {Integer (Int32)}
     */
    static ReportHacked => 57822

    /**
     * E1DF <img alt="Sync Folder icon" src="images/segoe-mdl/e1df.png" />
     * @type {Integer (Int32)}
     */
    static SyncFolder => 57823

    /**
     * E1E0 <img alt="Block Contact icon" src="images/segoe-mdl/e1e0.png" />
     * @type {Integer (Int32)}
     */
    static BlockContact => 57824

    /**
     * E1E1 <img alt="Switch Apps  icon" src="images/segoe-mdl/e1e1.png" />
     * @type {Integer (Int32)}
     */
    static SwitchApps => 57825

    /**
     * E1E2 <img alt="Add Friend icon" src="images/segoe-mdl/e1e2.png" />
     * @type {Integer (Int32)}
     */
    static AddFriend => 57826

    /**
     * E1E3 <img alt="Touch Pointer icon" src="images/segoe-mdl/e1e3.png" />
     * @type {Integer (Int32)}
     */
    static TouchPointer => 57827

    /**
     * E1E4 <img alt="Go To Start icon" src="images/segoe-mdl/e1e4.png" />
     * @type {Integer (Int32)}
     */
    static GoToStart => 57828

    /**
     * E1E5 <img alt="Zero Bars icon" src="images/segoe-mdl/e1e5.png" />
     * @type {Integer (Int32)}
     */
    static ZeroBars => 57829

    /**
     * E1E6 <img alt="One Bar icon" src="images/segoe-mdl/e1e6.png" />
     * @type {Integer (Int32)}
     */
    static OneBar => 57830

    /**
     * E1E7 <img alt="Two Bars icon" src="images/segoe-mdl/e1e7.png" />
     * @type {Integer (Int32)}
     */
    static TwoBars => 57831

    /**
     * E1E8 <img alt="Three Bars icon" src="images/segoe-mdl/e1e8.png" />
     * @type {Integer (Int32)}
     */
    static ThreeBars => 57832

    /**
     * E1E9 <img alt="Four Bars icon" src="images/segoe-mdl/e1e9.png" />
     * @type {Integer (Int32)}
     */
    static FourBars => 57833

    /**
     * E294 <img alt="Scan icon" src="images/segoe-mdl/e294.png" />
     * @type {Integer (Int32)}
     */
    static Scan => 58004

    /**
     * E295 <img alt="Preview icon" src="images/segoe-mdl/e295.png" />
     * @type {Integer (Int32)}
     */
    static Preview => 58005

    /**
     * E700 <img alt="GlobalNav icon" src="images/segoe-mdl/e700.png" />
     * @type {Integer (Int32)}
     */
    static GlobalNavigationButton => 59136

    /**
     * E72D <img alt="Share icon" src="images/segoe-mdl/e72d.png" />
     * @type {Integer (Int32)}
     */
    static Share => 59181

    /**
     * E749 <img alt="Print icon" src="images/segoe-mdl/e749.png" />
     * @type {Integer (Int32)}
     */
    static Print => 59209

    /**
     * E990 <img alt="Xbox icon" src="images/segoe-mdl/e990.png" />
     * @type {Integer (Int32)}
     */
    static XboxOneConsole => 59792
}
