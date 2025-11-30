#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used by IThumbnailCache::GetThumbnail to specify options for the extraction and display of the thumbnail image.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/ne-thumbcache-wts_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class WTS_FLAGS extends Win32BitflagEnum{

    /**
     * 0x00000000. <b>Introduced in Windows 8</b>. None of the following options are set.
     * @type {Integer (Int32)}
     */
    static WTS_NONE => 0

    /**
     * Default. 0x00000000. Extract the thumbnail if it is not cached.
     * @type {Integer (Int32)}
     */
    static WTS_EXTRACT => 0

    /**
     * 0x00000001. Only return the thumbnail if it is cached.
     * @type {Integer (Int32)}
     */
    static WTS_INCACHEONLY => 1

    /**
     * 0x00000002. If not cached, only extract the thumbnail if it is embedded in EXIF format, typically 96x96.
     * @type {Integer (Int32)}
     */
    static WTS_FASTEXTRACT => 2

    /**
     * 0x00000004. Ignore cache and extract thumbnail from source file.
     * @type {Integer (Int32)}
     */
    static WTS_FORCEEXTRACTION => 4

    /**
     * 0x00000008. The thumbnail has an extended lifetime. Use for volumes that might go offline, like non-fixed disks.
     * @type {Integer (Int32)}
     */
    static WTS_SLOWRECLAIM => 8

    /**
     * 0x00000020. Extract but do not add the thumbnail to the cache.
     * @type {Integer (Int32)}
     */
    static WTS_EXTRACTDONOTCACHE => 32

    /**
     * 0x00000040. <b>Introduced in Windows 7</b>. If the specific thumbnail size requested in the <i>cxyRequestedThumbSize</i> parameter is not available, resize the thumbnail to the requested size. If possible, a larger bitmap is reduced in scale, preserving its aspect ratio, to the width and height required. If the only available cached thumbnail is smaller than the requested size, then it is scaled up using the nearest-neighbor algorithm.
     * @type {Integer (Int32)}
     */
    static WTS_SCALETOREQUESTEDSIZE => 64

    /**
     * 0x00000080. <b>Introduced in Windows 7</b>. Do not extract a thumbnail embedded in the metadata of an EXIF image.
     * @type {Integer (Int32)}
     */
    static WTS_SKIPFASTEXTRACT => 128

    /**
     * 0x00000100. <b>Introduced in Windows 7</b>. Ensures that the thumbnail handler is loaded in the same process as the caller. When this flag is not specified, the handler is loaded into a surrogate process to protect the caller from unexpected crashes caused by the processing of the target file. Use this value when debugging thumbnail extractors.
     * @type {Integer (Int32)}
     */
    static WTS_EXTRACTINPROC => 256

    /**
     * 0x00000200. <b>Introduced in Windows 8</b>. If necessary, crop the bitmap's dimensions so that is square. The length of the shortest side becomes the length of all sides.
     * @type {Integer (Int32)}
     */
    static WTS_CROPTOSQUARE => 512

    /**
     * 0x00000400. <b>Introduced in Windows 8</b>. Create a surrogate for this instance of the cache rather than using the shared DLLHost surrogate.
     * @type {Integer (Int32)}
     */
    static WTS_INSTANCESURROGATE => 1024

    /**
     * 0x00000800. <b>Introduced in Windows 8</b>. Require extractions to take place in the surrogate.
     * @type {Integer (Int32)}
     */
    static WTS_REQUIRESURROGATE => 2048

    /**
     * 0x00002000. <b>Windows 8 and later</b>. Pass the <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_contextflags">WTSCF_APPSTYLE</a> flag to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailsettings-setcontext">IThumbnailSettings::SetContext</a>, if the provider supports it.
     * @type {Integer (Int32)}
     */
    static WTS_APPSTYLE => 8192

    /**
     * 0x00004000. <b>Windows 8 and later</b>. Stretch and crop the bitmap so that its height is 0.7 times its width.
     * @type {Integer (Int32)}
     */
    static WTS_WIDETHUMBNAILS => 16384

    /**
     * 0x00008000. <b>Windows 8 and later</b>. Return from the ideal cache snap size only. The returned image might be larger, but it will be pulled from the correct cache entry.
     * @type {Integer (Int32)}
     */
    static WTS_IDEALCACHESIZEONLY => 32768

    /**
     * 0x00010000. <b>Windows 8 and later</b>. If necessary, stretch the image so that the height and width fit the given size.
     * @type {Integer (Int32)}
     */
    static WTS_SCALEUP => 65536
}
