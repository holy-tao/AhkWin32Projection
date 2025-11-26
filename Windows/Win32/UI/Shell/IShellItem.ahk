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
     * Binds to a handler for an item as specified by the handler ID value (BHID).
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on a bind context object. Used to pass optional parameters to the handler. The contents of the bind context are handler-specific. For example, when binding to <b>BHID_Stream</b>, the <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> flags in the bind context indicate the mode of access desired (read or read/write).
     * @param {Pointer<Guid>} bhid Type: <b>REFGUID</b>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the object type to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains a pointer of type <i>riid</i> that is returned by the handler specified by <i>rbhid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler
     */
    BindToHandler(pbc, bhid, riid) {
        result := ComCall(3, this, "ptr", pbc, "ptr", bhid, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the parent of an IShellItem object.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the parent of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem-getparent
     */
    GetParent() {
        result := ComCall(4, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Gets the display name of the IShellItem object.
     * @param {Integer} sigdnName Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-sigdn">SIGDN</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-sigdn">SIGDN</a> values that indicates how the name should look.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A value that, when this function returns successfully, receives the address of a pointer to the retrieved display name.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname
     */
    GetDisplayName(sigdnName) {
        result := ComCall(5, this, "int", sigdnName, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets a requested set of attributes of the IShellItem object.
     * @param {Integer} sfgaoMask Type: <b>SFGAOF</b>
     * 
     * Specifies the attributes to retrieve. One or more of the <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO</a> values. Use a bitwise OR operator to determine the attributes to retrieve.
     * @returns {Integer} Type: <b>SFGAOF*</b>
     * 
     * A pointer to a value that, when this method returns successfully, contains the requested attributes. One or more of the <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO</a> values. Only those attributes specified by <i>sfgaoMask</i> are returned; other attribute values are undefined.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem-getattributes
     */
    GetAttributes(sfgaoMask) {
        result := ComCall(6, this, "uint", sfgaoMask, "uint*", &psfgaoAttribs := 0, "HRESULT")
        return psfgaoAttribs
    }

    /**
     * Compares two IShellItem objects.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object to compare with the existing <b>IShellItem</b> object.
     * @param {Integer} hint Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_sichintf">SICHINTF</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_sichintf">SICHINTF</a> values that determines how to perform the comparison. See <b>SICHINTF</b> for the list of possible values for this parameter.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * This parameter receives the result of the comparison. If the two items are the same this parameter equals zero; if they are different the parameter is nonzero.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem-compare
     */
    Compare(psi, hint) {
        result := ComCall(7, this, "ptr", psi, "uint", hint, "int*", &piOrder := 0, "HRESULT")
        return piOrder
    }
}
