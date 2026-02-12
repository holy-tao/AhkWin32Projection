#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
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
     * Retrieves a named Boolean value from a BLOB.
     * @param {BSTR} bstrName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getboolfromblob
     */
    GetBool(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrName, "int*", &pbValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbValue
    }

    /**
     * The SetBoolInBlob function sets a Boolean value at a given location within a BLOB.
     * @param {BSTR} bstrName 
     * @param {BOOL} bValue 
     * @returns {HRESULT} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/setboolinblob
     */
    SetBool(bstrName, bValue) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrName, "int", bValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {Integer} 
     */
    GetInt32(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrName, "int*", &pnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnValue
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} nValue 
     * @returns {HRESULT} 
     */
    SetInt32(bstrName, nValue) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrName, "int", nValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * GetString Method Example (VC++)
     * @param {BSTR} bstrName 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getstring-method-example-vc
     */
    GetString(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        pbstrValue := BSTR()
        result := ComCall(11, this, "ptr", bstrName, "ptr", pbstrValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrValue
    }

    /**
     * Sets a string at a given location within a BLOB.
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the problem.
     * 
     * If the specified **Owner**, **Category**, or **Tag** information does not exist, the return value is NMERR\_BLOB\_ENTRY\_DOES\_NOT\_EXIST.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/setstringinblob
     */
    SetString(bstrName, bstrValue) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrValue is String) {
            pin := BSTR.Alloc(bstrValue)
            bstrValue := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrName, "ptr", bstrValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", bstrName, pcbValueMarshal, pcbValue, ppValueMarshal, ppValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, "ptr", bstrName, "uint", cbValue, pValueMarshal, pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IStream} 
     */
    GetReadStream(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(15, this, "ptr", bstrName, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppValue)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IStream} 
     */
    GetWriteStream(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrName, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppValue)
    }
}
