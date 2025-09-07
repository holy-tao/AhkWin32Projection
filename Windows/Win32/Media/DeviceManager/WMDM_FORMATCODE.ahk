#Requires AutoHotkey v2.0.0 64-bit

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
 * @version v4.0.30319
 */
class WMDM_FORMATCODE{

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_NOTUSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ALLIMAGES => -1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINED => 12288

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ASSOCIATION => 12289

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_SCRIPT => 12290

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_EXECUTABLE => 12291

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_TEXT => 12292

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_HTML => 12293

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_DPOF => 12294

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_AIFF => 12295

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_WAVE => 12296

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MP3 => 12297

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_AVI => 12298

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MPEG => 12299

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ASF => 12300

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_RESERVED_FIRST => 12301

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_RESERVED_LAST => 14335

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_UNDEFINED => 14336

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_EXIF => 14337

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_TIFFEP => 14338

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_FLASHPIX => 14339

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_BMP => 14340

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_CIFF => 14341

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_GIF => 14343

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_JFIF => 14344

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_PCD => 14345

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_PICT => 14346

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_PNG => 14347

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_TIFF => 14349

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_TIFFIT => 14350

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_JP2 => 14351

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_JPX => 14352

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_RESERVED_FIRST => 14353

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_IMAGE_RESERVED_LAST => 16383

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDFIRMWARE => 47106

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_WBMP => 47107

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_JPEGXR => 47108

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_WINDOWSIMAGEFORMAT => 47233

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDAUDIO => 47360

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_WMA => 47361

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_OGG => 47362

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_AAC => 47363

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_AUDIBLE => 47364

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_FLAC => 47366

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_QCELP => 47367

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_AMR => 47368

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDVIDEO => 47488

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_WMV => 47489

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MP4 => 47490

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MP2 => 47491

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_3GP => 47492

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_3G2 => 47493

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_AVCHD => 47494

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ATSCTS => 47495

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_DVBTS => 47496

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MKV => 47497

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MKA => 47498

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MK3D => 47499

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDCOLLECTION => 47616

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTMULTIMEDIAALBUM => 47617

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTIMAGEALBUM => 47618

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTAUDIOALBUM => 47619

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTVIDEOALBUM => 47620

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTAUDIOVIDEOPLAYLIST => 47621

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTCONTACTGROUP => 47622

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTMESSAGEFOLDER => 47623

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTCHAPTEREDPRODUCTION => 47624

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MEDIA_CAST => 47627

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_WPLPLAYLIST => 47632

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_M3UPLAYLIST => 47633

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MPLPLAYLIST => 47634

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ASXPLAYLIST => 47635

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_PLSPLAYLIST => 47636

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDDOCUMENT => 47744

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTDOCUMENT => 47745

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_XMLDOCUMENT => 47746

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MICROSOFTWORDDOCUMENT => 47747

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MHTCOMPILEDHTMLDOCUMENT => 47748

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MICROSOFTEXCELSPREADSHEET => 47749

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_MICROSOFTPOWERPOINTDOCUMENT => 47750

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDMESSAGE => 47872

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTMESSAGE => 47873

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDCONTACT => 48000

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTCONTACT => 48001

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_VCARD2 => 48002

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_VCARD3 => 48003

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDCALENDARITEM => 48640

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_ABSTRACTCALENDARITEM => 48641

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_VCALENDAR1 => 48642

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_VCALENDAR2 => 48643

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_UNDEFINEDWINDOWSEXECUTABLE => 48768

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_M4A => 1297101889

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_3GPA => 860311617

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_3G2A => 860303937

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FORMATCODE_SECTION => 48770
}
