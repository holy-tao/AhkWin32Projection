#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VideoProcAmpFlags enumeration indicates whether a particular video property is controlled manually or automatically.
 * @remarks
 * 
  * The following flags defined in KsMedia.h are equivalent to the values in <b>VideoProcAmpFlags</b>:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#define KSPROPERTY_VIDEOPROCAMP_FLAGS_AUTO        0X0001L
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-videoprocampflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VideoProcAmpFlags{

    /**
     * The setting is controlled automatically.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Flags_Auto => 1

    /**
     * The setting is controlled manually.
     * @type {Integer (Int32)}
     */
    static VideoProcAmp_Flags_Manual => 2
}
