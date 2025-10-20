#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoDictionaryOld interface to manipulate the dictionary of Remote Access Dial-In User Service (RADIUS) attributes.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdodictionaryold
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoDictionaryOld extends IDispatch{
    /**
     * The interface identifier for ISdoDictionaryOld
     * @type {Guid}
     */
    static IID => Guid("{d432e5f4-53d8-11d2-9a3a-00c04fb998ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} Id 
     * @param {Pointer<VARIANT>} pValues 
     * @returns {HRESULT} 
     */
    EnumAttributes(Id, pValues) {
        result := ComCall(7, this, "ptr", Id, "ptr", pValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pInfoIDs 
     * @param {Pointer<VARIANT>} pInfoValues 
     * @returns {HRESULT} 
     */
    GetAttributeInfo(Id, pInfoIDs, pInfoValues) {
        result := ComCall(8, this, "uint", Id, "ptr", pInfoIDs, "ptr", pInfoValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pValueIds 
     * @param {Pointer<VARIANT>} pValuesDesc 
     * @returns {HRESULT} 
     */
    EnumAttributeValues(Id, pValueIds, pValuesDesc) {
        result := ComCall(9, this, "uint", Id, "ptr", pValueIds, "ptr", pValuesDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<IDispatch>} ppAttributeObject 
     * @returns {HRESULT} 
     */
    CreateAttribute(Id, ppAttributeObject) {
        result := ComCall(10, this, "uint", Id, "ptr", ppAttributeObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttributeName 
     * @param {Pointer<UInt32>} pId 
     * @returns {HRESULT} 
     */
    GetAttributeID(bstrAttributeName, pId) {
        bstrAttributeName := bstrAttributeName is String ? BSTR.Alloc(bstrAttributeName).Value : bstrAttributeName

        result := ComCall(11, this, "ptr", bstrAttributeName, "uint*", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
