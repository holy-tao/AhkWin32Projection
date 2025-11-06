#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IPrinterScriptableStream.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptablePropertyBag extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptablePropertyBag
     * @type {Guid}
     */
    static IID => Guid("{91c7765f-ed57-49ad-8b01-dc24816a5294}")

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
     * @returns {BOOL} 
     */
    GetBool(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "int*", &pbValue := 0, "HRESULT")
        return pbValue
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
     * @returns {Integer} 
     */
    GetInt32(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "int*", &pnValue := 0, "HRESULT")
        return pnValue
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
     * @returns {BSTR} 
     */
    GetString(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbstrValue := BSTR()
        result := ComCall(11, this, "ptr", bstrName, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
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
     * @returns {IDispatch} 
     */
    GetBytes(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "ptr", bstrName, "ptr*", &ppArray := 0, "HRESULT")
        return IDispatch(ppArray)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {IDispatch} pArray 
     * @returns {HRESULT} 
     */
    SetBytes(bstrName, pArray) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(14, this, "ptr", bstrName, "ptr", pArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IPrinterScriptableStream} 
     */
    GetReadStream(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(15, this, "ptr", bstrName, "ptr*", &ppStream := 0, "HRESULT")
        return IPrinterScriptableStream(ppStream)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IPrinterScriptableStream} 
     */
    GetWriteStream(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "ptr*", &ppStream := 0, "HRESULT")
        return IPrinterScriptableStream(ppStream)
    }
}
