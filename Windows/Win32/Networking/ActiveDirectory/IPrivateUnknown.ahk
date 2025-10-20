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
     * 
     * @param {BSTR} lpszUserName 
     * @param {BSTR} lpszPassword 
     * @param {Integer} lnReserved 
     * @returns {HRESULT} 
     */
    ADSIInitializeObject(lpszUserName, lpszPassword, lnReserved) {
        lpszUserName := lpszUserName is String ? BSTR.Alloc(lpszUserName).Value : lpszUserName
        lpszPassword := lpszPassword is String ? BSTR.Alloc(lpszPassword).Value : lpszPassword

        result := ComCall(3, this, "ptr", lpszUserName, "ptr", lpszPassword, "int", lnReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ADSIReleaseObject() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
