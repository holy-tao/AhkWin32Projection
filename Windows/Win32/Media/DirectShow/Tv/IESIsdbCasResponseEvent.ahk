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
     * Gets the request identifier returned in an IsdbCasResponse event. The request identifier identifies the request originated by a PBDA media sink device (MSD).
     * @returns {Integer} Receives the request identifier.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesisdbcasresponseevent-getrequestid
     */
    GetRequestId() {
        result := ComCall(8, this, "uint*", &pRequestId := 0, "HRESULT")
        return pRequestId
    }

    /**
     * Gets the response status returned in an IsdbCasResponse event.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesisdbcasresponseevent-getstatus
     */
    GetStatus() {
        result := ComCall(9, this, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Gets the length of response data returned in anIsdbCasResponse event.
     * @returns {Integer} Receives the length of the response data, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesisdbcasresponseevent-getdatalength
     */
    GetDataLength() {
        result := ComCall(10, this, "uint*", &pRequestLength := 0, "HRESULT")
        return pRequestLength
    }

    /**
     * Gets the response data returned in an IsdbCasResponse event.
     * @returns {Pointer<SAFEARRAY>} Pointer to a buffer that receives the response data. The caller must free this memory after use.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesisdbcasresponseevent-getresponsedata
     */
    GetResponseData() {
        result := ComCall(11, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }
}
