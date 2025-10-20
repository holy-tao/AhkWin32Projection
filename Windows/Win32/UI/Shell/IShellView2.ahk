#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellView.ahk

/**
 * Extends the capabilities of IShellView.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement <b>IShellView2</b> if your namespace extension provides services to clients beyond those in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * You do not call this interface directly. <b>IShellView2</b> is used by the operating system only when it has confirmed that your application is aware of this interface. Objects that expose <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> and <b>IShellView2</b> are usually created by other Shell folder objects.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellview2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellView2 extends IShellView{
    /**
     * The interface identifier for IShellView2
     * @type {Guid}
     */
    static IID => Guid("{88e39e80-3578-11cf-ae69-08002b2e1262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * 
     * @param {Pointer<Guid>} pvid 
     * @param {Integer} uView 
     * @returns {HRESULT} 
     */
    GetView(pvid, uView) {
        result := ComCall(16, this, "ptr", pvid, "uint", uView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SV2CVW2_PARAMS>} lpParams 
     * @returns {HRESULT} 
     */
    CreateViewWindow2(lpParams) {
        result := ComCall(17, this, "ptr", lpParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlNew 
     * @returns {HRESULT} 
     */
    HandleRename(pidlNew) {
        result := ComCall(18, this, "ptr", pidlNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlItem 
     * @param {Integer} uFlags 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    SelectAndPositionItem(pidlItem, uFlags, ppt) {
        result := ComCall(19, this, "ptr", pidlItem, "uint", uFlags, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
