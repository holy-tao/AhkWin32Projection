#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IShellBrowser.ahk" { IShellBrowser }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\IShellView.ahk" { IShellView }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FOLDERSETTINGS.ahk" { FOLDERSETTINGS }

/**
 * Holds the parameters for the IShellView2::CreateViewWindow2 method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sv2cvw2_params
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SV2CVW2_PARAMS {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the previous view. A Shell view can use this parameter to communicate with a previous view with the same implementation. It can also be used to optimize browsing between like views. This parameter may be <b>NULL</b>.
     */
    psvPrev : IShellView

    /**
     * Type: <b>LPFOLDERSETTINGS</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure with information needed to create the view.
     */
    pfs : FOLDERSETTINGS.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a>*</b>
     * 
     * A pointer to the current instance of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> interface of the parent Shell browser. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview2-createviewwindow2">IShellView2::CreateViewWindow2</a> should call this interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method and store the interface pointer. It can be used for communication with the Windows Explorer window.
     */
    psbOwner : IShellBrowser

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A <b>RECT</b> structure that defines the view's display area.
     */
    prcView : RECT.Ptr

    /**
     * Type: <b>const SHELLVIEWID*</b>
     * 
     * A pointer to a view ID. The view ID can be one of the Windows-defined VIDs or a custom, view-defined VID. This value takes precedence over the view mode designated in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure pointed to by <b>pfs</b>.
     */
    pvid : Guid.Ptr

    /**
     * Type: <b>HWND</b>
     * 
     * A window handle to the new Shell view.
     */
    hwndView : HWND

}
