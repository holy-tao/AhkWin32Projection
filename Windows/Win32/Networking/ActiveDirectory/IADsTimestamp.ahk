#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsTimestamp interface provides methods for an ADSI client to access the Timestamp attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadstimestamp
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsTimestamp extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsTimestamp
     * @type {Guid}
     */
    static IID => Guid("{b2f5a901-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WholeSeconds", "put_WholeSeconds", "get_EventID", "put_EventID"]

    /**
     * 
     * @returns {Integer} 
     */
    get_WholeSeconds() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnWholeSeconds 
     * @returns {HRESULT} 
     */
    put_WholeSeconds(lnWholeSeconds) {
        result := ComCall(8, this, "int", lnWholeSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventID() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnEventID 
     * @returns {HRESULT} 
     */
    put_EventID(lnEventID) {
        result := ComCall(10, this, "int", lnEventID, "HRESULT")
        return result
    }
}
