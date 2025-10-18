#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class MediaPlayer {

;@region Constants

    /**
     * @type {String}
     */
    static CLSID_XFeedsManager => "{fe6b11c3-c72e-4061-86c6-9d163121f229}"

    /**
     * @type {Integer (UInt32)}
     */
    static WMPGC_FLAGS_ALLOW_PREROLL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMPGC_FLAGS_SUPPRESS_DIALOGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMPGC_FLAGS_IGNORE_AV_SYNC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMPGC_FLAGS_DISABLE_PLUGINS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WMPGC_FLAGS_USE_CUSTOM_GRAPH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WMPUE_EC_USER => 33024

    /**
     * @type {Integer (UInt32)}
     */
    static WMP_MDRT_FLAGS_UNREPORTED_DELETED_ITEMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMP_MDRT_FLAGS_UNREPORTED_ADDED_ITEMS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_WMP_METADATA_ROUND_TRIP => 827346263

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_WMP_DEVICE_CAN_SYNC => 844123479

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECT_CANGOFULLSCREEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECT_HASPROPERTYPAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECT_VARIABLEFREQSTEP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECT_WINDOWEDONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECT2_FULLSCREENEXCLUSIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SA_BUFFER_SIZE => 1024

    /**
     * @type {String}
     */
    static PLUGIN_INSTALLREGKEY => "Software\Microsoft\MediaPlayer\UIPlugins"

    /**
     * @type {String}
     */
    static PLUGIN_INSTALLREGKEY_FRIENDLYNAME => "FriendlyName"

    /**
     * @type {String}
     */
    static PLUGIN_INSTALLREGKEY_DESCRIPTION => "Description"

    /**
     * @type {String}
     */
    static PLUGIN_INSTALLREGKEY_CAPABILITIES => "Capabilities"

    /**
     * @type {String}
     */
    static PLUGIN_INSTALLREGKEY_UNINSTALL => "UninstallPath"

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_TYPE_BACKGROUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_TYPE_SEPARATEWINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_TYPE_DISPLAYAREA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_TYPE_SETTINGSAREA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_TYPE_METADATAAREA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_HASPROPERTYPAGE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_INSTALLAUTORUN => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_LAUNCHPROPERTYPAGE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_ACCEPTSMEDIA => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_ACCEPTSPLAYLISTS => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_HASPRESETS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_FLAGS_HIDDEN => 33554432

    /**
     * @type {String}
     */
    static PLUGIN_MISC_PRESETCOUNT => "PresetCount"

    /**
     * @type {String}
     */
    static PLUGIN_MISC_PRESETNAMES => "PresetNames"

    /**
     * @type {String}
     */
    static PLUGIN_MISC_CURRENTPRESET => "CurrentPreset"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_RESIZABLE => "Resizable"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_DEFAULTWIDTH => "DefaultWidth"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_DEFAULTHEIGHT => "DefaultHeight"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_MINWIDTH => "MinWidth"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_MINHEIGHT => "MinHeight"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_MAXWIDTH => "MaxWidth"

    /**
     * @type {String}
     */
    static PLUGIN_SEPARATEWINDOW_MAXHEIGHT => "MaxHeight"

    /**
     * @type {String}
     */
    static PLUGIN_MISC_QUERYDESTROY => "QueryDestroy"

    /**
     * @type {String}
     */
    static PLUGIN_ALL_MEDIASENDTO => "MediaSendTo"

    /**
     * @type {String}
     */
    static PLUGIN_ALL_PLAYLISTSENDTO => "PlaylistSendTo"

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_DEVICEAVAILABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_BACKGROUNDPROCESSING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_IS_CONTENTPARTNER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_ALTLOGIN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_ALLOWPLAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_ALLOWCDBURN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_ALLOWPDATRANSFER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_PREPAREFORSYNC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_V1_CAPS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPTION_CAP_UILESSMODE_ALLOWPLAY => 256

    /**
     * @type {String}
     */
    static WMP_SUBSCR_DL_TYPE_BACKGROUND => "background"

    /**
     * @type {String}
     */
    static WMP_SUBSCR_DL_TYPE_REALTIME => "real time"

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_RootFolder => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_IsSubscribed => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_ExistsFeed => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_GetFeed => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_ExistsFolder => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_GetFolder => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_DeleteFeed => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_DeleteFolder => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_GetFeedByUrl => 4104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_BackgroundSync => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_BackgroundSyncStatus => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_DefaultInterval => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_AsyncSyncAll => 4108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_Normalize => 4109

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDS_ItemCountLimit => 4110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDSENUM_Count => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDSENUM_Item => 8193

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Feeds => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Subfolders => 12289

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_CreateFeed => 12290

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_CreateSubfolder => 12291

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_ExistsFeed => 12292

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_GetFeed => 12293

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_ExistsSubfolder => 12294

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_GetSubfolder => 12295

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Delete => 12296

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Name => 12297

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Rename => 12298

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Path => 12299

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Move => 12300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_Parent => 12301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_IsRoot => 12302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_TotalUnreadItemCount => 12303

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_TotalItemCount => 12304

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDER_GetWatcher => 12305

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Xml => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Name => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Rename => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Url => 16387

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LocalId => 16388

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Path => 16389

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Move => 16390

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Parent => 16391

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LastWriteTime => 16392

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Delete => 16393

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Download => 16394

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_AsyncDownload => 16395

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_CancelAsyncDownload => 16396

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Interval => 16397

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_SyncSetting => 16398

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LastDownloadTime => 16399

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LocalEnclosurePath => 16400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Items => 16401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_GetItem => 16402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Title => 16403

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Description => 16404

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Link => 16405

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Image => 16406

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LastBuildDate => 16407

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_PubDate => 16408

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Ttl => 16409

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Language => 16410

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Copyright => 16411

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_DownloadEnclosuresAutomatically => 16412

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_DownloadStatus => 16413

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LastDownloadError => 16414

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Merge => 16415

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_DownloadUrl => 16416

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_IsList => 16417

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_MarkAllItemsRead => 16418

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_GetWatcher => 16419

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_UnreadItemCount => 16420

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_ItemCount => 16421

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_MaxItemCount => 16422

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_GetItemByEffectiveId => 16423

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_LastItemDownloadTime => 16424

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Username => 16425

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_Password => 16426

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_SetCredentials => 16427

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEED_ClearCredentials => 16428

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Xml => 20480

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Title => 20481

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Link => 20482

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Guid => 20483

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Description => 20484

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_PubDate => 20485

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Comments => 20486

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Author => 20487

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Enclosure => 20488

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_IsRead => 20489

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_LocalId => 20490

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Parent => 20491

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Delete => 20492

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_DownloadUrl => 20493

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_LastDownloadTime => 20494

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_Modified => 20495

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDITEM_EffectiveId => 20496

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_Url => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_Type => 24577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_Length => 24578

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_AsyncDownload => 24579

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_CancelAsyncDownload => 24580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_DownloadStatus => 24581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_LastDownloadError => 24582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_LocalPath => 24583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_Parent => 24584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_DownloadUrl => 24585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_DownloadMimeType => 24586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_RemoveFile => 24587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDENCLOSURE_SetFile => 24588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_Error => 28672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FolderAdded => 28673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FolderDeleted => 28674

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FolderRenamed => 28675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FolderMovedFrom => 28676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FolderMovedTo => 28677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FolderItemCountChanged => 28678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedAdded => 28679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedDeleted => 28680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedRenamed => 28681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedUrlChanged => 28682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedMovedFrom => 28683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedMovedTo => 28684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedDownloading => 28685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedDownloadCompleted => 28686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDFOLDEREVENTS_FeedItemCountChanged => 28687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_Error => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedDeleted => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedRenamed => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedUrlChanged => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedMoved => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedDownloading => 32773

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedDownloadCompleted => 32774

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FEEDEVENTS_FeedItemCountChanged => 32775

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DELTA => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_URL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_OPENSTATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_CLOSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_CONTROLS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_SETTINGS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_CURRENTMEDIA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_NETWORK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_MEDIACOLLECTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_PLAYLISTCOLLECTION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_PLAYSTATE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_VERSIONINFO => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_LAUNCHURL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_CURRENTPLAYLIST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_CDROMCOLLECTION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_CLOSEDCAPTION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_ISONLINE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_ERROR => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_STATUS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_LAST => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_BASE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_ENABLED => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_TRANSPARENTATSTART => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_FULLSCREEN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_ENABLECONTEXTMENU => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_UIMODE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX_LAST => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX2_BASE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX2_STRETCHTOFIT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX2_WINDOWLESSVIDEO => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX4_ISREMOTE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX4_PLAYERAPPLICATION => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCX4_OPENPLAYER => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE2_BASE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE2_DVD => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE3_NEWPLAYLIST => 41

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE3_NEWMEDIA => 42

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_PLAY => 51

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_STOP => 52

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_PAUSE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_FASTFORWARD => 54

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_FASTREVERSE => 55

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_CURRENTPOSITION => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_CURRENTPOSITIONSTRING => 57

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_NEXT => 58

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_PREVIOUS => 59

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_CURRENTITEM => 60

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_CURRENTMARKER => 61

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_ISAVAILABLE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_PLAYITEM => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS2_STEP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_AUDIOLANGUAGECOUNT => 65

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_GETAUDIOLANGUAGEID => 66

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_GETAUDIOLANGUAGEDESC => 67

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_CURRENTAUDIOLANGUAGE => 68

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_CURRENTAUDIOLANGUAGEINDEX => 69

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_GETLANGUAGENAME => 70

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS3_CURRENTPOSITIONTIMECODE => 71

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLSFAKE_TIMECOMPRESSION => 72

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_AUTOSTART => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_BALANCE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_INVOKEURLS => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_MUTE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_PLAYCOUNT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_RATE => 106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_VOLUME => 107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_BASEURL => 108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_DEFAULTFRAME => 109

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_GETMODE => 110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_SETMODE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_ENABLEERRORDIALOGS => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_ISAVAILABLE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS2_DEFAULTAUDIOLANGUAGE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS2_LIBRARYACCESSRIGHTS => 115

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS2_REQUESTLIBRARYACCESSRIGHTS => 116

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_COUNT => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_NAME => 202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_GETITEMINFO => 203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_SETITEMINFO => 204

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_CLEAR => 205

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_INSERTITEM => 206

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_APPENDITEM => 207

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_REMOVEITEM => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_MOVEITEM => 209

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_ATTRIBUTECOUNT => 210

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_ATTRIBUTENAME => 211

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_ITEM => 212

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_ISIDENTICAL => 213

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROM_DRIVESPECIFIER => 251

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROM_PLAYLIST => 252

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROM_EJECT => 253

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROMCOLLECTION_COUNT => 301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROMCOLLECTION_ITEM => 302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROMCOLLECTION_GETBYDRIVESPECIFIER => 303

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROMCOLLECTION_STARTMONITORINGCDROMS => 304

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROMCOLLECTION_STOPMONITORINGCDROMS => 305

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION_COUNT => 401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION_ITEM => 402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_ADD => 452

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETALL => 453

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETBYNAME => 454

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETBYGENRE => 455

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETBYAUTHOR => 456

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETBYALBUM => 457

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETBYATTRIBUTE => 458

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_REMOVE => 459

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETATTRIBUTESTRINGCOLLECTION => 461

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_NEWQUERY => 462

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_STARTMONITORING => 463

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_STOPMONITORING => 464

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_STARTCONTENTSCAN => 465

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_STOPCONTENTSCAN => 466

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_STARTSEARCH => 467

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_STOPSEARCH => 468

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_UPDATEMETADATA => 469

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETMEDIAATOM => 470

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_SETDELETED => 471

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_ISDELETED => 472

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_GETBYQUERYDESCRIPTION => 473

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_FREEZECOLLECTIONCHANGE => 474

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_UNFREEZECOLLECTIONCHANGE => 475

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_POSTCOLLECTIONCHANGE => 476

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTARRAY_COUNT => 501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTARRAY_ITEM => 502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_NEWPLAYLIST => 552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_GETALL => 553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_GETBYNAME => 554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_GETBYQUERYDESCRIPTION => 555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_REMOVE => 556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_NEWQUERY => 557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_STARTMONITORING => 558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_STOPMONITORING => 559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_SETDELETED => 560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_ISDELETED => 561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_IMPORTPLAYLIST => 562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_SOURCEURL => 751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_IMAGESOURCEWIDTH => 752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_IMAGESOURCEHEIGHT => 753

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_MARKERCOUNT => 754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_GETMARKERTIME => 755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_GETMARKERNAME => 756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_DURATION => 757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_DURATIONSTRING => 758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_ATTRIBUTECOUNT => 759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_GETATTRIBUTENAME => 760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_GETITEMINFO => 761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_SETITEMINFO => 762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_ISIDENTICAL => 763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_NAME => 764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_GETITEMINFOBYATOM => 765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_ISMEMBEROF => 766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_ISREADONLYITEM => 767

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA2_ERROR => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA3_GETATTRIBUTECOUNTBYTYPE => 769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA3_GETITEMINFOBYTYPE => 770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_BANDWIDTH => 801

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_RECOVEREDPACKETS => 802

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_SOURCEPROTOCOL => 803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_RECEIVEDPACKETS => 804

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_LOSTPACKETS => 805

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_RECEPTIONQUALITY => 806

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_BUFFERINGCOUNT => 807

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_BUFFERINGPROGRESS => 808

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_BUFFERINGTIME => 809

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_FRAMERATE => 810

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_MAXBITRATE => 811

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_BITRATE => 812

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_GETPROXYSETTINGS => 813

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_SETPROXYSETTINGS => 814

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_GETPROXYNAME => 815

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_SETPROXYNAME => 816

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_GETPROXYPORT => 817

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_SETPROXYPORT => 818

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_GETPROXYEXCEPTIONLIST => 819

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_SETPROXYEXCEPTIONLIST => 820

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_GETPROXYBYPASSFORLOCAL => 821

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_SETPROXYBYPASSFORLOCAL => 822

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_MAXBANDWIDTH => 823

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_DOWNLOADPROGRESS => 824

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_ENCODEDFRAMERATE => 825

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_FRAMESSKIPPED => 826

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERROR_CLEARERRORQUEUE => 851

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERROR_ERRORCOUNT => 852

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERROR_ITEM => 853

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERROR_WEBHELP => 854

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM_ERRORCODE => 901

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM_ERRORDESCRIPTION => 902

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM_ERRORCONTEXT => 903

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM_REMEDY => 904

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM_CUSTOMURL => 905

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM2_CONDITION => 906

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION_SAMISTYLE => 951

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION_SAMILANG => 952

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION_SAMIFILENAME => 953

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION_CAPTIONINGID => 954

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION2_GETLANGCOUNT => 955

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION2_GETLANGNAME => 956

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION2_GETLANGID => 957

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION2_GETSTYLECOUNT => 958

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION2_GETSTYLENAME => 959

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_ISAVAILABLE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_DOMAIN => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_TOPMENU => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_TITLEMENU => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_BACK => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_RESUME => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_PICTURE_MIMETYPE => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_PICTURE_PICTURETYPE => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_PICTURE_DESCRIPTION => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_PICTURE_URL => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_TEXT_TEXT => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_TEXT_DESCRIPTION => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYERAPP_SWITCHTOPLAYERAPPLICATION => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYERAPP_SWITCHTOCONTROL => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYERAPP_PLAYERDOCKED => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYERAPP_HASDISPLAY => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYERAPP_REMOTESTATUS => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADMANAGER_GETDOWNLOADCOLLECTION => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADMANAGER_CREATEDOWNLOADCOLLECTION => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_ID => 1201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_COUNT => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_ITEM => 1203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_STARTDOWNLOAD => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_REMOVEITEM => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_CLEAR => 1206

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_SOURCEURL => 1251

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_SIZE => 1252

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_TYPE => 1253

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_PROGRESS => 1254

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_DOWNLOADSTATE => 1255

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_PAUSE => 1256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_RESUME => 1257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_CANCEL => 1258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM2_GETITEMINFO => 1301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPQUERY_ADDCONDITION => 1351

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPQUERY_BEGINNEXTGROUP => 1352

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION2_CREATEQUERY => 1401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION2_GETPLAYLISTBYQUERY => 1402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION2_GETSTRINGCOLLBYQUERY => 1403

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION2_GETBYATTRANDMEDIATYPE => 1404

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION2_ISIDENTICAL => 1451

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION2_GETITEMINFO => 1452

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION2_GETATTRCOUNTBYTYPE => 1453

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION2_GETITEMINFOBYTYPE => 1454

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCORE_MAX => 1454

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_BASE => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_OPENSTATECHANGE => 5001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_STATUSCHANGE => 5002

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_CONTROL_BASE => 5100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_PLAYSTATECHANGE => 5101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_AUDIOLANGUAGECHANGE => 5102

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_SEEK_BASE => 5200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_ENDOFSTREAM => 5201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_POSITIONCHANGE => 5202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MARKERHIT => 5203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_DURATIONUNITCHANGE => 5204

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_CONTENT_BASE => 5300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_SCRIPTCOMMAND => 5301

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_NETWORK_BASE => 5400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_DISCONNECT => 5401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_BUFFERING => 5402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_NEWSTREAM => 5403

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_ERROR_BASE => 5500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_ERROR => 5501

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_WARNING_BASE => 5600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_WARNING => 5601

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_CDROM_BASE => 5700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_CDROMMEDIACHANGE => 5701

    /**
     * @type {Integer (UInt32)}
     */
    static WMPCOREEVENT_PLAYLIST_BASE => 5800

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_PLAYLISTCHANGE => 5801

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACHANGE => 5802

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_CURRENTMEDIAITEMAVAILABLE => 5803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_CURRENTPLAYLISTCHANGE => 5804

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_CURRENTPLAYLISTITEMAVAILABLE => 5805

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_CURRENTITEMCHANGE => 5806

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONCHANGE => 5807

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONATTRIBUTESTRINGADDED => 5808

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONATTRIBUTESTRINGREMOVED => 5809

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_PLAYLISTCOLLECTIONCHANGE => 5810

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_PLAYLISTCOLLECTIONPLAYLISTADDED => 5811

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_PLAYLISTCOLLECTIONPLAYLISTREMOVED => 5812

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONCONTENTSCANADDEDITEM => 5813

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONCONTENTSCANPROGRESS => 5814

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONSEARCHFOUNDITEM => 5815

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONSEARCHPROGRESS => 5816

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONSEARCHCOMPLETE => 5817

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_PLAYLISTCOLLECTIONPLAYLISTSETASDELETED => 5818

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MODECHANGE => 5819

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONATTRIBUTESTRINGCHANGED => 5820

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIAERROR => 5821

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_DOMAINCHANGE => 5822

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_OPENPLAYLISTSWITCH => 5823

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_STRINGCOLLECTIONCHANGE => 5824

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONMEDIAADDED => 5825

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCOREEVENT_MEDIACOLLECTIONMEDIAREMOVED => 5826

    /**
     * @type {Integer (UInt32)}
     */
    static WMPOCXEVENT_BASE => 6500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_SWITCHEDTOPLAYERAPPLICATION => 6501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_SWITCHEDTOCONTROL => 6502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_PLAYERDOCKEDSTATECHANGE => 6503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_PLAYERRECONNECT => 6504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CLICK => 6505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DOUBLECLICK => 6506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_KEYDOWN => 6507

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_KEYPRESS => 6508

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_KEYUP => 6509

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_MOUSEDOWN => 6510

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_MOUSEMOVE => 6511

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_MOUSEUP => 6512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DEVICECONNECT => 6513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DEVICEDISCONNECT => 6514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DEVICESTATUSCHANGE => 6515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DEVICESYNCSTATECHANGE => 6516

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DEVICESYNCERROR => 6517

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CREATEPARTNERSHIPCOMPLETE => 6518

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CDROMRIPSTATECHANGE => 6519

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CDROMRIPMEDIAERROR => 6520

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CDROMBURNSTATECHANGE => 6521

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CDROMBURNMEDIAERROR => 6522

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_CDROMBURNERROR => 6523

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_LIBRARYCONNECT => 6524

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_LIBRARYDISCONNECT => 6525

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_FOLDERSCANSTATECHANGE => 6526

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPOCXEVENT_DEVICEESTIMATION => 6527

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCONTROLS_BASE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSETTINGS_BASE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLIST_BASE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROM_BASE => 250

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCDROMCOLLECTION_BASE => 300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION_BASE => 400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION_BASE => 450

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTARRAY_BASE => 500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYLISTCOLLECTION_BASE => 550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIA_BASE => 750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPNETWORK_BASE => 800

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERROR_BASE => 850

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPERRORITEM_BASE => 900

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPCLOSEDCAPTION_BASE => 950

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDVD_BASE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMETADATA_BASE => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPPLAYERAPP_BASE => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADMANAGER_BASE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADCOLLECTION_BASE => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM_BASE => 1250

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPDOWNLOADITEM2_BASE => 1300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPQUERY_BASE => 1350

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPMEDIACOLLECTION2_BASE => 1400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WMPSTRINGCOLLECTION2_BASE => 1450

    /**
     * @type {String}
     */
    static CLSID_WMPSkinManager => "{b2a7fd52-301f-4348-b93a-638c6de49229}"

    /**
     * @type {String}
     */
    static CLSID_WMPMediaPluginRegistrar => "{5569e7f5-424b-4b93-89ca-79d17924689a}"

    /**
     * @type {String}
     */
    static WMP_PLUGINTYPE_DSP => "{6434baea-4954-498d-abd5-2b07123e1f04}"

    /**
     * @type {String}
     */
    static WMP_PLUGINTYPE_DSP_OUTOFPROC => "{ef29b174-c347-44cc-9a4f-2399118ff38c}"

    /**
     * @type {String}
     */
    static WMP_PLUGINTYPE_RENDERING => "{a8554541-115d-406a-a4c7-51111c330183}"

    /**
     * @type {Integer (Single)}
     */
    static kfltTimedLevelMaximumFrequency => 22050

    /**
     * @type {Integer (Single)}
     */
    static kfltTimedLevelMinimumFrequency => 20

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_LoginState => "LoginState"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_MediaPlayerAccountType => "MediaPlayerAccountType"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_AccountType => "AccountType"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_HasCachedCredentials => "HasCachedCredentials"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_LicenseRefreshAdvanceWarning => "LicenseRefreshAdvanceWarning"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_PurchasedTrackRequiresReDownload => "PurchasedTrackRequiresReDownload"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_MaximumTrackPurchasePerPurchase => "MaximumNumberOfTracksPerPurchase"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_AccountBalance => "AccountBalance"

    /**
     * @type {String}
     */
    static g_szContentPartnerInfo_UserName => "UserName"

    /**
     * @type {String}
     */
    static g_szMediaPlayerTask_Burn => "Burn"

    /**
     * @type {String}
     */
    static g_szMediaPlayerTask_Browse => "Browse"

    /**
     * @type {String}
     */
    static g_szMediaPlayerTask_Sync => "Sync"

    /**
     * @type {String}
     */
    static g_szItemInfo_PopupURL => "Popup"

    /**
     * @type {String}
     */
    static g_szItemInfo_AuthenticationSuccessURL => "AuthenticationSuccessURL"

    /**
     * @type {String}
     */
    static g_szItemInfo_LoginFailureURL => "LoginFailureURL"

    /**
     * @type {String}
     */
    static g_szItemInfo_HTMLViewURL => "HTMLViewURL"

    /**
     * @type {String}
     */
    static g_szItemInfo_PopupCaption => "PopupCaption"

    /**
     * @type {String}
     */
    static g_szItemInfo_ALTLoginURL => "ALTLoginURL"

    /**
     * @type {String}
     */
    static g_szItemInfo_ALTLoginCaption => "ALTLoginCaption"

    /**
     * @type {String}
     */
    static g_szItemInfo_ForgetPasswordURL => "ForgotPassword"

    /**
     * @type {String}
     */
    static g_szItemInfo_CreateAccountURL => "CreateAccount"

    /**
     * @type {String}
     */
    static g_szItemInfo_ArtistArtURL => "ArtistArt"

    /**
     * @type {String}
     */
    static g_szItemInfo_AlbumArtURL => "AlbumArt"

    /**
     * @type {String}
     */
    static g_szItemInfo_ListArtURL => "ListArt"

    /**
     * @type {String}
     */
    static g_szItemInfo_GenreArtURL => "GenreArt"

    /**
     * @type {String}
     */
    static g_szItemInfo_SubGenreArtURL => "SubGenreArt"

    /**
     * @type {String}
     */
    static g_szItemInfo_RadioArtURL => "RadioArt"

    /**
     * @type {String}
     */
    static g_szItemInfo_TreeListIconURL => "CPListIDIcon"

    /**
     * @type {String}
     */
    static g_szItemInfo_ErrorDescription => "CPErrorDescription"

    /**
     * @type {String}
     */
    static g_szItemInfo_ErrorURL => "CPErrorURL"

    /**
     * @type {String}
     */
    static g_szItemInfo_ErrorURLLinkText => "CPErrorURLLinkText"

    /**
     * @type {String}
     */
    static g_szUnknownLocation => "UnknownLocation"

    /**
     * @type {String}
     */
    static g_szRootLocation => "RootLocation"

    /**
     * @type {String}
     */
    static g_szFlyoutMenu => "FlyoutMenu"

    /**
     * @type {String}
     */
    static g_szOnlineStore => "OnlineStore"

    /**
     * @type {String}
     */
    static g_szVideoRecent => "VideoRecent"

    /**
     * @type {String}
     */
    static g_szVideoRoot => "VideoRoot"

    /**
     * @type {String}
     */
    static g_szCPListID => "CPListID"

    /**
     * @type {String}
     */
    static g_szAllCPListIDs => "AllCPListIDs"

    /**
     * @type {String}
     */
    static g_szCPTrackID => "CPTrackID"

    /**
     * @type {String}
     */
    static g_szAllCPTrackIDs => "AllCPTrackIDs"

    /**
     * @type {String}
     */
    static g_szCPArtistID => "CPArtistID"

    /**
     * @type {String}
     */
    static g_szAllCPArtistIDs => "AllCPArtistIDs"

    /**
     * @type {String}
     */
    static g_szCPAlbumID => "CPAlbumID"

    /**
     * @type {String}
     */
    static g_szAllCPAlbumIDs => "AllCPAlbumIDs"

    /**
     * @type {String}
     */
    static g_szCPGenreID => "CPGenreID"

    /**
     * @type {String}
     */
    static g_szAllCPGenreIDs => "AllCPGenreIDs"

    /**
     * @type {String}
     */
    static g_szCPAlbumSubGenreID => "CPAlbumSubGenreID"

    /**
     * @type {String}
     */
    static g_szAllCPAlbumSubGenreIDs => "AllCPAlbumSubGenreIDs"

    /**
     * @type {String}
     */
    static g_szReleaseDateYear => "ReleaseDateYear"

    /**
     * @type {String}
     */
    static g_szAllReleaseDateYears => "AllReleaseDateYears"

    /**
     * @type {String}
     */
    static g_szCPRadioID => "CPRadioID"

    /**
     * @type {String}
     */
    static g_szAllCPRadioIDs => "AllCPRadioIDs"

    /**
     * @type {String}
     */
    static g_szAuthor => "Author"

    /**
     * @type {String}
     */
    static g_szAllAuthors => "AllAuthors"

    /**
     * @type {String}
     */
    static g_szWMParentalRating => "WMParentalRating"

    /**
     * @type {String}
     */
    static g_szAllWMParentalRatings => "AllWMParentalRatings"

    /**
     * @type {String}
     */
    static g_szAllUserEffectiveRatingStarss => "AllUserEffectiveRatingStarss"

    /**
     * @type {String}
     */
    static g_szUserEffectiveRatingStars => "UserEffectiveRatingStars"

    /**
     * @type {String}
     */
    static g_szUserPlaylist => "UserPlaylist"

    /**
     * @type {String}
     */
    static g_szViewMode_Report => "ViewModeReport"

    /**
     * @type {String}
     */
    static g_szViewMode_Details => "ViewModeDetails"

    /**
     * @type {String}
     */
    static g_szViewMode_Icon => "ViewModeIcon"

    /**
     * @type {String}
     */
    static g_szViewMode_Tile => "ViewModeTile"

    /**
     * @type {String}
     */
    static g_szViewMode_OrderedList => "ViewModeOrderedList"

    /**
     * @type {String}
     */
    static g_szContentPrice_Unknown => "PriceUnknown"

    /**
     * @type {String}
     */
    static g_szContentPrice_CannotBuy => "PriceCannotBuy"

    /**
     * @type {String}
     */
    static g_szContentPrice_Free => "PriceFree"

    /**
     * @type {String}
     */
    static g_szRefreshLicensePlay => "RefreshForPlay"

    /**
     * @type {String}
     */
    static g_szRefreshLicenseBurn => "RefreshForBurn"

    /**
     * @type {String}
     */
    static g_szRefreshLicenseSync => "RefreshForSync"

    /**
     * @type {String}
     */
    static g_szVerifyPermissionSync => "VerifyPermissionSync"

    /**
     * @type {String}
     */
    static g_szStationEvent_Started => "TrackStarted"

    /**
     * @type {String}
     */
    static g_szStationEvent_Complete => "TrackComplete"

    /**
     * @type {String}
     */
    static g_szStationEvent_Skipped => "TrackSkipped"

    /**
     * @type {String}
     */
    static WMProfile_V40_DialUpMBR => "{fd7f47f1-72a6-45a4-80f0-3aecefc32c07}"

    /**
     * @type {String}
     */
    static WMProfile_V40_IntranetMBR => "{82cd3321-a94a-4ffc-9c2b-092c10ca16e7}"

    /**
     * @type {String}
     */
    static WMProfile_V40_2856100MBR => "{5a1c2206-dc5e-4186-beb2-4c5a994b132e}"

    /**
     * @type {String}
     */
    static WMProfile_V40_6VoiceAudio => "{d508978a-11a0-4d15-b0da-acdc99d4f890}"

    /**
     * @type {String}
     */
    static WMProfile_V40_16AMRadio => "{0f4be81f-d57d-41e1-b2e3-2fad986bfec2}"

    /**
     * @type {String}
     */
    static WMProfile_V40_288FMRadioMono => "{7fa57fc8-6ea4-4645-8abf-b6e5a8f814a1}"

    /**
     * @type {String}
     */
    static WMProfile_V40_288FMRadioStereo => "{22fcf466-aa40-431f-a289-06d0ea1a1e40}"

    /**
     * @type {String}
     */
    static WMProfile_V40_56DialUpStereo => "{e8026f87-e905-4594-a3c7-00d00041d1d9}"

    /**
     * @type {String}
     */
    static WMProfile_V40_64Audio => "{4820b3f7-cbec-41dc-9391-78598714c8e5}"

    /**
     * @type {String}
     */
    static WMProfile_V40_96Audio => "{0efa0ee3-9e64-41e2-837f-3c0038f327ba}"

    /**
     * @type {String}
     */
    static WMProfile_V40_128Audio => "{93ddbe12-13dc-4e32-a35e-40378e34279a}"

    /**
     * @type {String}
     */
    static WMProfile_V40_288VideoVoice => "{bb2bc274-0eb6-4da9-b550-ecf7f2b9948f}"

    /**
     * @type {String}
     */
    static WMProfile_V40_288VideoAudio => "{ac617f2d-6cbe-4e84-8e9a-ce151a12a354}"

    /**
     * @type {String}
     */
    static WMProfile_V40_288VideoWebServer => "{abf2f00d-d555-4815-94ce-8275f3a70bfe}"

    /**
     * @type {String}
     */
    static WMProfile_V40_56DialUpVideo => "{e21713bb-652f-4dab-99de-71e04400270f}"

    /**
     * @type {String}
     */
    static WMProfile_V40_56DialUpVideoWebServer => "{b756ff10-520f-4749-a399-b780e2fc9250}"

    /**
     * @type {String}
     */
    static WMProfile_V40_100Video => "{8f99ddd8-6684-456b-a0a3-33e1316895f0}"

    /**
     * @type {String}
     */
    static WMProfile_V40_250Video => "{541841c3-9339-4f7b-9a22-b11540894e42}"

    /**
     * @type {String}
     */
    static WMProfile_V40_512Video => "{70440e6d-c4ef-4f84-8cd0-d5c28686e784}"

    /**
     * @type {String}
     */
    static WMProfile_V40_1MBVideo => "{b4482a4c-cc17-4b07-a94e-9818d5e0f13f}"

    /**
     * @type {String}
     */
    static WMProfile_V40_3MBVideo => "{55374ac0-309b-4396-b88f-e6e292113f28}"

    /**
     * @type {String}
     */
    static WMProfile_V70_DialUpMBR => "{5b16e74b-4068-45b5-b80e-7bf8c80d2c2f}"

    /**
     * @type {String}
     */
    static WMProfile_V70_IntranetMBR => "{045880dc-34b6-4ca9-a326-73557ed143f3}"

    /**
     * @type {String}
     */
    static WMProfile_V70_2856100MBR => "{07df7a25-3fe2-4a5b-8b1e-348b0721ca70}"

    /**
     * @type {String}
     */
    static WMProfile_V70_288VideoVoice => "{b952f38e-7dbc-4533-a9ca-b00b1c6e9800}"

    /**
     * @type {String}
     */
    static WMProfile_V70_288VideoAudio => "{58bba0ee-896a-4948-9953-85b736f83947}"

    /**
     * @type {String}
     */
    static WMProfile_V70_288VideoWebServer => "{70a32e2b-e2df-4ebd-9105-d9ca194a2d50}"

    /**
     * @type {String}
     */
    static WMProfile_V70_56VideoWebServer => "{def99e40-57bc-4ab3-b2d1-b6e3caf64257}"

    /**
     * @type {String}
     */
    static WMProfile_V70_64VideoISDN => "{c2b7a7e9-7b8e-4992-a1a1-068217a3b311}"

    /**
     * @type {String}
     */
    static WMProfile_V70_100Video => "{d9f3c932-5ea9-4c6d-89b4-2686e515426e}"

    /**
     * @type {String}
     */
    static WMProfile_V70_256Video => "{afe69b3a-403f-4a1b-8007-0e21cfb3df84}"

    /**
     * @type {String}
     */
    static WMProfile_V70_384Video => "{f3d45fbb-8782-44df-97c6-8678e2f9b13d}"

    /**
     * @type {String}
     */
    static WMProfile_V70_768Video => "{0326ebb6-f76e-4964-b0db-e729978d35ee}"

    /**
     * @type {String}
     */
    static WMProfile_V70_1500Video => "{0b89164a-5490-4686-9e37-5a80884e5146}"

    /**
     * @type {String}
     */
    static WMProfile_V70_2000Video => "{aa980124-bf10-4e4f-9afd-4329a7395cff}"

    /**
     * @type {String}
     */
    static WMProfile_V70_700FilmContentVideo => "{7a747920-2449-4d76-99cb-fdb0c90484d4}"

    /**
     * @type {String}
     */
    static WMProfile_V70_1500FilmContentVideo => "{f6a5f6df-ee3f-434c-a433-523ce55f516b}"

    /**
     * @type {String}
     */
    static WMProfile_V70_6VoiceAudio => "{eaba9fbf-b64f-49b3-aa0c-73fbdd150ad0}"

    /**
     * @type {String}
     */
    static WMProfile_V70_288FMRadioMono => "{c012a833-a03b-44a5-96dc-ed95cc65582d}"

    /**
     * @type {String}
     */
    static WMProfile_V70_288FMRadioStereo => "{e96d67c9-1a39-4dc4-b900-b1184dc83620}"

    /**
     * @type {String}
     */
    static WMProfile_V70_56DialUpStereo => "{674ee767-0949-4fac-875e-f4c9c292013b}"

    /**
     * @type {String}
     */
    static WMProfile_V70_64AudioISDN => "{91dea458-9d60-4212-9c59-d40919c939e4}"

    /**
     * @type {String}
     */
    static WMProfile_V70_64Audio => "{b29cffc6-f131-41db-b5e8-99d8b0b945f4}"

    /**
     * @type {String}
     */
    static WMProfile_V70_96Audio => "{a9d4b819-16cc-4a59-9f37-693dbb0302d6}"

    /**
     * @type {String}
     */
    static WMProfile_V70_128Audio => "{c64cf5da-df45-40d3-8027-de698d68dc66}"

    /**
     * @type {String}
     */
    static WMProfile_V70_225VideoPDA => "{f55ea573-4c02-42b5-9026-a8260c438a9f}"

    /**
     * @type {String}
     */
    static WMProfile_V70_150VideoPDA => "{0f472967-e3c6-4797-9694-f0304c5e2f17}"

    /**
     * @type {String}
     */
    static WMProfile_V80_255VideoPDA => "{feedbcdf-3fac-4c93-ac0d-47941ec72c0b}"

    /**
     * @type {String}
     */
    static WMProfile_V80_150VideoPDA => "{aee16dfa-2c14-4a2f-ad3f-a3034031784f}"

    /**
     * @type {String}
     */
    static WMProfile_V80_28856VideoMBR => "{d66920c4-c21f-4ec8-a0b4-95cf2bd57fc4}"

    /**
     * @type {String}
     */
    static WMProfile_V80_100768VideoMBR => "{5bdb5a0e-979e-47d3-9596-73b386392a55}"

    /**
     * @type {String}
     */
    static WMProfile_V80_288100VideoMBR => "{d8722c69-2419-4b36-b4e0-6e17b60564e5}"

    /**
     * @type {String}
     */
    static WMProfile_V80_288Video => "{3df678d9-1352-4186-bbf8-74f0c19b6ae2}"

    /**
     * @type {String}
     */
    static WMProfile_V80_56Video => "{254e8a96-2612-405c-8039-f0bf725ced7d}"

    /**
     * @type {String}
     */
    static WMProfile_V80_100Video => "{a2e300b4-c2d4-4fc0-b5dd-ecbd948dc0df}"

    /**
     * @type {String}
     */
    static WMProfile_V80_256Video => "{bbc75500-33d2-4466-b86b-122b201cc9ae}"

    /**
     * @type {String}
     */
    static WMProfile_V80_384Video => "{29b00c2b-09a9-48bd-ad09-cdae117d1da7}"

    /**
     * @type {String}
     */
    static WMProfile_V80_768Video => "{74d01102-e71a-4820-8f0d-13d2ec1e4872}"

    /**
     * @type {String}
     */
    static WMProfile_V80_700NTSCVideo => "{c8c2985f-e5d9-4538-9e23-9b21bf78f745}"

    /**
     * @type {String}
     */
    static WMProfile_V80_1400NTSCVideo => "{931d1bee-617a-4bcd-9905-ccd0786683ee}"

    /**
     * @type {String}
     */
    static WMProfile_V80_384PALVideo => "{9227c692-ae62-4f72-a7ea-736062d0e21e}"

    /**
     * @type {String}
     */
    static WMProfile_V80_700PALVideo => "{ec298949-639b-45e2-96fd-4ab32d5919c2}"

    /**
     * @type {String}
     */
    static WMProfile_V80_288MonoAudio => "{7ea3126d-e1ba-4716-89af-f65cee0c0c67}"

    /**
     * @type {String}
     */
    static WMProfile_V80_288StereoAudio => "{7e4cab5c-35dc-45bb-a7c0-19b28070d0cc}"

    /**
     * @type {String}
     */
    static WMProfile_V80_32StereoAudio => "{60907f9f-b352-47e5-b210-0ef1f47e9f9d}"

    /**
     * @type {String}
     */
    static WMProfile_V80_48StereoAudio => "{5ee06be5-492b-480a-8a8f-12f373ecf9d4}"

    /**
     * @type {String}
     */
    static WMProfile_V80_64StereoAudio => "{09bb5bc4-3176-457f-8dd6-3cd919123e2d}"

    /**
     * @type {String}
     */
    static WMProfile_V80_96StereoAudio => "{1fc81930-61f2-436f-9d33-349f2a1c0f10}"

    /**
     * @type {String}
     */
    static WMProfile_V80_128StereoAudio => "{407b9450-8bdc-4ee5-88b8-6f527bd941f2}"

    /**
     * @type {String}
     */
    static WMProfile_V80_288VideoOnly => "{8c45b4c7-4aeb-4f78-a5ec-88420b9dadef}"

    /**
     * @type {String}
     */
    static WMProfile_V80_56VideoOnly => "{6e2a6955-81df-4943-ba50-68a986a708f6}"

    /**
     * @type {String}
     */
    static WMProfile_V80_FAIRVBRVideo => "{3510a862-5850-4886-835f-d78ec6a64042}"

    /**
     * @type {String}
     */
    static WMProfile_V80_HIGHVBRVideo => "{0f10d9d3-3b04-4fb0-a3d3-88d4ac854acc}"

    /**
     * @type {String}
     */
    static WMProfile_V80_BESTVBRVideo => "{048439ba-309c-440e-9cb4-3dcca3756423}"
;@endregion Constants

;@region Methods
;@endregion Methods
}
