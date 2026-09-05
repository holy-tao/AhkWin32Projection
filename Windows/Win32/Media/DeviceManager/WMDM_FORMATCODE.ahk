#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_FORMATCODE enumeration type defines a list of format codes that describe types of content transferred to and from a device.
 * @remarks
 * To discover the formats supported by a device, an application can use [**IWMDMDevice3::GetProperty**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getproperty) to query the **g\_wszWMDMFormatsSupported** device property.
 * 
 * To discover device capabilities for a particular format, an application can call [**IWMDMDevice3::GetFormatCapability**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability).
 * 
 * An application can set the format code while creating a storage on device by including the **g\_wszWMDMFormatCode** property in metadata passed in the *pMetaData* parameter of a call to [**IWMDMStorageControl3::Insert3**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol3-insert3).
 * 
 * An application can query the format code of a storage by calling [**IWMDMStorage3::GetMetadata**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-getmetadata) or [**IWMDMStorage4::GetSpecifiedMetadata**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata) and retrieving the **g\_wszWMDMFormatCode** property.
 * 
 * If the device supports setting the format code after the creation of storage, an application can use [**IWMDMStorage3::SetMetadata**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-setmetadata) to set the **g\_wszWMDMFormatCode** property. Some devices may not allow changing the format code after the storage is created on the device. Therefore, setting this property along with the metadata passed in [**IWMDMStorageControl3::Insert3**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol3-insert3) is strongly recommended.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-formatcode
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDM_FORMATCODE extends Win32Enum {

    /**
     * Native name: WMDM_FORMATCODE_NOTUSED
     * @type {Integer (Int32)}
     */
    static NOTUSED => 0

    /**
     * Native name: WMDM_FORMATCODE_ALLIMAGES
     * @type {Integer (Int32)}
     */
    static ALLIMAGES => -1

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 12288

    /**
     * Native name: WMDM_FORMATCODE_ASSOCIATION
     * @type {Integer (Int32)}
     */
    static ASSOCIATION => 12289

    /**
     * Native name: WMDM_FORMATCODE_SCRIPT
     * @type {Integer (Int32)}
     */
    static SCRIPT => 12290

    /**
     * Native name: WMDM_FORMATCODE_EXECUTABLE
     * @type {Integer (Int32)}
     */
    static EXECUTABLE => 12291

    /**
     * Native name: WMDM_FORMATCODE_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 12292

    /**
     * Native name: WMDM_FORMATCODE_HTML
     * @type {Integer (Int32)}
     */
    static HTML => 12293

    /**
     * Native name: WMDM_FORMATCODE_DPOF
     * @type {Integer (Int32)}
     */
    static DPOF => 12294

    /**
     * Native name: WMDM_FORMATCODE_AIFF
     * @type {Integer (Int32)}
     */
    static AIFF => 12295

    /**
     * Native name: WMDM_FORMATCODE_WAVE
     * @type {Integer (Int32)}
     */
    static WAVE => 12296

    /**
     * Native name: WMDM_FORMATCODE_MP3
     * @type {Integer (Int32)}
     */
    static MP3 => 12297

    /**
     * Native name: WMDM_FORMATCODE_AVI
     * @type {Integer (Int32)}
     */
    static AVI => 12298

    /**
     * Native name: WMDM_FORMATCODE_MPEG
     * @type {Integer (Int32)}
     */
    static MPEG => 12299

    /**
     * Native name: WMDM_FORMATCODE_ASF
     * @type {Integer (Int32)}
     */
    static ASF => 12300

    /**
     * Native name: WMDM_FORMATCODE_RESERVED_FIRST
     * @type {Integer (Int32)}
     */
    static RESERVED_FIRST => 12301

    /**
     * Native name: WMDM_FORMATCODE_RESERVED_LAST
     * @type {Integer (Int32)}
     */
    static RESERVED_LAST => 14335

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static IMAGE_UNDEFINED => 14336

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_EXIF
     * @type {Integer (Int32)}
     */
    static IMAGE_EXIF => 14337

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_TIFFEP
     * @type {Integer (Int32)}
     */
    static IMAGE_TIFFEP => 14338

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_FLASHPIX
     * @type {Integer (Int32)}
     */
    static IMAGE_FLASHPIX => 14339

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_BMP
     * @type {Integer (Int32)}
     */
    static IMAGE_BMP => 14340

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_CIFF
     * @type {Integer (Int32)}
     */
    static IMAGE_CIFF => 14341

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_GIF
     * @type {Integer (Int32)}
     */
    static IMAGE_GIF => 14343

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_JFIF
     * @type {Integer (Int32)}
     */
    static IMAGE_JFIF => 14344

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_PCD
     * @type {Integer (Int32)}
     */
    static IMAGE_PCD => 14345

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_PICT
     * @type {Integer (Int32)}
     */
    static IMAGE_PICT => 14346

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_PNG
     * @type {Integer (Int32)}
     */
    static IMAGE_PNG => 14347

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_TIFF
     * @type {Integer (Int32)}
     */
    static IMAGE_TIFF => 14349

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_TIFFIT
     * @type {Integer (Int32)}
     */
    static IMAGE_TIFFIT => 14350

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_JP2
     * @type {Integer (Int32)}
     */
    static IMAGE_JP2 => 14351

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_JPX
     * @type {Integer (Int32)}
     */
    static IMAGE_JPX => 14352

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_RESERVED_FIRST
     * @type {Integer (Int32)}
     */
    static IMAGE_RESERVED_FIRST => 14353

    /**
     * Native name: WMDM_FORMATCODE_IMAGE_RESERVED_LAST
     * @type {Integer (Int32)}
     */
    static IMAGE_RESERVED_LAST => 16383

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDFIRMWARE
     * @type {Integer (Int32)}
     */
    static UNDEFINEDFIRMWARE => 47106

    /**
     * Native name: WMDM_FORMATCODE_WBMP
     * @type {Integer (Int32)}
     */
    static WBMP => 47107

    /**
     * Native name: WMDM_FORMATCODE_JPEGXR
     * @type {Integer (Int32)}
     */
    static JPEGXR => 47108

    /**
     * Native name: WMDM_FORMATCODE_WINDOWSIMAGEFORMAT
     * @type {Integer (Int32)}
     */
    static WINDOWSIMAGEFORMAT => 47233

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDAUDIO
     * @type {Integer (Int32)}
     */
    static UNDEFINEDAUDIO => 47360

    /**
     * Native name: WMDM_FORMATCODE_WMA
     * @type {Integer (Int32)}
     */
    static WMA => 47361

    /**
     * Native name: WMDM_FORMATCODE_OGG
     * @type {Integer (Int32)}
     */
    static OGG => 47362

    /**
     * Native name: WMDM_FORMATCODE_AAC
     * @type {Integer (Int32)}
     */
    static AAC => 47363

    /**
     * Native name: WMDM_FORMATCODE_AUDIBLE
     * @type {Integer (Int32)}
     */
    static AUDIBLE => 47364

    /**
     * Native name: WMDM_FORMATCODE_FLAC
     * @type {Integer (Int32)}
     */
    static FLAC => 47366

    /**
     * Native name: WMDM_FORMATCODE_QCELP
     * @type {Integer (Int32)}
     */
    static QCELP => 47367

    /**
     * Native name: WMDM_FORMATCODE_AMR
     * @type {Integer (Int32)}
     */
    static AMR => 47368

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDVIDEO
     * @type {Integer (Int32)}
     */
    static UNDEFINEDVIDEO => 47488

    /**
     * Native name: WMDM_FORMATCODE_WMV
     * @type {Integer (Int32)}
     */
    static WMV => 47489

    /**
     * Native name: WMDM_FORMATCODE_MP4
     * @type {Integer (Int32)}
     */
    static MP4 => 47490

    /**
     * Native name: WMDM_FORMATCODE_MP2
     * @type {Integer (Int32)}
     */
    static MP2 => 47491

    /**
     * Native name: WMDM_FORMATCODE_3GP
     * @type {Integer (Int32)}
     */
    static 3GP => 47492

    /**
     * Native name: WMDM_FORMATCODE_3G2
     * @type {Integer (Int32)}
     */
    static 3G2 => 47493

    /**
     * Native name: WMDM_FORMATCODE_AVCHD
     * @type {Integer (Int32)}
     */
    static AVCHD => 47494

    /**
     * Native name: WMDM_FORMATCODE_ATSCTS
     * @type {Integer (Int32)}
     */
    static ATSCTS => 47495

    /**
     * Native name: WMDM_FORMATCODE_DVBTS
     * @type {Integer (Int32)}
     */
    static DVBTS => 47496

    /**
     * Native name: WMDM_FORMATCODE_MKV
     * @type {Integer (Int32)}
     */
    static MKV => 47497

    /**
     * Native name: WMDM_FORMATCODE_MKA
     * @type {Integer (Int32)}
     */
    static MKA => 47498

    /**
     * Native name: WMDM_FORMATCODE_MK3D
     * @type {Integer (Int32)}
     */
    static MK3D => 47499

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDCOLLECTION
     * @type {Integer (Int32)}
     */
    static UNDEFINEDCOLLECTION => 47616

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTMULTIMEDIAALBUM
     * @type {Integer (Int32)}
     */
    static ABSTRACTMULTIMEDIAALBUM => 47617

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTIMAGEALBUM
     * @type {Integer (Int32)}
     */
    static ABSTRACTIMAGEALBUM => 47618

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTAUDIOALBUM
     * @type {Integer (Int32)}
     */
    static ABSTRACTAUDIOALBUM => 47619

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTVIDEOALBUM
     * @type {Integer (Int32)}
     */
    static ABSTRACTVIDEOALBUM => 47620

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTAUDIOVIDEOPLAYLIST
     * @type {Integer (Int32)}
     */
    static ABSTRACTAUDIOVIDEOPLAYLIST => 47621

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTCONTACTGROUP
     * @type {Integer (Int32)}
     */
    static ABSTRACTCONTACTGROUP => 47622

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTMESSAGEFOLDER
     * @type {Integer (Int32)}
     */
    static ABSTRACTMESSAGEFOLDER => 47623

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTCHAPTEREDPRODUCTION
     * @type {Integer (Int32)}
     */
    static ABSTRACTCHAPTEREDPRODUCTION => 47624

    /**
     * Native name: WMDM_FORMATCODE_MEDIA_CAST
     * @type {Integer (Int32)}
     */
    static MEDIA_CAST => 47627

    /**
     * Native name: WMDM_FORMATCODE_WPLPLAYLIST
     * @type {Integer (Int32)}
     */
    static WPLPLAYLIST => 47632

    /**
     * Native name: WMDM_FORMATCODE_M3UPLAYLIST
     * @type {Integer (Int32)}
     */
    static M3UPLAYLIST => 47633

    /**
     * Native name: WMDM_FORMATCODE_MPLPLAYLIST
     * @type {Integer (Int32)}
     */
    static MPLPLAYLIST => 47634

    /**
     * Native name: WMDM_FORMATCODE_ASXPLAYLIST
     * @type {Integer (Int32)}
     */
    static ASXPLAYLIST => 47635

    /**
     * Native name: WMDM_FORMATCODE_PLSPLAYLIST
     * @type {Integer (Int32)}
     */
    static PLSPLAYLIST => 47636

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDDOCUMENT
     * @type {Integer (Int32)}
     */
    static UNDEFINEDDOCUMENT => 47744

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTDOCUMENT
     * @type {Integer (Int32)}
     */
    static ABSTRACTDOCUMENT => 47745

    /**
     * Native name: WMDM_FORMATCODE_XMLDOCUMENT
     * @type {Integer (Int32)}
     */
    static XMLDOCUMENT => 47746

    /**
     * Native name: WMDM_FORMATCODE_MICROSOFTWORDDOCUMENT
     * @type {Integer (Int32)}
     */
    static MICROSOFTWORDDOCUMENT => 47747

    /**
     * Native name: WMDM_FORMATCODE_MHTCOMPILEDHTMLDOCUMENT
     * @type {Integer (Int32)}
     */
    static MHTCOMPILEDHTMLDOCUMENT => 47748

    /**
     * Native name: WMDM_FORMATCODE_MICROSOFTEXCELSPREADSHEET
     * @type {Integer (Int32)}
     */
    static MICROSOFTEXCELSPREADSHEET => 47749

    /**
     * Native name: WMDM_FORMATCODE_MICROSOFTPOWERPOINTDOCUMENT
     * @type {Integer (Int32)}
     */
    static MICROSOFTPOWERPOINTDOCUMENT => 47750

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDMESSAGE
     * @type {Integer (Int32)}
     */
    static UNDEFINEDMESSAGE => 47872

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTMESSAGE
     * @type {Integer (Int32)}
     */
    static ABSTRACTMESSAGE => 47873

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDCONTACT
     * @type {Integer (Int32)}
     */
    static UNDEFINEDCONTACT => 48000

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTCONTACT
     * @type {Integer (Int32)}
     */
    static ABSTRACTCONTACT => 48001

    /**
     * Native name: WMDM_FORMATCODE_VCARD2
     * @type {Integer (Int32)}
     */
    static VCARD2 => 48002

    /**
     * Native name: WMDM_FORMATCODE_VCARD3
     * @type {Integer (Int32)}
     */
    static VCARD3 => 48003

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDCALENDARITEM
     * @type {Integer (Int32)}
     */
    static UNDEFINEDCALENDARITEM => 48640

    /**
     * Native name: WMDM_FORMATCODE_ABSTRACTCALENDARITEM
     * @type {Integer (Int32)}
     */
    static ABSTRACTCALENDARITEM => 48641

    /**
     * Native name: WMDM_FORMATCODE_VCALENDAR1
     * @type {Integer (Int32)}
     */
    static VCALENDAR1 => 48642

    /**
     * Native name: WMDM_FORMATCODE_VCALENDAR2
     * @type {Integer (Int32)}
     */
    static VCALENDAR2 => 48643

    /**
     * Native name: WMDM_FORMATCODE_UNDEFINEDWINDOWSEXECUTABLE
     * @type {Integer (Int32)}
     */
    static UNDEFINEDWINDOWSEXECUTABLE => 48768

    /**
     * Native name: WMDM_FORMATCODE_M4A
     * @type {Integer (Int32)}
     */
    static M4A => 1297101889

    /**
     * Native name: WMDM_FORMATCODE_3GPA
     * @type {Integer (Int32)}
     */
    static 3GPA => 860311617

    /**
     * Native name: WMDM_FORMATCODE_3G2A
     * @type {Integer (Int32)}
     */
    static 3G2A => 860303937

    /**
     * Native name: WMDM_FORMATCODE_SECTION
     * @type {Integer (Int32)}
     */
    static SECTION => 48770
}
