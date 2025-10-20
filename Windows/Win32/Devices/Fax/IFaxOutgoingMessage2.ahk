#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxOutgoingMessage.ahk

/**
 * Used by a fax client application to retrieve information about a sent fax message in the archive of outbound faxes.
 * @remarks
 * 
  * To create a <b>FaxIncomingMessage2</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountoutgoingarchive-getmessage-vb">IFaxAccountOutgoingArchive::GetMessage</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator-message">Message</a> method.
  * 
  * A default implementation of this interface is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage">FaxOutgoingMessage</a> object in Windows Vista or later. The <b>FaxOutgoingMessage</b> object implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccountoutgoingarchive">IFaxAccountOutgoingArchive</a> interface on Windows XP or earlier.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingmessage2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingMessage2 extends IFaxOutgoingMessage{
    /**
     * The interface identifier for IFaxOutgoingMessage2
     * @type {Guid}
     */
    static IID => Guid("{b37df687-bc88-4b46-b3be-b458b3ea9e7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHasCoverPage 
     * @returns {HRESULT} 
     */
    get_HasCoverPage(pbHasCoverPage) {
        result := ComCall(26, this, "ptr", pbHasCoverPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pReceiptType 
     * @returns {HRESULT} 
     */
    get_ReceiptType(pReceiptType) {
        result := ComCall(27, this, "int*", pReceiptType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReceiptAddress 
     * @returns {HRESULT} 
     */
    get_ReceiptAddress(pbstrReceiptAddress) {
        result := ComCall(28, this, "ptr", pbstrReceiptAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRead 
     * @returns {HRESULT} 
     */
    get_Read(pbRead) {
        result := ComCall(29, this, "ptr", pbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     */
    put_Read(bRead) {
        result := ComCall(30, this, "short", bRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
