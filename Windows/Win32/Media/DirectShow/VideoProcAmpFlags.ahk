#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VideoProcAmpFlags enumeration indicates whether a particular video property is controlled manually or automatically.
 * @remarks
 * The following flags defined in KsMedia.h are equivalent to the values in <b>VideoProcAmpFlags</b>:
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-videoprocampflags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VideoProcAmpFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
