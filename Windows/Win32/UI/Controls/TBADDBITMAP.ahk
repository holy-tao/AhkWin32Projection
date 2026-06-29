#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * Adds a bitmap that contains button images to a toolbar.
 * @remarks
 * If 
 * 				<b>nID</b> holds a bitmap handle, rather than a resource ID, do not destroy the bitmap until it has been replaced with <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-replacebitmap">TB_REPLACEBITMAP</a>. Otherwise, the toolbar is destroyed.
 * 
 * Defined values can be used as indexes to the standard bitmaps. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-standard-button-image-index-values">Toolbar Standard Button Image Index Values</a>.
 * 
 * The <b>TBADDBITMAP</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-addbitmap">TB_ADDBITMAP</a> message.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbaddbitmap
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TBADDBITMAP {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Handle to the module instance with the executable file that contains a bitmap resource. To use bitmap handles instead of resource IDs, set this member to <b>NULL</b>.
     */
    hInst : HINSTANCE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * If 
     * 					<b>hInst</b> is <b>NULL</b>, set this member to the bitmap handle of the bitmap with the button images. Otherwise, set it to the resource identifier of the bitmap with the button images.
     */
    nID : IntPtr

}
