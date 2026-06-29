#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\MBN_SMS_CDMA_ENCODING.ahk" { MBN_SMS_CDMA_ENCODING }
#Import ".\MBN_SMS_CDMA_LANG.ahk" { MBN_SMS_CDMA_LANG }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MBN_MSG_STATUS.ahk" { MBN_MSG_STATUS }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * A collection of properties that represent a CDMA format SMS message read from the device memory.
 * @remarks
 * This message format is valid only for CDMA devices and cannot be used with GSM devices.
 * 
 *  This interface is provided by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete">OnSmsReadComplete</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsnewclass0message">OnSmsNewClass0Message</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsmsreadmsgtextcdma
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSmsReadMsgTextCdma extends IUnknown {
    /**
     * The interface identifier for IMbnSmsReadMsgTextCdma
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2014-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSmsReadMsgTextCdma interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Index            : IntPtr
        get_Status           : IntPtr
        get_Address          : IntPtr
        get_Timestamp        : IntPtr
        get_EncodingID       : IntPtr
        get_LanguageID       : IntPtr
        get_SizeInCharacters : IntPtr
        get_Message          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSmsReadMsgTextCdma.Vtbl()
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
    Address {
        get => this.get_Address()
    }

    /**
     * @type {BSTR} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {MBN_SMS_CDMA_ENCODING} 
     */
    EncodingID {
        get => this.get_EncodingID()
    }

    /**
     * @type {MBN_SMS_CDMA_LANG} 
     */
    LanguageID {
        get => this.get_LanguageID()
    }

    /**
     * @type {Integer} 
     */
    SizeInCharacters {
        get => this.get_SizeInCharacters()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * The index of the message in device SMS memory.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_index
     */
    get_Index() {
        result := ComCall(3, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * The type of message. (IMbnSmsReadMsgTextCdma.get_Status)
     * @returns {MBN_MSG_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_status
     */
    get_Status() {
        result := ComCall(4, this, "int*", &_Status := 0, "HRESULT")
        return _Status
    }

    /**
     * The mobile number associated with a message.
     * @remarks
     * For a received message, this is the sender's number.  For a sent or draft message, this is the receiver's number.
     * 
     * 
     * The <i>address</i> can be in either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_address
     */
    get_Address() {
        _Address := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, _Address, "HRESULT")
        return _Address
    }

    /**
     * The timestamp of a message.
     * @remarks
     * The format of the timestamp string is "YY/MM/DD,HH:mm:SS±ZZ".
     * 
     * The following table defines the format of the timestamp string.
     * 
     * 
     * <table>
     * <tr>
     * <th>Field</th>
     * <th>Meaning</th>
     * <th>Example</th>
     * <th>Range</th>
     * </tr>
     * <tr>
     * <td>YY</td>
     * <td>Last 2 digits of the year</td>
     * <td>07 for 2007</td>
     * <td>00 through 99</td>
     * </tr>
     * <tr>
     * <td>MM</td>
     * <td>Month in double digits</td>
     * <td>01 for January</td>
     * <td>01 through 12</td>
     * </tr>
     * <tr>
     * <td>DD</td>
     * <td>Date in double digits</td>
     * <td>01 for the 1st</td>
     * <td>01 through 31</td>
     * </tr>
     * <tr>
     * <td>HH</td>
     * <td>Hours in 24 hour format</td>
     * <td>13 for 1PM</td>
     * <td>00 through 23</td>
     * </tr>
     * <tr>
     * <td>mm</td>
     * <td>Minutes in double digits</td>
     * <td>1 for 1 minute</td>
     * <td>00 through 59</td>
     * </tr>
     * <tr>
     * <td>SS</td>
     * <td>Seconds in double digits</td>
     * <td>01 for 1 second</td>
     * <td>00 though 59</td>
     * </tr>
     * <tr>
     * <td>ZZ</td>
     * <td>Time in relation to GMT</td>
     * <td>+01 for 1 hour greater</td>
     * <td>-12 through +13</td>
     * </tr>
     * </table>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_timestamp
     */
    get_Timestamp() {
        _Timestamp := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, _Timestamp, "HRESULT")
        return _Timestamp
    }

    /**
     * The data encoding used in the message.
     * @returns {MBN_SMS_CDMA_ENCODING} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_encodingid
     */
    get_EncodingID() {
        result := ComCall(7, this, "int*", &EncodingID := 0, "HRESULT")
        return EncodingID
    }

    /**
     * The language used in the message.
     * @returns {MBN_SMS_CDMA_LANG} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_languageid
     */
    get_LanguageID() {
        result := ComCall(8, this, "int*", &LanguageID := 0, "HRESULT")
        return LanguageID
    }

    /**
     * The size in characters of the message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_sizeincharacters
     */
    get_SizeInCharacters() {
        result := ComCall(9, this, "uint*", &SizeInCharacters := 0, "HRESULT")
        return SizeInCharacters
    }

    /**
     * The contents of the message.
     * @remarks
     * The maximum size of the message is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_cdmashortmsgsize">CdmaShortMsgSize</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>  The size can also be no larger than <b>MBN_CDMA_SHORT_MSG_SIZE_MAX</b> (160).
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_message
     */
    get_Message() {
        result := ComCall(10, this, "ptr*", &Message := 0, "HRESULT")
        return Message
    }

    Query(iid) {
        if (IMbnSmsReadMsgTextCdma.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Index := CallbackCreate(GetMethod(implObj, "get_Index"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.get_Timestamp := CallbackCreate(GetMethod(implObj, "get_Timestamp"), flags, 2)
        this.vtbl.get_EncodingID := CallbackCreate(GetMethod(implObj, "get_EncodingID"), flags, 2)
        this.vtbl.get_LanguageID := CallbackCreate(GetMethod(implObj, "get_LanguageID"), flags, 2)
        this.vtbl.get_SizeInCharacters := CallbackCreate(GetMethod(implObj, "get_SizeInCharacters"), flags, 2)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Index)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.get_Timestamp)
        CallbackFree(this.vtbl.get_EncodingID)
        CallbackFree(this.vtbl.get_LanguageID)
        CallbackFree(this.vtbl.get_SizeInCharacters)
        CallbackFree(this.vtbl.get_Message)
    }
}
