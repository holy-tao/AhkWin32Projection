#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumGUID.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCategoryMgr interface manages categories of objects for text services. The TSF manager implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcategorymgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCategoryMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCategoryMgr
     * @type {Guid}
     */
    static IID => Guid("{c3acefb5-f69d-4905-938f-fcadcf4be830}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterCategory", "UnregisterCategory", "EnumCategoriesInItem", "EnumItemsInCategory", "FindClosestCategory", "RegisterGUIDDescription", "UnregisterGUIDDescription", "GetGUIDDescription", "RegisterGUIDDWORD", "UnregisterGUIDDWORD", "GetGUIDDWORD", "RegisterGUID", "GetGUID", "IsEqualTfGuidAtom"]

    /**
     * ITfCategoryMgr::RegisterCategory method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that owns the item.
     * @param {Pointer<Guid>} rcatid Contains a GUID value that identifies the category to register the item under. This can be a user-defined category or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-category-values">predefined category values</a>.
     * @param {Pointer<Guid>} rguid Contains a GUID value that identifies the item to register.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-registercategory
     */
    RegisterCategory(rclsid, rcatid, rguid) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", rcatid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * ITfCategoryMgr::UnregisterCategory method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that owns the item.
     * @param {Pointer<Guid>} rcatid Contains a GUID that identifies the category that the item is registered under.
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the item to remove.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-unregistercategory
     */
    UnregisterCategory(rclsid, rcatid, rguid) {
        result := ComCall(4, this, "ptr", rclsid, "ptr", rcatid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * ITfCategoryMgr::EnumCategoriesInItem method
     * @param {Pointer<Guid>} rguid Contains a GUID value that identifies the item to enumerate the categories for.
     * @returns {IEnumGUID} Pointer to an IEnumGUID interface pointer that receives the enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-enumcategoriesinitem
     */
    EnumCategoriesInItem(rguid) {
        result := ComCall(5, this, "ptr", rguid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * ITfCategoryMgr::EnumItemsInCategory method
     * @param {Pointer<Guid>} rcatid Contains a GUID value that identifies the category to enumerate the items for.
     * @returns {IEnumGUID} Pointer to an IEnumGUID interface pointer that receives the enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-enumitemsincategory
     */
    EnumItemsInCategory(rcatid) {
        result := ComCall(6, this, "ptr", rcatid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * ITfCategoryMgr::FindClosestCategory method
     * @param {Pointer<Guid>} rguid Specifies the address of the GUID for which to find the closest category.
     * @param {Pointer<Pointer<Guid>>} ppcatidList Pointer to a pointer that specifies an array of CATIDs to search for the closest category.
     * @param {Integer} ulCount Specifies the number of elements in the array of the <i>ppcatidList</i> parameter.
     * @returns {Guid} Pointer to the **GUID** that receives the CATID for the closest category.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-findclosestcategory
     */
    FindClosestCategory(rguid, ppcatidList, ulCount) {
        ppcatidListMarshal := ppcatidList is VarRef ? "ptr*" : "ptr"

        pcatid := Guid()
        result := ComCall(7, this, "ptr", rguid, "ptr", pcatid, ppcatidListMarshal, ppcatidList, "uint", ulCount, "HRESULT")
        return pcatid
    }

    /**
     * ITfCategoryMgr::RegisterGUIDDescription method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that owns the GUID.
     * @param {Pointer<Guid>} rguid Contains the GUID that the description is registered for.
     * @param {PWSTR} pchDesc Pointer to a <b>WCHAR</b> buffer that contains the description for the GUID.
     * @param {Integer} cch Contains the length, in characters, of the description string.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to register the description string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pchDest</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-registerguiddescription
     */
    RegisterGUIDDescription(rclsid, rguid, pchDesc, cch) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(8, this, "ptr", rclsid, "ptr", rguid, "ptr", pchDesc, "uint", cch, "HRESULT")
        return result
    }

    /**
     * ITfCategoryMgr::UnregisterGUIDDescription method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that owns the GUID.
     * @param {Pointer<Guid>} rguid Contains the GUID that the description is removed for.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-unregisterguiddescription
     */
    UnregisterGUIDDescription(rclsid, rguid) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * ITfCategoryMgr::GetGUIDDescription method
     * @param {Pointer<Guid>} rguid Specifies the GUID to obtain the description for.
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the description string. Allocate using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must free this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * 
     * Pointer to a <b>BSTR</b> value that receives the description string. This must be allocated using <b>SysAllocString</b>. The caller must free this memory using <b>SysFreeString</b> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-getguiddescription
     */
    GetGUIDDescription(rguid) {
        pbstrDesc := BSTR()
        result := ComCall(10, this, "ptr", rguid, "ptr", pbstrDesc, "HRESULT")
        return pbstrDesc
    }

    /**
     * ITfCategoryMgr::RegisterGUIDDWORD method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that owns the GUID.
     * @param {Pointer<Guid>} rguid Contains the GUID that the <b>DWORD</b> is registered for.
     * @param {Integer} dw Contains the <b>DWORD</b> value registered for the GUID.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to register the <b>DWORD</b> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-registerguiddword
     */
    RegisterGUIDDWORD(rclsid, rguid, dw) {
        result := ComCall(11, this, "ptr", rclsid, "ptr", rguid, "uint", dw, "HRESULT")
        return result
    }

    /**
     * ITfCategoryMgr::UnregisterGUIDDWORD method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that owns the GUID.
     * @param {Pointer<Guid>} rguid Contains the GUID that the <b>DWORD</b> is removed for.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-unregisterguiddword
     */
    UnregisterGUIDDWORD(rclsid, rguid) {
        result := ComCall(12, this, "ptr", rclsid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * ITfCategoryMgr::GetGUIDDWORD method
     * @param {Pointer<Guid>} rguid Specifies the address of the GUID for which to get the value.
     * @returns {Integer} Pointer to the <b>DWORD</b> variable that receives the value of the GUID.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-getguiddword
     */
    GetGUIDDWORD(rguid) {
        result := ComCall(13, this, "ptr", rguid, "uint*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * ITfCategoryMgr::RegisterGUID method
     * @param {Pointer<Guid>} rguid Contains the GUID to obtain the identifier for.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfguidatom">TfGuidAtom</a> value that receives the identifier of the GUID.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-registerguid
     */
    RegisterGUID(rguid) {
        result := ComCall(14, this, "ptr", rguid, "uint*", &pguidatom := 0, "HRESULT")
        return pguidatom
    }

    /**
     * ITfCategoryMgr::GetGUID method
     * @param {Integer} guidatom Contains a <b>TfGuidAtom</b> value that specifies the GUID to obtain.
     * @returns {Guid} Pointer to a <b>GUID</b> value that receives the <b>GUID</b> for the specified atom. Receives GUID_NULL if the <b>GUID</b> for the atom cannot be found.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-getguid
     */
    GetGUID(guidatom) {
        pguid := Guid()
        result := ComCall(15, this, "uint", guidatom, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * ITfCategoryMgr::IsEqualTfGuidAtom method
     * @param {Integer} guidatom Specifies an atom that represents a GUID in the internal table.
     * @param {Pointer<Guid>} rguid Specifies the address of the GUID to compare with the atom in the internal table.
     * @returns {BOOL} Pointer to a Boolean variable that receives an indication of whether the atom represents the GUID.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcategorymgr-isequaltfguidatom
     */
    IsEqualTfGuidAtom(guidatom, rguid) {
        result := ComCall(16, this, "uint", guidatom, "ptr", rguid, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }
}
