#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that either create or merge a shortcut menu associated with a Shell object.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement <b>IContextMenu</b> in the following situations.
  * 			
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/shell/handlers">Shell extension handlers</a> implement this interface to dynamically add items to a Shell object's shortcut menu.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/shell/nse-works">Namespace extensions</a> implement this interface to specify their object's shortcut menus.</li>
  * </ul>
  * For a detailed discussion of how to implement <b>IContextMenu</b>, see <a href="https://docs.microsoft.com/windows/desktop/shell/context-menu-handlers">Creating Context Menu Handlers</a>.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Applications use <b>IContextMenu</b> to retrieve information about the items in an object's shortcut menu and to invoke the associated commands. To retrieve an object's <b>IContextMenu</b> interface, an application must call the object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> method.
  * 
  * Shell extension handlers that export this interface must also export <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellextinit">IShellExtInit</a>. For details, see <a href="https://docs.microsoft.com/windows/desktop/shell/handlers">Creating Shell Extension Handlers</a>.
  * 
  * <div class="alert"><b>Note</b>  <b>Windows Vista and later:</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontextmenu
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContextMenu extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenu
     * @type {Guid}
     */
    static IID => Guid("{000214e4-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryContextMenu", "InvokeCommand", "GetCommandString"]

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} indexMenu 
     * @param {Integer} idCmdFirst 
     * @param {Integer} idCmdLast 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu-querycontextmenu
     */
    QueryContextMenu(hmenu, indexMenu, idCmdFirst, idCmdLast, uFlags) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(3, this, "ptr", hmenu, "uint", indexMenu, "uint", idCmdFirst, "uint", idCmdLast, "uint", uFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CMINVOKECOMMANDINFO>} pici 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand
     */
    InvokeCommand(pici) {
        result := ComCall(4, this, "ptr", pici, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} idCmd 
     * @param {Integer} uType 
     * @param {PSTR} pszName 
     * @param {Integer} cchMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu-getcommandstring
     */
    GetCommandString(idCmd, uType, pszName, cchMax) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(5, this, "ptr", idCmd, "uint", uType, "uint*", pReserved, "ptr", pszName, "uint", cchMax, "HRESULT")
        return result
    }
}
