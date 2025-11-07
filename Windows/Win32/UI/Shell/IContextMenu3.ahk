#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContextMenu2.ahk

/**
 * Exposes methods that either create or merge a shortcut menu associated with a Shell object. Allows client objects to handle messages associated with owner-drawn menu items and extends IContextMenu2 by accepting a return value from that message handling.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu2">IContextMenu2</a> interfaces, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IContextMenu3</b> if your shortcut menu extension needs to process the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-menuchar">WM_MENUCHAR</a> message.
 * 
 * 			    
 * 
 * This message is forwarded to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu3-handlemenumsg2">IContextMenu3::HandleMenuMsg2</a> only if a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call for an <b>IContextMenu3</b> interface pointer is successful, which indicates that the object supports this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You do not call this interface directly. <b>IContextMenu3</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontextmenu3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContextMenu3 extends IContextMenu2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenu3
     * @type {Guid}
     */
    static IID => Guid("{bcfce0a0-ec17-11d0-8d10-00a0c90f2719}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleMenuMsg2"]

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu3-handlemenumsg2
     */
    HandleMenuMsg2(uMsg, wParam, lParam) {
        result := ComCall(7, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }
}
