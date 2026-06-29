#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JabColorF.ahk" { JabColorF }

/**
 * This structure contains eight primary colors in Jab coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-primaryjabcolors
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct PrimaryJabColors {
    #StructPack 4

    /**
     * Red primary.
     */
    red : JabColorF

    /**
     * Yellow primary.
     */
    yellow : JabColorF

    /**
     * Green primary.
     */
    green : JabColorF

    /**
     * Cyan primary.
     */
    cyan : JabColorF

    /**
     * Blue primary.
     */
    blue : JabColorF

    /**
     * Magenta primary.
     */
    magenta : JabColorF

    /**
     * Black primary.
     */
    black : JabColorF

    /**
     * White primary.
     */
    white : JabColorF

}
