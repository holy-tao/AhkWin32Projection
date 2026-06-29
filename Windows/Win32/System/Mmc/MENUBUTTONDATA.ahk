#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MENUBUTTONDATA structure contains values used to create buttons on a toolbar.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-menubuttondata
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MENUBUTTONDATA {
    #StructPack 4

    /**
     * A value that specifies a user-supplied value that uniquely identifies the menu button.
     */
    idCommand : Int32

    /**
     * A value that specifies the horizontal position, in pixels, at which the snap-in's context menu is displayed.
     */
    x : Int32

    /**
     * A value that specifies the vertical position, in pixels, at which the snap-in's context menu is displayed.
     */
    y : Int32

}
