#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsNetAddress interface provides methods for an ADSI client to access the Net Address attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsnetaddress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsNetAddress extends IDispatch{
    /**
     * The interface identifier for IADsNetAddress
     * @type {Guid}
     */
    static IID => Guid("{b21a50a9-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_AddressType(retval) {
        result := ComCall(7, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnAddressType 
     * @returns {HRESULT} 
     */
    put_AddressType(lnAddressType) {
        result := ComCall(8, this, "int", lnAddressType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Address(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vAddress 
     * @returns {HRESULT} 
     */
    put_Address(vAddress) {
        result := ComCall(10, this, "ptr", vAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
