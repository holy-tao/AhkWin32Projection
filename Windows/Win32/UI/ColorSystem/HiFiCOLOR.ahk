#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Description of the HiFiCOLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-hificolor
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct HiFiCOLOR {
    #StructPack 1

    /**
     * TBD
     */
    channel : Int8[8]

}
