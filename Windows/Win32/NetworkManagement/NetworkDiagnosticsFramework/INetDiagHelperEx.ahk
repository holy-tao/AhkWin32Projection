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
     * 
     * @param {Integer} celt 
     * @param {Pointer<HypothesisResult>} pResults 
     * @param {Pointer<PWSTR>} ppwszUpdatedDescription 
     * @param {Pointer<Int32>} pUpdatedStatus 
     * @returns {HRESULT} 
     */
    ReconfirmLowHealth(celt, pResults, ppwszUpdatedDescription, pUpdatedStatus) {
        result := ComCall(3, this, "uint", celt, "ptr", pResults, "ptr", ppwszUpdatedDescription, "int*", pUpdatedStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetDiagHelperUtilFactory>} pUtilities 
     * @returns {HRESULT} 
     */
    SetUtilities(pUtilities) {
        result := ComCall(4, this, "ptr", pUtilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReproduceFailure() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
