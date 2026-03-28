#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that either create or merge a shortcut menu associated with a Shell object.
 * @remarks
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
 * <div class="alert"><b>Note</b> Windows 11 refines the behavior of the contextual file operations in the right-click context menu of File Explorer and the Share dialog. Please see  <a href="https://docs.microsoft.com/windows/apps/get-started/make-apps-great-for-windows">Top 11 things you can do to make your app great on Windows 11 </a>
 * <div></div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenu
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
     * @remarks
     * This method should call either <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenua">InsertMenu</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenuitema">InsertMenuItem</a> to insert its menu items into the menu specified by <i>hmenu</i>. The <i>indexMenu</i> parameter holds the index to be used for the first menu item. The identifier of each menu item must fall within the range defined by <i>idCmdFirst</i> and <i>idCmdLast</i>.
     * 
     * A common practice is to set the first command identifier to <i>idCmdFirst</i> (an offset of zero) and increment the offset for each additional command by one. This practice ensures that you do not exceed <i>idCmdLast</i> and preserves the range of identifiers that are available for use by other handlers. Store the offsets for reference because they can be used to identify the command in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-getcommandstring">IContextMenu::GetCommandString</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a>.
     * 
     * If the Shell subsequently calls another shortcut menu handler, it will use the code value of the returned <b>HRESULT</b> to set <i>idCmdFirst</i> when it calls that handler's <b>QueryContextMenu</b> method.
     * 
     * When a context menu handler adds a pop-up menu item, it must use <b>IContextMenu::QueryContextMenu</b> to add at least one item to that menu for the WM_INITMENUPOPUP message to be forwarded.
     * @param {HMENU} _hmenu 
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu-querycontextmenu
     */
    QueryContextMenu(_hmenu, indexMenu, idCmdFirst, idCmdLast, uFlags) {
        _hmenu := _hmenu is Win32Handle ? NumGet(_hmenu, "ptr") : _hmenu

        result := ComCall(3, this, "ptr", _hmenu, "uint", indexMenu, "uint", idCmdFirst, "uint", idCmdLast, "uint", uFlags, "int")
        return result
    }

    /**
     * Carries out the command associated with a shortcut menu item.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> interface is exported by several Shell extension handlers and namespace extensions. It is used to add commands to shortcut menus. When the user selects one of the commands that the handler or namespace extension added to a shortcut menu, the Shell calls that command's <b>InvokeCommand</b> method. The command can be specified by its menu identifier offset, defined when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-querycontextmenu">IContextMenu::QueryContextMenu</a> was called, or by its associated verb. An application can invoke this method directly by obtaining a pointer to an object's <b>IContextMenu</b> interface. An application can also invoke this method indirectly by calling <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> and specifying a verb that is supported by the namespace extension or handler.
     * 
     * <h3><a id="Note_to_Users"></a><a id="note_to_users"></a><a id="NOTE_TO_USERS"></a>Note to Users</h3>
     * Although the <i>pici</i> parameter is declared in Shlobj.h as a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> structure, you can use either <b>CMINVOKECOMMANDINFO</b> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a>. Either will work for ANSI strings, but you must use a <b>CMINVOKECOMMANDINFOEX</b> structure for Unicode strings.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Check the <b>cbSize</b> member of <i>pici</i> to determine which structure (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a>) was passed in. If it is a <b>CMINVOKECOMMANDINFOEX</b> structure and the <b>fMask</b> member has the <b>CMIC_MASK_UNICODE</b> flag set, you must cast <i>pici</i> to <b>CMINVOKECOMMANDINFOEX</b> to use the Unicode information contained in the last five members of the structure.
     * 
     * If the verb, specified either by a canonical verb name or the command ID is not recognized by the context menu handler, it must return a failure (E_FAIL) so that the verb can be passed on to other context menu handlers that might implement it.
     * 
     * As of Windows Vista, it is not sufficient invoke the command asynchronously simply by setting the CMIC_MASK_ASYNCOK flag in the <b>fMask</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure. You must also set a thread reference on the calling thread as explained in <a href="https://docs.microsoft.com/windows/desktop/shell/managing-thread-references">Managing Thread References</a>.
     * @param {Pointer<CMINVOKECOMMANDINFO>} pici Type: <b>LPCMINVOKECOMMANDINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure that contains specifics about the command.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand
     */
    InvokeCommand(pici) {
        result := ComCall(4, this, "ptr", pici, "HRESULT")
        return result
    }

    /**
     * Gets information about a shortcut menu command, including the help string and the language-independent, or canonical, name for the command.
     * @remarks
     * The language-independent command name, or <i>verb</i>, is a name that can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a> method to activate a command by an application. The help text is a description of the command that Windows Explorer displays in its status bar. It should be reasonably short (under 40 characters).
     * 
     * Several common verbs can be identified by their canonical name, for instance, <i>open</i>, <i>print</i>, <i>delete</i>, and <i>rename</i>. Clients can compare the string pointed to by <i>pszName</i> against these canonical names to check for their presence on the shortcut menu.
     * 
     * Even though <i>pszName</i> is declared as an <b>LPSTR</b>, you must cast it to <b>UINT_PTR</b> and return a Unicode string if <i>uFlags</i> is set to either <b>GCS_HELPTEXTW</b> or <b>GCS_VERBW</b>. <b>GCS_UNICODE</b> can be used as a bitmask to test <i>uFlags</i> for 'W' and 'A' versions of the flag it contains.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu-getcommandstring
     */
    GetCommandString(idCmd, uType, pszName, cchMax) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", idCmd, "uint", uType, "uint*", pReserved, "ptr", pszName, "uint", cchMax, "HRESULT")
        return result
    }
}
