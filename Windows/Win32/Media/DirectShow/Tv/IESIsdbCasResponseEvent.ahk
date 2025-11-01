#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Implements methods that get information from a Protected Broadcast Driver Architecture (PBDA) IsdbCasResponse event.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESIsdbCasResponseEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesisdbcasresponseevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESIsdbCasResponseEvent extends IESEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESIsdbCasResponseEvent
     * @type {Guid}
     */
    static IID => Guid("{2017cb03-dc0f-4c24-83ca-36307b2cd19f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRequestId", "GetStatus", "GetDataLength", "GetResponseData"]

    /**
     * 
     * @param {Pointer<Integer>} pRequestId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getrequestid
     */
    GetRequestId(pRequestId) {
        pRequestIdMarshal := pRequestId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pRequestIdMarshal, pRequestId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getstatus
     */
    GetStatus(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRequestLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getdatalength
     */
    GetDataLength(pRequestLength) {
        pRequestLengthMarshal := pRequestLength is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pRequestLengthMarshal, pRequestLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getresponsedata
     */
    GetResponseData(pbData) {
        result := ComCall(11, this, "ptr*", pbData, "HRESULT")
        return result
    }
}
