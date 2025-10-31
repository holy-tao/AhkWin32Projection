#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of properties that represent an SMS message read from the device memory.
 * @remarks
 * 
  * This interface is provided by the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete">OnSmsReadComplete</a> and 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsnewclass0message">OnSmsNewClass0Message</a> methods of the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsmsreadmsgpdu
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSmsReadMsgPdu extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSmsReadMsgPdu
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2013-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Index", "get_Status", "get_PduData", "get_Message"]

    /**
     * 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_index
     */
    get_Index(Index) {
        result := ComCall(3, this, "uint*", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_status
     */
    get_Status(Status) {
        result := ComCall(4, this, "int*", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} PduData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_pdudata
     */
    get_PduData(PduData) {
        result := ComCall(5, this, "ptr", PduData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} Message 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_message
     */
    get_Message(Message) {
        result := ComCall(6, this, "ptr*", Message, "HRESULT")
        return result
    }
}
