#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * Contains information about a folder band. This structure is used with the IShellFolderBand::GetBandInfoSFB and IShellFolderBand::SetBandInfoSFB methods.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-bandinfosfb
 * @namespace Windows.Win32.UI.Shell
 */
export default struct BANDINFOSFB {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     */
    dwMask : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwStateMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * State bits. One of the values listed for <b>dwStateMask</b>.
     */
    dwState : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the background color of the band.
     */
    crBkgnd : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the light button color.
     */
    crBtnLt : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the dark button color.
     */
    crBtnDk : COLORREF

    /**
     * Type: <b>WORD</b>
     */
    wViewMode : UInt16

    /**
     * Type: <b>WORD</b>
     */
    wAlign : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object.
     */
    psf : IShellFolder

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * A PIDL.
     */
    pidl : ITEMIDLIST.Ptr

}
