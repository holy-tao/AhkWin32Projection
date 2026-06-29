#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Description of the CMYKCOLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-cmykcolor
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct CMYKCOLOR {
    #StructPack 2

    /**
     * TBD
     */
    cyan : UInt16

    /**
     * TBD
     */
    magenta : UInt16

    /**
     * TBD
     */
    yellow : UInt16

    /**
     * TBD
     */
    black : UInt16

}
