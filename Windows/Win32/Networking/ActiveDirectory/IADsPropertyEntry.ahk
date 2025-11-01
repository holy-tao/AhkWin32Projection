#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPropertyEntry interface is used to manage a property entry in the property cache.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspropertyentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPropertyEntry
     * @type {Guid}
     */
    static IID => Guid("{05792c8e-941f-11d0-8529-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clear", "get_Name", "put_Name", "get_ADsType", "put_ADsType", "get_ControlCode", "put_ControlCode", "get_Values", "put_Values"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Name(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ADsType(retval) {
        result := ComCall(10, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnADsType 
     * @returns {HRESULT} 
     */
    put_ADsType(lnADsType) {
        result := ComCall(11, this, "int", lnADsType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ControlCode(retval) {
        result := ComCall(12, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnControlCode 
     * @returns {HRESULT} 
     */
    put_ControlCode(lnControlCode) {
        result := ComCall(13, this, "int", lnControlCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Values(retval) {
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vValues 
     * @returns {HRESULT} 
     */
    put_Values(vValues) {
        result := ComCall(15, this, "ptr", vValues, "HRESULT")
        return result
    }
}
