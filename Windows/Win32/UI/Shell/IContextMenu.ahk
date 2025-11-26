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
     * Adds commands to a shortcut menu.
     * @param {HMENU} hmenu Type: <b>HMENU</b>
     * 
     * A handle to the shortcut menu. The handler should specify this handle when adding menu items.
     * @param {Integer} indexMenu Type: <b>UINT</b>
     * 
     * The zero-based position at which to insert the first new menu item.
     * @param {Integer} idCmdFirst Type: <b>UINT</b>
     * 
     * The minimum value that the handler can specify for a menu item identifier.
     * @param {Integer} idCmdLast Type: <b>UINT</b>
     * 
     * The maximum value that the handler can specify for a menu item identifier.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If successful, returns an <b>HRESULT</b> value that has its severity value set to SEVERITY_SUCCESS and its code value set to the offset of the largest command identifier that was assigned, plus one. For example, if <i>idCmdFirst</i> is set to 5 and you add three items to the menu with command identifiers of 5, 7, and 8, the return value should be MAKE_HRESULT(SEVERITY_SUCCESS, 0, 8 - 5 + 1). Otherwise, it returns a COM error value.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icontextmenu-querycontextmenu
     */
    QueryContextMenu(hmenu, indexMenu, idCmdFirst, idCmdLast, uFlags) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(3, this, "ptr", hmenu, "uint", indexMenu, "uint", idCmdFirst, "uint", idCmdLast, "uint", uFlags, "int")
        return result
    }

    /**
     * Carries out the command associated with a shortcut menu item.
     * @param {Pointer<CMINVOKECOMMANDINFO>} pici Type: <b>LPCMINVOKECOMMANDINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure that contains specifics about the command.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand
     */
    InvokeCommand(pici) {
        result := ComCall(4, this, "ptr", pici, "HRESULT")
        return result
    }

    /**
     * Gets information about a shortcut menu command, including the help string and the language-independent, or canonical, name for the command.
     * @param {Pointer} idCmd Type: <b>UINT_PTR</b>
     * 
     * Menu command identifier offset.
     * @param {Integer} uType Type: <b>UINT</b>
     * @param {PSTR} pszName Type: <b>LPSTR</b>
     * 
     * The address of the buffer to receive the null-terminated string being retrieved.
     * @param {Integer} cchMax Type: <b>UINT</b>
     * 
     * Size of the buffer, in characters, to receive the null-terminated string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icontextmenu-getcommandstring
     */
    GetCommandString(idCmd, uType, pszName, cchMax) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", idCmd, "uint", uType, "uint*", pReserved, "ptr", pszName, "uint", cchMax, "HRESULT")
        return result
    }
}
