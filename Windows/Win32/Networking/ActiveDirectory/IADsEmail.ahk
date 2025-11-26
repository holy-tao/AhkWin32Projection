#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsEmail interface provides methods for an ADSI client to access the Email Address attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsemail
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsEmail extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsEmail
     * @type {Guid}
     */
    static IID => Guid("{97af011a-478e-11d1-a3b4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_Address", "put_Address"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnType 
     * @returns {HRESULT} 
     */
    put_Type(lnType) {
        result := ComCall(8, this, "int", lnType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Address() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrAddress 
     * @returns {HRESULT} 
     */
    put_Address(bstrAddress) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress

        result := ComCall(10, this, "ptr", bstrAddress, "HRESULT")
        return result
    }
}
