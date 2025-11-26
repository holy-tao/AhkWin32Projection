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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCLSID", "SetCLSID", "GetMachineName", "SetMachineName"]

    /**
     * Retrieves the object's CLSID.
     * @param {Pointer<Guid>} pCLSID A pointer to the object's CLSID.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomlbarguments-getclsid
     */
    GetCLSID(pCLSID) {
        result := ComCall(3, this, "ptr", pCLSID, "HRESULT")
        return result
    }

    /**
     * Sets the object's CLSID.
     * @param {Pointer<Guid>} pCLSID The object's CLSID.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomlbarguments-setclsid
     */
    SetCLSID(pCLSID) {
        result := ComCall(4, this, "ptr", pCLSID, "HRESULT")
        return result
    }

    /**
     * Retrieves the computer name for the load balancing server.
     * @param {Integer} cchSvr The object's machine name.
     * @param {PWSTR} szServerName The object's server name.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomlbarguments-getmachinename
     */
    GetMachineName(cchSvr, szServerName) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(5, this, "uint", cchSvr, "ptr", szServerName, "HRESULT")
        return result
    }

    /**
     * Sets the computer name for the load balancing server.
     * @param {Integer} cchSvr The object's machine name.
     * @param {PWSTR} szServerName The object's server name.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomlbarguments-setmachinename
     */
    SetMachineName(cchSvr, szServerName) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(6, this, "uint", cchSvr, "ptr", szServerName, "HRESULT")
        return result
    }
}
