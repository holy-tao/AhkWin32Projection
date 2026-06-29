#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFaxOutgoingMessageIterator.ahk" { IFaxOutgoingMessageIterator }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IFaxOutgoingMessage.ahk" { IFaxOutgoingMessage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used by a fax client application to access a specified fax account's archive of successfully sent outbound fax messages. Use this interface to retrieve messages and get the size of the archive.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountoutgoingarchive
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountOutgoingArchive extends IDispatch {
    /**
     * The interface identifier for IFaxAccountOutgoingArchive
     * @type {Guid}
     */
    static IID := Guid("{5463076d-ec14-491f-926e-b3ceda5e5662}")

    /**
     * The class identifier for FaxAccountOutgoingArchive
     * @type {Guid}
     */
    static CLSID := Guid("{851e7af5-433a-4739-a2df-ad245c2cb98e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountOutgoingArchive interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SizeLow  : IntPtr
        get_SizeHigh : IntPtr
        Refresh      : IntPtr
        GetMessages  : IntPtr
        GetMessage   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccountOutgoingArchive.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    SizeLow {
        get => this.get_SizeLow()
    }

    /**
     * @type {Integer} 
     */
    SizeHigh {
        get => this.get_SizeHigh()
    }

    /**
     * Specifies the low-order 32-bit value of the size (in bytes) of the archive of outbound fax messages for a particular fax account.
     * @remarks
     * Because the archive size can exceed 4 GB in size, its size is described as a 64-bit integer whose value is returned as two 32-bit integer values. SizeLow returns the low-order 32-bit value of the archive size. SizeHigh returns the high-order 32-bit value of the archive size. The 64-bit value of the archive size can be computed as: Size64 = (SizeHigh &lt;&lt; 32) + SizeLow.
     * 
     * If both the <b>SizeLow</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountoutgoingarchive-sizehigh-vb">SizeHigh</a> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(7, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * Specifies the high-order 32-bit value of the size (in bytes) of the archive of outbound fax messages for a particular fax account.
     * @remarks
     * Because the archive size can exceed 4 GB in size, its size is described as a 64-bit integer whose value is returned as two 32-bit integer values. SizeLow returns the low-order 32-bit value of the archive size. SizeHigh returns the high-order 32-bit value of the archive size. The 64-bit value of the archive size can be computed as: Size64 = (SizeHigh &lt;&lt; 32) + SizeLow.
     * 
     * If both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountoutgoingarchive-sizelow-vb">SizeLow</a> and <b>SizeHigh</b> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * The property is read-only.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(8, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * Refreshes FaxAccountOutgoingArchive object information for a particular fax account from the fax server.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Returns a new iterator (archive cursor) for the archive of outbound fax messages for a particular fax account.
     * @param {Integer} lPrefetchSize Type: <b>long</b>
     * 
     * <b>long</b> value that indicates the size of the prefetch buffer. This value determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents. The default value is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ldefault-prefetch-size">lDEFAULT_PREFETCH_SIZE</a>.
     * @returns {IFaxOutgoingMessageIterator} Type: <b>IFaxOutgoingMessageIterator**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator">FaxOutgoingMessageIterator</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "ptr*", &pFaxOutgoingMessageIterator := 0, "HRESULT")
        return IFaxOutgoingMessageIterator(pFaxOutgoingMessageIterator)
    }

    /**
     * Returns a fax message from the archive of outbound faxes for a particular fax account, by using the fax message ID.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the message ID of the fax to retrieve from the archive of outbound faxes.
     * @returns {IFaxOutgoingMessage} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingmessage">IFaxOutgoingMessage</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingmessage">IFaxOutgoingMessage</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingarchive-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(11, this, BSTR, bstrMessageId, "ptr*", &pFaxOutgoingMessage := 0, "HRESULT")
        return IFaxOutgoingMessage(pFaxOutgoingMessage)
    }

    Query(iid) {
        if (IFaxAccountOutgoingArchive.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SizeLow := CallbackCreate(GetMethod(implObj, "get_SizeLow"), flags, 2)
        this.vtbl.get_SizeHigh := CallbackCreate(GetMethod(implObj, "get_SizeHigh"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.GetMessages := CallbackCreate(GetMethod(implObj, "GetMessages"), flags, 3)
        this.vtbl.GetMessage := CallbackCreate(GetMethod(implObj, "GetMessage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SizeLow)
        CallbackFree(this.vtbl.get_SizeHigh)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.GetMessages)
        CallbackFree(this.vtbl.GetMessage)
    }
}
