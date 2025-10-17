#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Holds the parameters for the IShellView2::CreateViewWindow2 method.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-sv2cvw2_params
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SV2CVW2_PARAMS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the previous view. A Shell view can use this parameter to communicate with a previous view with the same implementation. It can also be used to optimize browsing between like views. This parameter may be <b>NULL</b>.
     * @type {Pointer<IShellView>}
     */
    psvPrev {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPFOLDERSETTINGS</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure with information needed to create the view.
     * @type {Pointer<FOLDERSETTINGS>}
     */
    pfs {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a>*</b>
     * 
     * A pointer to the current instance of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> interface of the parent Shell browser. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview2-createviewwindow2">IShellView2::CreateViewWindow2</a> should call this interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method and store the interface pointer. It can be used for communication with the Windows Explorer window.
     * @type {Pointer<IShellBrowser>}
     */
    psbOwner {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A <b>RECT</b> structure that defines the view's display area.
     * @type {Pointer<RECT>}
     */
    prcView {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>const SHELLVIEWID*</b>
     * 
     * A pointer to a view ID. The view ID can be one of the Windows-defined VIDs or a custom, view-defined VID. This value takes precedence over the view mode designated in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure pointed to by <b>pfs</b>.
     * @type {Pointer<Guid>}
     */
    pvid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A window handle to the new Shell view.
     * @type {HWND}
     */
    hwndView{
        get {
            if(!this.HasProp("__hwndView"))
                this.__hwndView := HWND(48, this)
            return this.__hwndView
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 56
    }
}
