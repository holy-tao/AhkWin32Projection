#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxOutgoingJob.ahk

/**
 * Describes an object that is used by a fax client application to retrieve information about an outgoing fax job in a fax server's queue.
 * @remarks
 * 
 * A default implementation of <b>IFaxOutgoingJob2</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob">FaxOutgoingJob</a> object. On Windows XP and earlier, the <b>FaxOutgoingJob</b> object implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjob">IFaxOutgoingJob</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingjob2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingJob2 extends IFaxOutgoingJob{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingJob2
     * @type {Guid}
     */
    static IID => Guid("{418a8d96-59a0-4789-b176-edf3dc8fa8f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasCoverPage", "get_ReceiptAddress", "get_ScheduleType"]

    /**
     * @type {VARIANT_BOOL} 
     */
    HasCoverPage {
        get => this.get_HasCoverPage()
    }

    /**
     * @type {BSTR} 
     */
    ReceiptAddress {
        get => this.get_ReceiptAddress()
    }

    /**
     * @type {Integer} 
     */
    ScheduleType {
        get => this.get_ScheduleType()
    }

    /**
     * Specifies if the fax has a cover page.
     * @remarks
     * 
     * The value is VARIANT_TRUE if there is a cover page; otherwise VARIANT_FALSE.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(38, this, "short*", &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * A null-terminated string containing the address to which a delivery report will be sent, indicating success or failure.
     * @remarks
     * 
     * The type of address will vary according to the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob-receipttype-vb">ReceiptType</a> property as indicated in this table.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob-receipttype-vb">ReceiptType</a> property</th>
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
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR()
        result := ComCall(39, this, "ptr", pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * Specifies the schedule type that was used for the transmission.
     * @remarks
     * 
     * This property can indicate the following: the fax should be transmitted right away, that it should be sent at a specified time, or that it should be sent during a period of discounted rates.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_scheduletype
     */
    get_ScheduleType() {
        result := ComCall(40, this, "int*", &pScheduleType := 0, "HRESULT")
        return pScheduleType
    }
}
