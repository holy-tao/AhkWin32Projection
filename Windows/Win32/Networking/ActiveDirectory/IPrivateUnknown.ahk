#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IPrivateUnknown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrivateUnknown
     * @type {Guid}
     */
    static IID => Guid("{89126bab-6ead-11d1-8c18-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ADSIInitializeObject", "ADSIReleaseObject"]

    /**
     * 
     * @param {BSTR} lpszUserName 
     * @param {BSTR} lpszPassword 
     * @param {Integer} lnReserved 
     * @returns {HRESULT} 
     */
    ADSIInitializeObject(lpszUserName, lpszPassword, lnReserved) {
        if(lpszUserName is String) {
            pin := BSTR.Alloc(lpszUserName)
            lpszUserName := pin.Value
        }
        if(lpszPassword is String) {
            pin := BSTR.Alloc(lpszPassword)
            lpszPassword := pin.Value
        }

        result := ComCall(3, this, "ptr", lpszUserName, "ptr", lpszPassword, "int", lnReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ADSIReleaseObject() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
