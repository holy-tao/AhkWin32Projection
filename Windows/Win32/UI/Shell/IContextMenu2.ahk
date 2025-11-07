#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContextMenu.ahk

/**
 * Exposes methods that either create or merge a shortcut (context) menu associated with a Shell object. Extends IContextMenu by adding a method that allows client objects to handle messages associated with owner-drawn menu items.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> interface, from which it inherits.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IContextMenu2</b> if your <a href="https://docs.microsoft.com/windows/desktop/shell/nse-works">namespace extension</a> or <a href="https://docs.microsoft.com/windows/desktop/shell/context-menu-handlers">shortcut menu handler</a> needs to process one or more of the following messages. 
 * 
 * 				
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-initmenupopup">WM_INITMENUPOPUP</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-drawitem">WM_DRAWITEM</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-measureitem">WM_MEASUREITEM</a>
 * </li>
 * </ul>
 * These messages are forwarded to <b>IContextMenu2</b>—through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu2-handlemenumsg">HandleMenuMsg</a> method—only if a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call for an <b>IContextMenu2</b> interface pointer is successful, indicating that the object supports this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Applications do not normally call this interface directly.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontextmenu2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContextMenu2 extends IContextMenu{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenu2
     * @type {Guid}
     */
    static IID => Guid("{000214f4-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleMenuMsg"]

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu2-handlemenumsg
     */
    HandleMenuMsg(uMsg, wParam, lParam) {
        result := ComCall(6, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
