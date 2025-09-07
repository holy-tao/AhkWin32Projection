#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the currently known media types supported by IMAPI.
 * @remarks
 * The values in the range 0x00000000..0x0000FFFF inclusive are reserved for extension by Microsoft. If third parties wish to report a media type not in this list using this enumeration (for example, if implementing <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_currentphysicalmediatype">IDiscFormat2Data::get_CurrentPhysicalMediaType</a> to support a non-listed format) they should define values only in the range 0x00010000..0xFFFFFFFF for these media types.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_media_physical_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_MEDIA_PHYSICAL_TYPE{

    /**
     * The disc recorder contains an unknown media type or the recorder is empty.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_UNKNOWN => 0

    /**
     * The drive contains CD-ROM or CD-R/RW media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_CDROM => 1

    /**
     * The drive contains write once (CD-R) media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_CDR => 2

    /**
     * The drive contains rewritable (CD-RW) media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_CDRW => 3

    /**
     * Either the DVD drive or DVD media is read-only.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDROM => 4

    /**
     * The drive contains DVD-RAM media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDRAM => 5

    /**
     * The drive contains write once media that supports the DVD plus format (DVD+R) .
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDPLUSR => 6

    /**
     * The drive contains rewritable media that supports the DVD plus format (DVD+RW).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDPLUSRW => 7

    /**
     * The drive contains write once dual layer media that supports the DVD plus format (DVD+R DL).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDPLUSR_DUALLAYER => 8

    /**
     * The drive contains write once media that supports the DVD dash format (DVD-R).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDDASHR => 9

    /**
     * The drive contains rewritable media that supports the DVD dash format (DVD-RW).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDDASHRW => 10

    /**
     * The drive contains write once dual layer media that supports the DVD dash format (DVD-R DL).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDDASHR_DUALLAYER => 11

    /**
     * The drive contains a media type that supports random-access writes. This media type supports hardware defect management that identifies and avoids using damaged tracks.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DISK => 12

    /**
     * The drive contains rewritable dual layer media that supports the DVD plus format (DVD+RW DL).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_DVDPLUSRW_DUALLAYER => 13

    /**
     * The drive contains high definition read only DVD media (HD DVD-ROM).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_HDDVDROM => 14

    /**
     * The drive contains write once high definition media (HD DVD-R).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_HDDVDR => 15

    /**
     * The drive contains random access high definition media (HD DVD-RAM).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_HDDVDRAM => 16

    /**
     * The drive contains read only Blu-ray media (BD-ROM).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_BDROM => 17

    /**
     * The drive contains write once Blu-ray media (BD-R).
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_BDR => 18

    /**
     * The drive contains rewritable Blu-ray media (BD-RE) media.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_BDRE => 19

    /**
     * This value is the maximum value defined in IMAPI_MEDIA_PHYSICAL_TYPE.
     * @type {Integer (Int32)}
     */
    static IMAPI_MEDIA_TYPE_MAX => 19
}
