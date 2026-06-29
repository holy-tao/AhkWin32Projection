#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FAX_RECEIPT_TYPE_ENUM.ahk" { FAX_RECEIPT_TYPE_ENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFaxOutgoingMessage.ahk" { IFaxOutgoingMessage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Used by a fax client application to retrieve information about a sent fax message in the archive of outbound faxes.
 * @remarks
 * To create a <b>FaxIncomingMessage2</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountoutgoingarchive-getmessage-vb">IFaxAccountOutgoingArchive::GetMessage</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator-message">Message</a> method.
 * 
 * A default implementation of this interface is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage">FaxOutgoingMessage</a> object in Windows Vista or later. The <b>FaxOutgoingMessage</b> object implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccountoutgoingarchive">IFaxAccountOutgoingArchive</a> interface on Windows XP or earlier.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutgoingmessage2
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutgoingMessage2 extends IFaxOutgoingMessage {
    /**
     * The interface identifier for IFaxOutgoingMessage2
     * @type {Guid}
     */
    static IID := Guid("{b37df687-bc88-4b46-b3be-b458b3ea9e7f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutgoingMessage2 interfaces
    */
    struct Vtbl extends IFaxOutgoingMessage.Vtbl {
        get_HasCoverPage   : IntPtr
        get_ReceiptType    : IntPtr
        get_ReceiptAddress : IntPtr
        get_Read           : IntPtr
        put_Read           : IntPtr
        Save               : IntPtr
        Refresh            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutgoingMessage2.Vtbl()
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
     * @type {FAX_RECEIPT_TYPE_ENUM} 
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_hascoverpage
     */
    get_HasCoverPage() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &pbHasCoverPage := 0, "HRESULT")
        return pbHasCoverPage
    }

    /**
     * Specifies the type of delivery report that is sent following an attempted transmission.
     * @returns {FAX_RECEIPT_TYPE_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_receipttype
     */
    get_ReceiptType() {
        result := ComCall(27, this, "int*", &pReceiptType := 0, "HRESULT")
        return pReceiptType
    }

    /**
     * Specifies the address to which the delivery report is sent.
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * Indicates if the fax has been read. (Get)
     * @remarks
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage-save-vb">IFaxOutgoingMessage2::Save</a> is called.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-get_read
     */
    get_Read() {
        result := ComCall(29, this, VARIANT_BOOL.Ptr, &pbRead := 0, "HRESULT")
        return pbRead
    }

    /**
     * Indicates if the fax has been read. (Put)
     * @remarks
     * Possible values are VARIANT_TRUE and VARIANT_FALSE.
     * 
     * A change to this value is not committed to the server until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage-save-vb">IFaxOutgoingMessage2::Save</a> is called.
     * @param {VARIANT_BOOL} bRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-put_read
     */
    put_Read(bRead) {
        result := ComCall(30, this, VARIANT_BOOL, bRead, "HRESULT")
        return result
    }

    /**
     * Saves the FaxOutgoingMessage object's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-save
     */
    Save() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * Refreshes FaxOutgoingMessage object information from the fax server. When the Refresh method is called, any configuration changes made after the last Save method call are lost.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage2-refresh
     */
    Refresh() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxOutgoingMessage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HasCoverPage := CallbackCreate(GetMethod(implObj, "get_HasCoverPage"), flags, 2)
        this.vtbl.get_ReceiptType := CallbackCreate(GetMethod(implObj, "get_ReceiptType"), flags, 2)
        this.vtbl.get_ReceiptAddress := CallbackCreate(GetMethod(implObj, "get_ReceiptAddress"), flags, 2)
        this.vtbl.get_Read := CallbackCreate(GetMethod(implObj, "get_Read"), flags, 2)
        this.vtbl.put_Read := CallbackCreate(GetMethod(implObj, "put_Read"), flags, 2)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HasCoverPage)
        CallbackFree(this.vtbl.get_ReceiptType)
        CallbackFree(this.vtbl.get_ReceiptAddress)
        CallbackFree(this.vtbl.get_Read)
        CallbackFree(this.vtbl.put_Read)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.Refresh)
    }
}
