#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FAX_SCHEDULE_TYPE_ENUM.ahk" { FAX_SCHEDULE_TYPE_ENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxOutgoingJob.ahk" { IFaxOutgoingJob }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Describes an object that is used by a fax client application to retrieve information about an outgoing fax job in a fax server's queue.
 * @remarks
 * A default implementation of <b>IFaxOutgoingJob2</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob">FaxOutgoingJob</a> object. On Windows XP and earlier, the <b>FaxOutgoingJob</b> object implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjob">IFaxOutgoingJob</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutgoingjob2
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutgoingJob2 extends IFaxOutgoingJob {
    /**
     * The interface identifier for IFaxOutgoingJob2
     * @type {Guid}
     */
    static IID := Guid("{418a8d96-59a0-4789-b176-edf3dc8fa8f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutgoingJob2 interfaces
    */
    struct Vtbl extends IFaxOutgoingJob.Vtbl {
        get_HasCoverPage   : IntPtr
        get_ReceiptAddress : IntPtr
        get_ScheduleType   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutgoingJob2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {FAX_SCHEDULE_TYPE_ENUM} 
     */
    ScheduleType {
        get => this.get_ScheduleType()
    }

    /**
     * Specifies if the fax has a cover page.
     * @remarks
     * The value is VARIANT_TRUE if there is a cover page; otherwise VARIANT_FALSE.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(38, this, VARIANT_BOOL.Ptr, &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * A null-terminated string containing the address to which a delivery report will be sent, indicating success or failure.
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * Specifies the schedule type that was used for the transmission.
     * @remarks
     * This property can indicate the following: the fax should be transmitted right away, that it should be sent at a specified time, or that it should be sent during a period of discounted rates.
     * @returns {FAX_SCHEDULE_TYPE_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob2-get_scheduletype
     */
    get_ScheduleType() {
        result := ComCall(40, this, "int*", &pScheduleType := 0, "HRESULT")
        return pScheduleType
    }

    Query(iid) {
        if (IFaxOutgoingJob2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HasCoverPage := CallbackCreate(GetMethod(implObj, "get_HasCoverPage"), flags, 2)
        this.vtbl.get_ReceiptAddress := CallbackCreate(GetMethod(implObj, "get_ReceiptAddress"), flags, 2)
        this.vtbl.get_ScheduleType := CallbackCreate(GetMethod(implObj, "get_ScheduleType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HasCoverPage)
        CallbackFree(this.vtbl.get_ReceiptAddress)
        CallbackFree(this.vtbl.get_ScheduleType)
    }
}
