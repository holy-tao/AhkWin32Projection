#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    PduData {
        get => this.get_PduData()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * The index of the message in the device SMS store.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_index
     */
    get_Index() {
        result := ComCall(3, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * The type of message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_status
     */
    get_Status() {
        result := ComCall(4, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * The PDU message in hexadecimal format as used by GSM devices.
     * @remarks
     * 
     *   For GSM devices, this data in <i>PduData</i> is compliant to the PDU structure defined in 3GPP TS 27.005 and 3GPP TS 23.040.
     * 
     * The table below shows an example of how a PDU message containing the message "Hello" would be structured.
     * 
     * 
     * <table>
     * <tr>
     * <th>Example</th>
     * <td>07</td>
     * <td>91198994000010</td>
     * <td>11000A9189945086180000AA05C8329BFD06</td>
     * </tr>
     * <tr>
     * <th>Contents</th>
     * <td>Size of Service Center Address</td>
     * <td>Service Center Address</td>
     * <td>PDU in hexadecimal format</td>
     * </tr>
     * <tr>
     * <th>Size</th>
     * <td>1 byte</td>
     * <td>Variable</td>
     * <td>Variable</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For CDMA devices, this property returns <b>NULL</b>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_pdudata
     */
    get_PduData() {
        PduData := BSTR()
        result := ComCall(5, this, "ptr", PduData, "HRESULT")
        return PduData
    }

    /**
     * Message in WMT format as used by CDMA devices.
     * @remarks
     * 
     * For CDMA devices, this returns a byte array representing a message as defined in section 3.4.2.1 “SMS Point-to-Point Message” in the 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”. SMS will only support the Wireless Messaging Teleservice (WMT) format.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_message
     */
    get_Message() {
        result := ComCall(6, this, "ptr*", &Message := 0, "HRESULT")
        return Message
    }
}
