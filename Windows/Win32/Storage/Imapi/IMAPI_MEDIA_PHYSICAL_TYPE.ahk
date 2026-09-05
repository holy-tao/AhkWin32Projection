#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the currently known media types supported by IMAPI.
 * @remarks
 * The values in the range 0x00000000..0x0000FFFF inclusive are reserved for extension by Microsoft. If third parties wish to report a media type not in this list using this enumeration (for example, if implementing <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_currentphysicalmediatype">IDiscFormat2Data::get_CurrentPhysicalMediaType</a> to support a non-listed format) they should define values only in the range 0x00010000..0xFFFFFFFF for these media types.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_media_physical_type
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMAPI_MEDIA_PHYSICAL_TYPE extends Win32Enum {

    /**
     * The disc recorder contains an unknown media type or the recorder is empty.
     * Native name: IMAPI_MEDIA_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The drive contains CD-ROM or CD-R/RW media.
     * Native name: IMAPI_MEDIA_TYPE_CDROM
     * @type {Integer (Int32)}
     */
    static CDROM => 1

    /**
     * The drive contains write once (CD-R) media.
     * Native name: IMAPI_MEDIA_TYPE_CDR
     * @type {Integer (Int32)}
     */
    static CDR => 2

    /**
     * The drive contains rewritable (CD-RW) media.
     * Native name: IMAPI_MEDIA_TYPE_CDRW
     * @type {Integer (Int32)}
     */
    static CDRW => 3

    /**
     * Either the DVD drive or DVD media is read-only.
     * Native name: IMAPI_MEDIA_TYPE_DVDROM
     * @type {Integer (Int32)}
     */
    static DVDROM => 4

    /**
     * The drive contains DVD-RAM media.
     * Native name: IMAPI_MEDIA_TYPE_DVDRAM
     * @type {Integer (Int32)}
     */
    static DVDRAM => 5

    /**
     * The drive contains write once media that supports the DVD plus format (DVD+R) .
     * Native name: IMAPI_MEDIA_TYPE_DVDPLUSR
     * @type {Integer (Int32)}
     */
    static DVDPLUSR => 6

    /**
     * The drive contains rewritable media that supports the DVD plus format (DVD+RW).
     * Native name: IMAPI_MEDIA_TYPE_DVDPLUSRW
     * @type {Integer (Int32)}
     */
    static DVDPLUSRW => 7

    /**
     * The drive contains write once dual layer media that supports the DVD plus format (DVD+R DL).
     * Native name: IMAPI_MEDIA_TYPE_DVDPLUSR_DUALLAYER
     * @type {Integer (Int32)}
     */
    static DVDPLUSR_DUALLAYER => 8

    /**
     * The drive contains write once media that supports the DVD dash format (DVD-R).
     * Native name: IMAPI_MEDIA_TYPE_DVDDASHR
     * @type {Integer (Int32)}
     */
    static DVDDASHR => 9

    /**
     * The drive contains rewritable media that supports the DVD dash format (DVD-RW).
     * Native name: IMAPI_MEDIA_TYPE_DVDDASHRW
     * @type {Integer (Int32)}
     */
    static DVDDASHRW => 10

    /**
     * The drive contains write once dual layer media that supports the DVD dash format (DVD-R DL).
     * Native name: IMAPI_MEDIA_TYPE_DVDDASHR_DUALLAYER
     * @type {Integer (Int32)}
     */
    static DVDDASHR_DUALLAYER => 11

    /**
     * The drive contains a media type that supports random-access writes. This media type supports hardware defect management that identifies and avoids using damaged tracks.
     * Native name: IMAPI_MEDIA_TYPE_DISK
     * @type {Integer (Int32)}
     */
    static DISK => 12

    /**
     * The drive contains rewritable dual layer media that supports the DVD plus format (DVD+RW DL).
     * Native name: IMAPI_MEDIA_TYPE_DVDPLUSRW_DUALLAYER
     * @type {Integer (Int32)}
     */
    static DVDPLUSRW_DUALLAYER => 13

    /**
     * The drive contains high definition read only DVD media (HD DVD-ROM).
     * Native name: IMAPI_MEDIA_TYPE_HDDVDROM
     * @type {Integer (Int32)}
     */
    static HDDVDROM => 14

    /**
     * The drive contains write once high definition media (HD DVD-R).
     * Native name: IMAPI_MEDIA_TYPE_HDDVDR
     * @type {Integer (Int32)}
     */
    static HDDVDR => 15

    /**
     * The drive contains random access high definition media (HD DVD-RAM).
     * Native name: IMAPI_MEDIA_TYPE_HDDVDRAM
     * @type {Integer (Int32)}
     */
    static HDDVDRAM => 16

    /**
     * The drive contains read only Blu-ray media (BD-ROM).
     * Native name: IMAPI_MEDIA_TYPE_BDROM
     * @type {Integer (Int32)}
     */
    static BDROM => 17

    /**
     * The drive contains write once Blu-ray media (BD-R).
     * Native name: IMAPI_MEDIA_TYPE_BDR
     * @type {Integer (Int32)}
     */
    static BDR => 18

    /**
     * The drive contains rewritable Blu-ray media (BD-RE) media.
     * Native name: IMAPI_MEDIA_TYPE_BDRE
     * @type {Integer (Int32)}
     */
    static BDRE => 19

    /**
     * This value is the maximum value defined in IMAPI_MEDIA_PHYSICAL_TYPE.
     * Native name: IMAPI_MEDIA_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 19
}
