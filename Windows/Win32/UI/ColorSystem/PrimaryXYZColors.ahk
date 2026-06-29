#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XYZColorF.ahk" { XYZColorF }

/**
 * This structure contains eight primary colors in XYZ coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-primaryxyzcolors
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct PrimaryXYZColors {
    #StructPack 4

    /**
     * Red primary.
     */
    red : XYZColorF

    /**
     * Yellow primary.
     */
    yellow : XYZColorF

    /**
     * Green primary.
     */
    green : XYZColorF

    /**
     * Cyan primary.
     */
    cyan : XYZColorF

    /**
     * Blue primary.
     */
    blue : XYZColorF

    /**
     * Magenta primary.
     */
    magenta : XYZColorF

    /**
     * Black primary.
     */
    black : XYZColorF

    /**
     * White primary.
     */
    white : XYZColorF

}
