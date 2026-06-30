#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\MF_HDCP_STATUS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class IMFHDCPStatus extends IUnknown {

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
     * The Query object represents a compound query.
     * @param {Pointer<MF_HDCP_STATUS>} pStatus 
     * @param {Pointer<BOOL>} pfStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/query-object
     */
    Query(pStatus, pfStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pfStatusMarshal := pfStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, pfStatusMarshal, pfStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MF_HDCP_STATUS} _status 
     * @returns {HRESULT} 
     */
    Set(_status) {
        result := ComCall(4, this, "int", _status, "HRESULT")
        return result
    }
}
