#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsHold interface provides methods for an ADSI client to access the Hold attribute.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadshold
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsHold extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsHold
     * @type {Guid}
     */
    static IID => Guid("{b3eb3b37-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ObjectName", "put_ObjectName", "get_Amount", "put_Amount"]

    /**
     * @type {BSTR} 
     */
    ObjectName {
        get => this.get_ObjectName()
        set => this.put_ObjectName(value)
    }

    /**
     * @type {Integer} 
     */
    Amount {
        get => this.get_Amount()
        set => this.put_Amount(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectName() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        if(bstrObjectName is String) {
            pin := BSTR.Alloc(bstrObjectName)
            bstrObjectName := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrObjectName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Amount() {
        result := ComCall(9, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnAmount 
     * @returns {HRESULT} 
     */
    put_Amount(lnAmount) {
        result := ComCall(10, this, "int", lnAmount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
