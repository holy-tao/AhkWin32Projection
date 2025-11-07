#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that extend on the INetDiagHelper interface to capture and provide information associated with diagnoses and resolution of network-related issues.
 * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nn-ndhelper-inetdiaghelperex
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagHelperEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetDiagHelperEx
     * @type {Guid}
     */
    static IID => Guid("{972dab4d-e4e3-4fc6-ae54-5f65ccde4a15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReconfirmLowHealth", "SetUtilities", "ReproduceFailure"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<HypothesisResult>} pResults 
     * @param {Pointer<PWSTR>} ppwszUpdatedDescription 
     * @param {Pointer<Integer>} pUpdatedStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelperex-reconfirmlowhealth
     */
    ReconfirmLowHealth(celt, pResults, ppwszUpdatedDescription, pUpdatedStatus) {
        ppwszUpdatedDescriptionMarshal := ppwszUpdatedDescription is VarRef ? "ptr*" : "ptr"
        pUpdatedStatusMarshal := pUpdatedStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", pResults, ppwszUpdatedDescriptionMarshal, ppwszUpdatedDescription, pUpdatedStatusMarshal, pUpdatedStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetDiagHelperUtilFactory} pUtilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelperex-setutilities
     */
    SetUtilities(pUtilities) {
        result := ComCall(4, this, "ptr", pUtilities, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelperex-reproducefailure
     */
    ReproduceFailure() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
