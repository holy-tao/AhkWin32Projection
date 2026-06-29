#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MBN_MSG_STATUS.ahk" { MBN_MSG_STATUS }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * A collection of properties that represent an SMS message read from the device memory.
 * @remarks
 * This interface is provided by the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete">OnSmsReadComplete</a> and 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsnewclass0message">OnSmsNewClass0Message</a> methods of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsmsreadmsgpdu
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSmsReadMsgPdu extends IUnknown {
    /**
     * The interface identifier for IMbnSmsReadMsgPdu
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2013-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSmsReadMsgPdu interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Index   : IntPtr
        get_Status  : IntPtr
        get_PduData : IntPtr
        get_Message : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSmsReadMsgPdu.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * @type {MBN_MSG_STATUS} 
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_index
     */
    get_Index() {
        result := ComCall(3, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * The type of message. (IMbnSmsReadMsgPdu.get_Status)
     * @returns {MBN_MSG_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_status
     */
    get_Status() {
        result := ComCall(4, this, "int*", &_Status := 0, "HRESULT")
        return _Status
    }

    /**
     * The PDU message in hexadecimal format as used by GSM devices.
     * @remarks
     * For GSM devices, this data in <i>PduData</i> is compliant to the PDU structure defined in 3GPP TS 27.005 and 3GPP TS 23.040.
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_pdudata
     */
    get_PduData() {
        PduData := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, PduData, "HRESULT")
        return PduData
    }

    /**
     * Message in WMT format as used by CDMA devices.
     * @remarks
     * For CDMA devices, this returns a byte array representing a message as defined in section 3.4.2.1 “SMS Point-to-Point Message” in the 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”. SMS will only support the Wireless Messaging Teleservice (WMT) format.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgpdu-get_message
     */
    get_Message() {
        result := ComCall(6, this, "ptr*", &Message := 0, "HRESULT")
        return Message
    }

    Query(iid) {
        if (IMbnSmsReadMsgPdu.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Index := CallbackCreate(GetMethod(implObj, "get_Index"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_PduData := CallbackCreate(GetMethod(implObj, "get_PduData"), flags, 2)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Index)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_PduData)
        CallbackFree(this.vtbl.get_Message)
    }
}
