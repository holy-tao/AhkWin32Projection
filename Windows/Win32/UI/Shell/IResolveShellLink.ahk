#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables an application to request that a Shell folder object resolve a link for one of its items.
 * @remarks
 * Namespace extensions implement this object to support link resolution.
 * 
 * This interface is not typically used by applications.
 * 
 * With <a href="https://docs.microsoft.com/windows/desktop/shell/nse-works">namespace extensions</a>, shortcut objects (.lnk files) implement the essential functionality of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-resolve">IShellLink::Resolve</a> by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iresolveshelllink-resolveshelllink">IResolveShellLink::ResolveShellLink</a>. <b>IResolveShellLink</b> is exported by a link resolution object that is created on request by the Shell folder.
 * 
 * To retrieve a pointer to a link resolution object's <b>IResolveShellLink</b> interface:
 * 				
 * 
 * <ul>
 * <li>For an object that is contained by a folder, call the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> method and request an <b>IResolveShellLink</b> pointer (IID_IResolveShellLink).</li>
 * <li>For the folder object itself, call the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject">IShellFolder::CreateViewObject</a> method and request an <b>IResolveShellLink</b> pointer (IID_IResolveShellLink).</li>
 * </ul>
 * <div class="alert"><b>Note</b>  Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-iresolveshelllink
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IResolveShellLink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResolveShellLink
     * @type {Guid}
     */
    static IID => Guid("{5cd52983-9449-11d2-963a-00c04f79adf0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveShellLink"]

    /**
     * Requests that a folder object resolve a Shell link.
     * @remarks
     * This method should attempt to find the target of a Shell link, even if the target has been moved or renamed.
     * @param {IUnknown} punkLink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> interface. This interface can then be queried to determine the contents of the link.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * Handle to the window that the Shell uses as the parent for a dialog box. The Shell displays the dialog box if it needs to prompt the user for more information while resolving the link.
     * @param {Integer} fFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iresolveshelllink-resolveshelllink
     */
    ResolveShellLink(punkLink, hwnd_, fFlags) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(3, this, "ptr", punkLink, "ptr", hwnd_, "uint", fFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
