#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements one step that must be performed for the user to access media content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfcontentenabler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentEnabler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentEnabler
     * @type {Guid}
     */
    static IID => Guid("{d3c4ef59-49ce-4381-9071-d5bcd044c770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnableType", "GetEnableURL", "GetEnableData", "IsAutomaticSupported", "AutomaticEnable", "MonitorEnable", "Cancel"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenabletype
     */
    GetEnableType() {
        pType := Guid()
        result := ComCall(3, this, "ptr", pType, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszURL 
     * @param {Pointer<Integer>} pcchURL 
     * @param {Pointer<Integer>} pTrustStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenableurl
     */
    GetEnableURL(ppwszURL, pcchURL, pTrustStatus) {
        ppwszURLMarshal := ppwszURL is VarRef ? "ptr*" : "ptr"
        pcchURLMarshal := pcchURL is VarRef ? "uint*" : "ptr"
        pTrustStatusMarshal := pTrustStatus is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppwszURLMarshal, ppwszURL, pcchURLMarshal, pcchURL, pTrustStatusMarshal, pTrustStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenabledata
     */
    GetEnableData(ppbData, pcbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-isautomaticsupported
     */
    IsAutomaticSupported() {
        result := ComCall(6, this, "int*", &pfAutomatic := 0, "HRESULT")
        return pfAutomatic
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-automaticenable
     */
    AutomaticEnable() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-monitorenable
     */
    MonitorEnable() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-cancel
     */
    Cancel() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
