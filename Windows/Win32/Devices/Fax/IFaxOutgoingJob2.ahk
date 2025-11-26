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
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(38, this, "short*", &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR()
        result := ComCall(39, this, "ptr", pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_scheduletype
     */
    get_ScheduleType() {
        result := ComCall(40, this, "int*", &pScheduleType := 0, "HRESULT")
        return pScheduleType
    }
}
