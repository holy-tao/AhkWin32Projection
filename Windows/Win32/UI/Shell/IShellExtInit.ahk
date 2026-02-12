#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that initializes Shell extensions for property sheets, shortcut menus, and drag-and-drop handlers (extensions that add items to shortcut menus during nondefault drag-and-drop operations).
 * @remarks
 * Implement <b>IShellExtInit</b> when you are writing a handler based on the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext">IShellPropSheetExt</a> interface.
 * 
 * Note that Shell extensions based on other interfaces do not use this method of initialization.
 * 
 * You do not use this interface directly. The Shell calls it to initialize the handler.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ishellextinit
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellExtInit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellExtInit
     * @type {Guid}
     */
    static IID => Guid("{000214e8-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a property sheet extension, shortcut menu extension, or drag-and-drop handler.
     * @remarks
     * The meanings of some parameters depend on the extension type. For drag-and-drop handlers, the <i>pidlFolder</i> parameter specifies the destination folder (the drop target), the <i>pdtobj</i> parameter identifies the items being dropped, and the <i>hkeyProgID</i> parameter specifies the file type of the destination folder.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/shell/context-menu-handlers">shortcut menu extensions</a>, <i>pdtobj</i> identifies the selected file objects, <i>hkeyProgID</i> identifies the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-file-types">file type</a> of the object with focus, and <i>pidlFolder</i> is either <b>NULL</b> (for file objects) or specifies the folder for which the shortcut menu is being requested (for folder background shortcut menus).
     * 
     * For property sheet extensions, <i>pidlFolder</i> is <b>NULL</b>, <i>pdtobj</i> identifies the selected file objects, and <i>hkeyProgID</i> specifies the file type of the file object that has the focus.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This is the first method that the Shell calls after it creates an instance of a property sheet extension, shortcut menu extension, or drag-and-drop handler.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that uniquely identifies a folder. For property sheet extensions, this parameter is <b>NULL</b>. For shortcut menu extensions, it is the item identifier list for the folder that contains the item whose shortcut menu is being displayed. For nondefault drag-and-drop menu extensions, this parameter specifies the target folder.
     * @param {IDataObject} pdtobj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface object that can be used to retrieve the objects being acted upon.
     * @param {HKEY} hkeyProgID Type: <b>HKEY</b>
     * 
     * The registry key for the file object or folder type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellextinit-initialize
     */
    Initialize(pidlFolder, pdtobj, hkeyProgID) {
        hkeyProgID := hkeyProgID is Win32Handle ? NumGet(hkeyProgID, "ptr") : hkeyProgID

        result := ComCall(3, this, "ptr", pidlFolder, "ptr", pdtobj, "ptr", hkeyProgID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
