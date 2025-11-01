#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHDCPStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFHDCPStatus
     * @type {Guid}
     */
    static IID => Guid("{de400f54-5bf1-40cf-8964-0bea136b1e3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Query", "Set"]

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<BOOL>} pfStatus 
     * @returns {HRESULT} 
     */
    Query(pStatus, pfStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, "ptr", pfStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     */
    Set(status) {
        result := ComCall(4, this, "int", status, "HRESULT")
        return result
    }
}
