#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<UInt32>} Index 
     * @returns {HRESULT} 
     */
    get_Index(Index) {
        result := ComCall(3, this, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(4, this, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Address 
     * @returns {HRESULT} 
     */
    get_Address(Address) {
        result := ComCall(5, this, "ptr", Address, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Timestamp 
     * @returns {HRESULT} 
     */
    get_Timestamp(Timestamp) {
        result := ComCall(6, this, "ptr", Timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EncodingID 
     * @returns {HRESULT} 
     */
    get_EncodingID(EncodingID) {
        result := ComCall(7, this, "int*", EncodingID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LanguageID 
     * @returns {HRESULT} 
     */
    get_LanguageID(LanguageID) {
        result := ComCall(8, this, "int*", LanguageID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} SizeInCharacters 
     * @returns {HRESULT} 
     */
    get_SizeInCharacters(SizeInCharacters) {
        result := ComCall(9, this, "uint*", SizeInCharacters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Message 
     * @returns {HRESULT} 
     */
    get_Message(Message) {
        result := ComCall(10, this, "ptr", Message, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
