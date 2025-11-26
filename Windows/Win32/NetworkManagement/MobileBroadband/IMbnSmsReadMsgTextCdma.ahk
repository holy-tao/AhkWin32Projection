#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of properties that represent a CDMA format SMS message read from the device memory.
 * @remarks
 * 
 * This message format is valid only for CDMA devices and cannot be used with GSM devices.
 * 
 *  This interface is provided by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete">OnSmsReadComplete</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsnewclass0message">OnSmsNewClass0Message</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsmsreadmsgtextcdma
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSmsReadMsgTextCdma extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSmsReadMsgTextCdma
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2014-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Index", "get_Status", "get_Address", "get_Timestamp", "get_EncodingID", "get_LanguageID", "get_SizeInCharacters", "get_Message"]

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
     * @type {Integer} 
     */
    EncodingID {
        get => this.get_EncodingID()
    }

    /**
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_index
     */
    get_Index() {
        result := ComCall(3, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * The type of message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_status
     */
    get_Status() {
        result := ComCall(4, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * The mobile number associated with a message.
     * @remarks
     * 
     * For a received message, this is the sender's number.  For a sent or draft message, this is the receiver's number.
     * 
     * 
     * The <i>address</i> can be in either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_address
     */
    get_Address() {
        Address := BSTR()
        result := ComCall(5, this, "ptr", Address, "HRESULT")
        return Address
    }

    /**
     * The timestamp of a message.
     * @remarks
     * 
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
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_timestamp
     */
    get_Timestamp() {
        Timestamp := BSTR()
        result := ComCall(6, this, "ptr", Timestamp, "HRESULT")
        return Timestamp
    }

    /**
     * The data encoding used in the message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_encodingid
     */
    get_EncodingID() {
        result := ComCall(7, this, "int*", &EncodingID := 0, "HRESULT")
        return EncodingID
    }

    /**
     * The language used in the message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_languageid
     */
    get_LanguageID() {
        result := ComCall(8, this, "int*", &LanguageID := 0, "HRESULT")
        return LanguageID
    }

    /**
     * The size in characters of the message.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_sizeincharacters
     */
    get_SizeInCharacters() {
        result := ComCall(9, this, "uint*", &SizeInCharacters := 0, "HRESULT")
        return SizeInCharacters
    }

    /**
     * The contents of the message.
     * @remarks
     * 
     * The maximum size of the message is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_cdmashortmsgsize">CdmaShortMsgSize</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>  The size can also be no larger than <b>MBN_CDMA_SHORT_MSG_SIZE_MAX</b> (160).
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_message
     */
    get_Message() {
        result := ComCall(10, this, "ptr*", &Message := 0, "HRESULT")
        return Message
    }
}
