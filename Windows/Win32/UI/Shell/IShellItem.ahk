#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve information about a Shell item. IShellItem and IShellItem2 are the preferred representations of items in any new code.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Third parties do not implement this interface; only use the implementation provided with the system.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItem
     * @type {Guid}
     */
    static IID => Guid("{43826d1e-e718-42ee-bc55-a1e261c37bfe}")

    /**
     * The class identifier for ShellItem
     * @type {Guid}
     */
    static CLSID => Guid("{9ac9fbe1-e0a2-4ad6-b4ee-e212013ea917}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindToHandler", "GetParent", "GetDisplayName", "GetAttributes", "Compare"]

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} bhid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler
     */
    BindToHandler(pbc, bhid, riid) {
        result := ComCall(3, this, "ptr", pbc, "ptr", bhid, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @returns {IShellItem} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(4, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * 
     * @param {Integer} sigdnName 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname
     */
    GetDisplayName(sigdnName) {
        result := ComCall(5, this, "int", sigdnName, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @param {Integer} sfgaoMask 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-getattributes
     */
    GetAttributes(sfgaoMask) {
        result := ComCall(6, this, "uint", sfgaoMask, "uint*", &psfgaoAttribs := 0, "HRESULT")
        return psfgaoAttribs
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} hint 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare
     */
    Compare(psi, hint) {
        result := ComCall(7, this, "ptr", psi, "uint", hint, "int*", &piOrder := 0, "HRESULT")
        return piOrder
    }
}
