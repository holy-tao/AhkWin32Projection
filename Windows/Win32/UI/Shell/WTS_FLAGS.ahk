#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used by IThumbnailCache::GetThumbnail to specify options for the extraction and display of the thumbnail image.
 * @remarks
 * The following combinations are valid.
 * 
 * <table class="clsStd">
 * <tr>
 * <td>WTS_INCACHEONLY</td>
 * </tr>
 * <tr>
 * <td>WTS_FASTEXTRACT</td>
 * </tr>
 * <tr>
 * <td>WTS_EXTRACT</td>
 * </tr>
 * <tr>
 * <td>WTS_EXTRACT | WTS_SLOWRECLAIM</td>
 * </tr>
 * <tr>
 * <td>WTS_FORCEEXTRACTION</td>
 * </tr>
 * <tr>
 * <td>WTS_FORCEEXTRACTION | WTS_SLOWRECLAIM</td>
 * </tr>
 * <tr>
 * <td>WTS_EXTRACTDONOTCACHE</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/ne-thumbcache-wts_flags
 * @namespace Windows.Win32.UI.Shell
 */
class WTS_FLAGS extends Win32BitflagEnum {

    /**
     * 0x00000000. <b>Introduced in Windows 8</b>. None of the following options are set.
     * Native name: WTS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Default. 0x00000000. Extract the thumbnail if it is not cached.
     * Native name: WTS_EXTRACT
     * @type {Integer (Int32)}
     */
    static EXTRACT => 0

    /**
     * 0x00000001. Only return the thumbnail if it is cached.
     * Native name: WTS_INCACHEONLY
     * @type {Integer (Int32)}
     */
    static INCACHEONLY => 1

    /**
     * 0x00000002. If not cached, only extract the thumbnail if it is embedded in EXIF format, typically 96x96.
     * Native name: WTS_FASTEXTRACT
     * @type {Integer (Int32)}
     */
    static FASTEXTRACT => 2

    /**
     * 0x00000004. Ignore cache and extract thumbnail from source file.
     * Native name: WTS_FORCEEXTRACTION
     * @type {Integer (Int32)}
     */
    static FORCEEXTRACTION => 4

    /**
     * 0x00000008. The thumbnail has an extended lifetime. Use for volumes that might go offline, like non-fixed disks.
     * Native name: WTS_SLOWRECLAIM
     * @type {Integer (Int32)}
     */
    static SLOWRECLAIM => 8

    /**
     * 0x00000020. Extract but do not add the thumbnail to the cache.
     * Native name: WTS_EXTRACTDONOTCACHE
     * @type {Integer (Int32)}
     */
    static EXTRACTDONOTCACHE => 32

    /**
     * 0x00000040. <b>Introduced in Windows 7</b>. If the specific thumbnail size requested in the <i>cxyRequestedThumbSize</i> parameter is not available, resize the thumbnail to the requested size. If possible, a larger bitmap is reduced in scale, preserving its aspect ratio, to the width and height required. If the only available cached thumbnail is smaller than the requested size, then it is scaled up using the nearest-neighbor algorithm.
     * Native name: WTS_SCALETOREQUESTEDSIZE
     * @type {Integer (Int32)}
     */
    static SCALETOREQUESTEDSIZE => 64

    /**
     * 0x00000080. <b>Introduced in Windows 7</b>. Do not extract a thumbnail embedded in the metadata of an EXIF image.
     * Native name: WTS_SKIPFASTEXTRACT
     * @type {Integer (Int32)}
     */
    static SKIPFASTEXTRACT => 128

    /**
     * 0x00000100. <b>Introduced in Windows 7</b>. Ensures that the thumbnail handler is loaded in the same process as the caller. When this flag is not specified, the handler is loaded into a surrogate process to protect the caller from unexpected crashes caused by the processing of the target file. Use this value when debugging thumbnail extractors.
     * Native name: WTS_EXTRACTINPROC
     * @type {Integer (Int32)}
     */
    static EXTRACTINPROC => 256

    /**
     * 0x00000200. <b>Introduced in Windows 8</b>. If necessary, crop the bitmap's dimensions so that is square. The length of the shortest side becomes the length of all sides.
     * Native name: WTS_CROPTOSQUARE
     * @type {Integer (Int32)}
     */
    static CROPTOSQUARE => 512

    /**
     * 0x00000400. <b>Introduced in Windows 8</b>. Create a surrogate for this instance of the cache rather than using the shared DLLHost surrogate.
     * Native name: WTS_INSTANCESURROGATE
     * @type {Integer (Int32)}
     */
    static INSTANCESURROGATE => 1024

    /**
     * 0x00000800. <b>Introduced in Windows 8</b>. Require extractions to take place in the surrogate.
     * Native name: WTS_REQUIRESURROGATE
     * @type {Integer (Int32)}
     */
    static REQUIRESURROGATE => 2048

    /**
     * 0x00002000. <b>Windows 8 and later</b>. Pass the <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_contextflags">WTSCF_APPSTYLE</a> flag to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailsettings-setcontext">IThumbnailSettings::SetContext</a>, if the provider supports it.
     * Native name: WTS_APPSTYLE
     * @type {Integer (Int32)}
     */
    static APPSTYLE => 8192

    /**
     * 0x00004000. <b>Windows 8 and later</b>. Stretch and crop the bitmap so that its height is 0.7 times its width.
     * Native name: WTS_WIDETHUMBNAILS
     * @type {Integer (Int32)}
     */
    static WIDETHUMBNAILS => 16384

    /**
     * 0x00008000. <b>Windows 8 and later</b>. Return from the ideal cache snap size only. The returned image might be larger, but it will be pulled from the correct cache entry.
     * Native name: WTS_IDEALCACHESIZEONLY
     * @type {Integer (Int32)}
     */
    static IDEALCACHESIZEONLY => 32768

    /**
     * 0x00010000. <b>Windows 8 and later</b>. If necessary, stretch the image so that the height and width fit the given size.
     * Native name: WTS_SCALEUP
     * @type {Integer (Int32)}
     */
    static SCALEUP => 65536
}
