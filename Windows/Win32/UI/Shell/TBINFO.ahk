#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the SFVM_GETBUTTONINFO notification to specify the number of buttons to add to the toolbar, as well as how they're added.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-tbinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct TBINFO {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The number of buttons.
     */
    cbuttons : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * One of the following flags.
     */
    uFlags : UInt32

}
