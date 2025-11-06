#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsOctetList interface provides methods for an ADSI client to access the Octet List attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsoctetlist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsOctetList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsOctetList
     * @type {Guid}
     */
    static IID => Guid("{7b28b80f-4680-11d1-a3b4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OctetList", "put_OctetList"]

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OctetList() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOctetList 
     * @returns {HRESULT} 
     */
    put_OctetList(vOctetList) {
        result := ComCall(8, this, "ptr", vOctetList, "HRESULT")
        return result
    }
}
