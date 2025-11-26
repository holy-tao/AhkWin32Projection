#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that initialize or retrieve Protected Broadcast Driver Architecture (PBDA) service records from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbda_services
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDA_Services extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPBDA_Services
     * @type {Guid}
     */
    static IID => Guid("{944eab37-eed4-4850-afd2-77e7efeb4427}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetCountOfRecords", "GetRecordByIndex"]

    /**
     * Initializes an object that retrieves service records from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} size Specifies the size of the buffer used to initialize the object.
     * @param {Pointer<Integer>} pBuffer Pointer to the buffer containing the service data used for initialization.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_services-initialize
     */
    Initialize(size, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", size, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the number of service records from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the number of service records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_services-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(4, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets a service record at a given position from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_services-getcountofrecords">IPBDA_Services::GetCountOfRecords</a> method to get the number of records in the PSIP table.
     * @returns {Integer} Receives the service record at the position given by <i>dwRecordIndex</i>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbda_services-getrecordbyindex
     */
    GetRecordByIndex(dwRecordIndex) {
        result := ComCall(5, this, "uint", dwRecordIndex, "uint*", &pul64ServiceIdx := 0, "HRESULT")
        return pul64ServiceIdx
    }
}
