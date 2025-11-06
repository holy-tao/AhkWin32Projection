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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_index
     */
    get_Index() {
        result := ComCall(3, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_status
     */
    get_Status() {
        result := ComCall(4, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_address
     */
    get_Address() {
        Address := BSTR()
        result := ComCall(5, this, "ptr", Address, "HRESULT")
        return Address
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_timestamp
     */
    get_Timestamp() {
        Timestamp := BSTR()
        result := ComCall(6, this, "ptr", Timestamp, "HRESULT")
        return Timestamp
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_encodingid
     */
    get_EncodingID() {
        result := ComCall(7, this, "int*", &EncodingID := 0, "HRESULT")
        return EncodingID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_languageid
     */
    get_LanguageID() {
        result := ComCall(8, this, "int*", &LanguageID := 0, "HRESULT")
        return LanguageID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_sizeincharacters
     */
    get_SizeInCharacters() {
        result := ComCall(9, this, "uint*", &SizeInCharacters := 0, "HRESULT")
        return SizeInCharacters
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsreadmsgtextcdma-get_message
     */
    get_Message() {
        result := ComCall(10, this, "ptr*", &Message := 0, "HRESULT")
        return Message
    }
}
