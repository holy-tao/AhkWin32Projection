#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to activate the COM+ component load balancing service.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomlbarguments
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICOMLBArguments extends IUnknown{
    /**
     * The interface identifier for ICOMLBArguments
     * @type {Guid}
     */
    static IID => Guid("{3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pCLSID 
     * @returns {HRESULT} 
     */
    GetCLSID(pCLSID) {
        result := ComCall(3, this, "ptr", pCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCLSID 
     * @returns {HRESULT} 
     */
    SetCLSID(pCLSID) {
        result := ComCall(4, this, "ptr", pCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchSvr 
     * @param {PWSTR} szServerName 
     * @returns {HRESULT} 
     */
    GetMachineName(cchSvr, szServerName) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(5, this, "uint", cchSvr, "ptr", szServerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchSvr 
     * @param {PWSTR} szServerName 
     * @returns {HRESULT} 
     */
    SetMachineName(cchSvr, szServerName) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(6, this, "uint", cchSvr, "ptr", szServerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
