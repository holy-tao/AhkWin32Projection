#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasCoverPage", "get_ReceiptType", "get_ReceiptAddress", "get_Read", "put_Read", "Save", "Refresh"]

    /**
     * @type {VARIANT_BOOL} 
     */
    HasCoverPage {
        get => this.get_HasCoverPage()
    }

    /**
     * @type {Integer} 
     */
    ReceiptType {
        get => this.get_ReceiptType()
    }

    /**
     * @type {BSTR} 
     */
    ReceiptAddress {
        get => this.get_ReceiptAddress()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Read {
        get => this.get_Read()
        set => this.put_Read(value)
    }

    /**
     * Indicates if the fax has a cover page.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(26, this, "short*", &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * Specifies the type of delivery report that is sent following an attempted transmission.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_receipttype
     */
    get_ReceiptType() {
        result := ComCall(27, this, "int*", &pReceiptType := 0, "HRESULT")
        return pReceiptType
    }

    /**
     * Specifies the address to which the delivery report is sent.
     * @remarks
     * 
     * The type of address will vary according to the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage-receipttype-vb">IFaxOutgoingMessage2::ReceiptType</a> property as indicated in this table.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage-receipttype-vb">IFaxOutgoingMessage2::ReceiptType</a> property</th>
     * <th>Type of address</th>
     * </tr>
     * <tr>
     * <td>frtMAIL</td>
     * <td>An SMTP email address</td>
     * </tr>
     * <tr>
     * <td>frtMSGBOX</td>
     * <td>The computer name on which the delivery report message box will appear</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR()
        result := ComCall(28, this, "ptr", pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * Indicates if the fax has been read.
     * @remarks
     * 
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage-save-vb">IFaxOutgoingMessage2::Save</a> is called.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_read
     */
    get_Read() {
        result := ComCall(29, this, "short*", &pbRead := 0, "HRESULT")
        return pbRead
    }

    /**
     * Indicates if the fax has been read.
     * @remarks
     * 
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage-save-vb">IFaxOutgoingMessage2::Save</a> is called.
     * 
     * 
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-put_read
     */
    put_Read(bRead) {
        result := ComCall(30, this, "short", bRead, "HRESULT")
        return result
    }

    /**
     * Saves the FaxOutgoingMessage object's data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-save
     */
    Save() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * Refreshes FaxOutgoingMessage object information from the fax server. When the Refresh method is called, any configuration changes made after the last Save method call are lost.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessage2-refresh
     */
    Refresh() {
        result := ComCall(32, this, "HRESULT")
        return result
    }
}
