#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * IMPEG2_TIF_CONTROL is no longer available for use.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2_TIF_CONTROL)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-impeg2_tif_control
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2_TIF_CONTROL extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMPEG2_TIF_CONTROL
     * @type {Guid}
     */
    static IID => Guid("{f9bac2f9-4149-4916-b2ef-faa202326862}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterTIF", "UnregisterTIF", "AddPIDs", "DeletePIDs", "GetPIDCount", "GetPIDs"]

    /**
     * 
     * @param {IUnknown} pUnkTIF 
     * @param {Pointer<Integer>} ppvRegistrationContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-registertif
     */
    RegisterTIF(pUnkTIF, ppvRegistrationContext) {
        ppvRegistrationContextMarshal := ppvRegistrationContext is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkTIF, ppvRegistrationContextMarshal, ppvRegistrationContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pvRegistrationContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-unregistertif
     */
    UnregisterTIF(pvRegistrationContext) {
        result := ComCall(4, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulcPIDs 
     * @param {Pointer<Integer>} pulPIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-addpids
     */
    AddPIDs(ulcPIDs, pulPIDs) {
        pulPIDsMarshal := pulPIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulcPIDs, pulPIDsMarshal, pulPIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulcPIDs 
     * @param {Pointer<Integer>} pulPIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-deletepids
     */
    DeletePIDs(ulcPIDs, pulPIDs) {
        pulPIDsMarshal := pulPIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", ulcPIDs, pulPIDsMarshal, pulPIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-getpidcount
     */
    GetPIDCount() {
        result := ComCall(7, this, "uint*", &pulcPIDs := 0, "HRESULT")
        return pulcPIDs
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcPIDs 
     * @param {Pointer<Integer>} pulPIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-getpids
     */
    GetPIDs(pulcPIDs, pulPIDs) {
        pulcPIDsMarshal := pulcPIDs is VarRef ? "uint*" : "ptr"
        pulPIDsMarshal := pulPIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulcPIDsMarshal, pulcPIDs, pulPIDsMarshal, pulPIDs, "HRESULT")
        return result
    }
}
