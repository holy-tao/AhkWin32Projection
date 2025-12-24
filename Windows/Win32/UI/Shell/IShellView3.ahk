#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IShellView2.ahk

/**
 * Extends the capabilities of IShellView2 by providing a method to replace IShellView2::CreateViewWindow2.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview2">IShellView2</a> interfaces, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ishellview3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellView3 extends IShellView2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellView3
     * @type {Guid}
     */
    static IID => Guid("{ec39fa88-f8af-41c5-8421-38bed28f4673}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateViewWindow3"]

    /**
     * Requests the creation of a new Shell view window. The view can be either the right pane of Windows Explorer or the client window of a folder window. This method replaces CreateViewWindow2.
     * @param {IShellBrowser} psbOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> interface to provide namespace extension services.
     * @param {IShellView} psvPrev Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface that represents the previous view in the Windows Explorer or folder window.
     * @param {Integer} dwViewFlags Type: <b>SV3CVW3_FLAGS</b>
     * 
     * Flags that specify details of the view being created.
     * @param {Integer} dwMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a></b>
     * 
     * A bitwise mask that specifies which folder options specified in <i>dwFlags</i> are to be used.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a></b>
     * 
     * A bitwise value that contains the folder options, as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>, to use in the new view.
     * @param {Integer} fvMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a></b>
     * 
     * A bitwise value that contains the folder view mode options, as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>, to use in the new view.
     * @param {Pointer<Guid>} pvid Type: <b>const SHELLVIEWID*</b>
     * 
     * A pointer to Shell view ID as a <b>GUID</b>.
     * @param {Pointer<RECT>} prcView Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> structure that provides the dimensions of the view window.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A value that receives a pointer to the handle of the new Shell view window.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ishellview3-createviewwindow3
     */
    CreateViewWindow3(psbOwner, psvPrev, dwViewFlags, dwMask, dwFlags, fvMode, pvid, prcView) {
        phwndView := HWND()
        result := ComCall(20, this, "ptr", psbOwner, "ptr", psvPrev, "uint", dwViewFlags, "int", dwMask, "int", dwFlags, "int", fvMode, "ptr", pvid, "ptr", prcView, "ptr", phwndView, "HRESULT")
        return phwndView
    }
}
