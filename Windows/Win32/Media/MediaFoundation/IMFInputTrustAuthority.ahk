#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables other components in the protected media path (PMP) to use the input protection system provided by an input trust authorities (ITA).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfinputtrustauthority
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFInputTrustAuthority extends IUnknown{
    /**
     * The interface identifier for IMFInputTrustAuthority
     * @type {Guid}
     */
    static IID => Guid("{d19f8e98-b126-4446-890c-5dcb7ad71453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetDecrypter(riid, ppv) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Action 
     * @param {Pointer<IMFActivate>} ppContentEnablerActivate 
     * @returns {HRESULT} 
     */
    RequestAccess(Action, ppContentEnablerActivate) {
        result := ComCall(4, this, "int", Action, "ptr", ppContentEnablerActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Action 
     * @param {Pointer<IMFOutputPolicy>} ppPolicy 
     * @returns {HRESULT} 
     */
    GetPolicy(Action, ppPolicy) {
        result := ComCall(5, this, "int", Action, "ptr", ppPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS>} pParam 
     * @returns {HRESULT} 
     */
    BindAccess(pParam) {
        result := ComCall(6, this, "ptr", pParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS>} pParam 
     * @returns {HRESULT} 
     */
    UpdateAccess(pParam) {
        result := ComCall(7, this, "ptr", pParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
