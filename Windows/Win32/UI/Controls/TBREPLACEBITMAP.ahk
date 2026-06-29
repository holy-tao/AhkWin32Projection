#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * Used with the TB_REPLACEBITMAP message to replace one toolbar bitmap with another.
 * @remarks
 * If 
 * 				<b>nIDNew</b> holds a bitmap handle, rather than a resource ID, do not destroy the bitmap until it has been replaced with <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-replacebitmap">TB_REPLACEBITMAP</a>, or the toolbar is destroyed.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbreplacebitmap
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TBREPLACEBITMAP {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Module instance handle to the bitmap resource being replaced. Set this member to <b>NULL</b> to instead use a bitmap handle.
     */
    hInstOld : HINSTANCE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * If 
     * 					<b>hInstOld</b> is <b>NULL</b>, set this member to the bitmap handle of the bitmap that is being replaced. Otherwise, set it to the resource identifier of the bitmap being replaced.
     */
    nIDOld : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Module instance handle that contains the new bitmap resource. Set this member to <b>NULL</b> to instead use a bitmap handle.
     */
    hInstNew : HINSTANCE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * If 
     * 					<b>hInstNew</b> is <b>NULL</b>, set this member to the bitmap handle of the bitmap with the new button images. Otherwise, set it to the resource identifier of the bitmap with the new button images.
     */
    nIDNew : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * Number of button images contained in the new bitmap. The number of new images should be the same as the number of replaced images.
     */
    nButtons : Int32

}
