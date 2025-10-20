#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPostalAddress interface provides methods for an ADSI client to access the Postal Address attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspostaladdress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPostalAddress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPostalAddress
     * @type {Guid}
     */
    static IID => Guid("{7adecf29-4680-11d1-a3b4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PostalAddress", "put_PostalAddress"]

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_PostalAddress(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vPostalAddress 
     * @returns {HRESULT} 
     */
    put_PostalAddress(vPostalAddress) {
        result := ComCall(8, this, "ptr", vPostalAddress, "HRESULT")
        return result
    }
}
