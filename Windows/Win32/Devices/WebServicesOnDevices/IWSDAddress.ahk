#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the individual components of a transport address.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDAddress extends IUnknown{
    /**
     * The interface identifier for IWSDAddress
     * @type {Guid}
     */
    static IID => Guid("{b9574c6c-12a6-4f74-93a1-3318ff605759}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszBuffer 
     * @param {Integer} cchLength 
     * @param {BOOL} fSafe 
     * @returns {HRESULT} 
     */
    Serialize(pszBuffer, cchLength, fSafe) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(3, this, "ptr", pszBuffer, "uint", cchLength, "int", fSafe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszBuffer 
     * @returns {HRESULT} 
     */
    Deserialize(pszBuffer) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(4, this, "ptr", pszBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
