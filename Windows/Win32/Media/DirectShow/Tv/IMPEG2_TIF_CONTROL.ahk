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
     * 
     * @param {Pointer<IUnknown>} pUnkTIF 
     * @param {Pointer<UInt32>} ppvRegistrationContext 
     * @returns {HRESULT} 
     */
    RegisterTIF(pUnkTIF, ppvRegistrationContext) {
        result := ComCall(3, this, "ptr", pUnkTIF, "uint*", ppvRegistrationContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pvRegistrationContext 
     * @returns {HRESULT} 
     */
    UnregisterTIF(pvRegistrationContext) {
        result := ComCall(4, this, "uint", pvRegistrationContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulcPIDs 
     * @param {Pointer<UInt32>} pulPIDs 
     * @returns {HRESULT} 
     */
    AddPIDs(ulcPIDs, pulPIDs) {
        result := ComCall(5, this, "uint", ulcPIDs, "uint*", pulPIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulcPIDs 
     * @param {Pointer<UInt32>} pulPIDs 
     * @returns {HRESULT} 
     */
    DeletePIDs(ulcPIDs, pulPIDs) {
        result := ComCall(6, this, "uint", ulcPIDs, "uint*", pulPIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcPIDs 
     * @returns {HRESULT} 
     */
    GetPIDCount(pulcPIDs) {
        result := ComCall(7, this, "uint*", pulcPIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcPIDs 
     * @param {Pointer<UInt32>} pulPIDs 
     * @returns {HRESULT} 
     */
    GetPIDs(pulcPIDs, pulPIDs) {
        result := ComCall(8, this, "uint*", pulcPIDs, "uint*", pulPIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
