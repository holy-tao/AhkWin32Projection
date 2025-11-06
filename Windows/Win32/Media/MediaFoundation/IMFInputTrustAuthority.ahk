#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFActivate.ahk
#Include .\IMFOutputPolicy.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables other components in the protected media path (PMP) to use the input protection system provided by an input trust authorities (ITA).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfinputtrustauthority
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFInputTrustAuthority extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecrypter", "RequestAccess", "GetPolicy", "BindAccess", "UpdateAccess", "Reset"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-getdecrypter
     */
    GetDecrypter(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} Action 
     * @returns {IMFActivate} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-requestaccess
     */
    RequestAccess(Action) {
        result := ComCall(4, this, "int", Action, "ptr*", &ppContentEnablerActivate := 0, "HRESULT")
        return IMFActivate(ppContentEnablerActivate)
    }

    /**
     * 
     * @param {Integer} Action 
     * @returns {IMFOutputPolicy} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-getpolicy
     */
    GetPolicy(Action) {
        result := ComCall(5, this, "int", Action, "ptr*", &ppPolicy := 0, "HRESULT")
        return IMFOutputPolicy(ppPolicy)
    }

    /**
     * 
     * @param {Pointer<MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS>} pParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-bindaccess
     */
    BindAccess(pParam) {
        result := ComCall(6, this, "ptr", pParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS>} pParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-updateaccess
     */
    UpdateAccess(pParam) {
        result := ComCall(7, this, "ptr", pParam, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
