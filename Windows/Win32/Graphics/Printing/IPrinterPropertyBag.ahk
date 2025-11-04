#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterPropertyBag extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{fea77364-df95-4a23-a905-019b79a8e481}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBool", "SetBool", "GetInt32", "SetInt32", "GetString", "SetString", "GetBytes", "SetBytes", "GetReadStream", "GetWriteStream"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<BOOL>} pbValue 
     * @returns {HRESULT} 
     */
    GetBool(bstrName, pbValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "ptr", pbValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BOOL} bValue 
     * @returns {HRESULT} 
     */
    SetBool(bstrName, bValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "int", bValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<Integer>} pnValue 
     * @returns {HRESULT} 
     */
    GetInt32(bstrName, pnValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pnValueMarshal := pnValue is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", bstrName, pnValueMarshal, pnValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} nValue 
     * @returns {HRESULT} 
     */
    SetInt32(bstrName, nValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "int", nValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    GetString(bstrName, pbstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, "ptr", bstrName, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    SetString(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(12, this, "ptr", bstrName, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<Integer>} pcbValue 
     * @param {Pointer<Pointer<Integer>>} ppValue 
     * @returns {HRESULT} 
     */
    GetBytes(bstrName, pcbValue, ppValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", bstrName, pcbValueMarshal, pcbValue, ppValueMarshal, ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} cbValue 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     */
    SetBytes(bstrName, cbValue, pValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, "ptr", bstrName, "uint", cbValue, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IStream>} ppValue 
     * @returns {HRESULT} 
     */
    GetReadStream(bstrName, ppValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(15, this, "ptr", bstrName, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IStream>} ppValue 
     * @returns {HRESULT} 
     */
    GetWriteStream(bstrName, ppValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "ptr*", ppValue, "HRESULT")
        return result
    }
}
