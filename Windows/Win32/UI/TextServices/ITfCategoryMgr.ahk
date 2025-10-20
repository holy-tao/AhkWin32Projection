#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rcatid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-registercategory
     */
    RegisterCategory(rclsid, rcatid, rguid) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", rcatid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rcatid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-unregistercategory
     */
    UnregisterCategory(rclsid, rcatid, rguid) {
        result := ComCall(4, this, "ptr", rclsid, "ptr", rcatid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-enumcategoriesinitem
     */
    EnumCategoriesInItem(rguid, ppEnum) {
        result := ComCall(5, this, "ptr", rguid, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rcatid 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-enumitemsincategory
     */
    EnumItemsInCategory(rcatid, ppEnum) {
        result := ComCall(6, this, "ptr", rcatid, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Guid>} pcatid 
     * @param {Pointer<Pointer<Guid>>} ppcatidList 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-findclosestcategory
     */
    FindClosestCategory(rguid, pcatid, ppcatidList, ulCount) {
        result := ComCall(7, this, "ptr", rguid, "ptr", pcatid, "ptr*", ppcatidList, "uint", ulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @param {PWSTR} pchDesc 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-registerguiddescription
     */
    RegisterGUIDDescription(rclsid, rguid, pchDesc, cch) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(8, this, "ptr", rclsid, "ptr", rguid, "ptr", pchDesc, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-unregisterguiddescription
     */
    UnregisterGUIDDescription(rclsid, rguid) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-getguiddescription
     */
    GetGUIDDescription(rguid, pbstrDesc) {
        result := ComCall(10, this, "ptr", rguid, "ptr", pbstrDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-registerguiddword
     */
    RegisterGUIDDWORD(rclsid, rguid, dw) {
        result := ComCall(11, this, "ptr", rclsid, "ptr", rguid, "uint", dw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-unregisterguiddword
     */
    UnregisterGUIDDWORD(rclsid, rguid) {
        result := ComCall(12, this, "ptr", rclsid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Integer>} pdw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-getguiddword
     */
    GetGUIDDWORD(rguid, pdw) {
        result := ComCall(13, this, "ptr", rguid, "uint*", pdw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Integer>} pguidatom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-registerguid
     */
    RegisterGUID(rguid, pguidatom) {
        result := ComCall(14, this, "ptr", rguid, "uint*", pguidatom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} guidatom 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-getguid
     */
    GetGUID(guidatom, pguid) {
        result := ComCall(15, this, "uint", guidatom, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} guidatom 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcategorymgr-isequaltfguidatom
     */
    IsEqualTfGuidAtom(guidatom, rguid, pfEqual) {
        result := ComCall(16, this, "uint", guidatom, "ptr", rguid, "ptr", pfEqual, "HRESULT")
        return result
    }
}
