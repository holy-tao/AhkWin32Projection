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
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rcatid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     */
    RegisterCategory(rclsid, rcatid, rguid) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", rcatid, "ptr", rguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rcatid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     */
    UnregisterCategory(rclsid, rcatid, rguid) {
        result := ComCall(4, this, "ptr", rclsid, "ptr", rcatid, "ptr", rguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumCategoriesInItem(rguid, ppEnum) {
        result := ComCall(5, this, "ptr", rguid, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rcatid 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumItemsInCategory(rcatid, ppEnum) {
        result := ComCall(6, this, "ptr", rcatid, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Guid>} pcatid 
     * @param {Pointer<Guid>} ppcatidList 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    FindClosestCategory(rguid, pcatid, ppcatidList, ulCount) {
        result := ComCall(7, this, "ptr", rguid, "ptr", pcatid, "ptr", ppcatidList, "uint", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @param {PWSTR} pchDesc 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    RegisterGUIDDescription(rclsid, rguid, pchDesc, cch) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(8, this, "ptr", rclsid, "ptr", rguid, "ptr", pchDesc, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     */
    UnregisterGUIDDescription(rclsid, rguid) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", rguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @returns {HRESULT} 
     */
    GetGUIDDescription(rguid, pbstrDesc) {
        result := ComCall(10, this, "ptr", rguid, "ptr", pbstrDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    RegisterGUIDDWORD(rclsid, rguid, dw) {
        result := ComCall(11, this, "ptr", rclsid, "ptr", rguid, "uint", dw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     */
    UnregisterGUIDDWORD(rclsid, rguid) {
        result := ComCall(12, this, "ptr", rclsid, "ptr", rguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<UInt32>} pdw 
     * @returns {HRESULT} 
     */
    GetGUIDDWORD(rguid, pdw) {
        result := ComCall(13, this, "ptr", rguid, "uint*", pdw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<UInt32>} pguidatom 
     * @returns {HRESULT} 
     */
    RegisterGUID(rguid, pguidatom) {
        result := ComCall(14, this, "ptr", rguid, "uint*", pguidatom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} guidatom 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetGUID(guidatom, pguid) {
        result := ComCall(15, this, "uint", guidatom, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} guidatom 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     */
    IsEqualTfGuidAtom(guidatom, rguid, pfEqual) {
        result := ComCall(16, this, "uint", guidatom, "ptr", rguid, "ptr", pfEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
