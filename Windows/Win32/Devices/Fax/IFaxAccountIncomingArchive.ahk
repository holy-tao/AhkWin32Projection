#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxIncomingMessageIterator.ahk" { IFaxIncomingMessageIterator }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingMessage.ahk" { IFaxIncomingMessage }

/**
 * Used by a fax client application to access a particular fax account's archive of successfully received inbound fax messages. Use this interface to retrieve messages and get the size of the archive.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountincomingarchive
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountIncomingArchive extends IDispatch {
    /**
     * The interface identifier for IFaxAccountIncomingArchive
     * @type {Guid}
     */
    static IID := Guid("{a8a5b6ef-e0d6-4aee-955c-91625bec9db4}")

    /**
     * The class identifier for FaxAccountIncomingArchive
     * @type {Guid}
     */
    static CLSID := Guid("{14b33db5-4c40-4ecf-9ef8-a360cbe809ed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountIncomingArchive interfaces
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
            this.vtbl := IFaxAccountIncomingArchive.Vtbl()
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
     * Specifies the low 32-bit value (in bytes) for the size of the archive of inbound fax messages for a particular fax account.
     * @remarks
     * Because the archive may exceed 4 GB in size, its size is described using two long values. SizeLow is the low 32-bit value of the archive size. SizeHigh is the high 32-bit value of the archive size. The size of the archive is: SizeLow + 4 GB * SizeHigh.
     * 
     * If both the <b>SizeLow</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-sizehigh-vb">SizeHigh</a> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(7, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * Specifies the high 32-bit value (in bytes) for the size of the archive of inbound fax messages for a particular fax account.
     * @remarks
     * Because the archive may exceed 4 GB in size, its size is described using two long values. SizeLow is the low 32-bit value of the archive size. SizeHigh is the high 32-bit value of the archive size. The size of the archive is: SizeLow + 4 GB * SizeHigh.
     * 
     * If both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-sizelow-vb">SizeLow</a> and <b>SizeHigh</b> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * The property is read-only.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(8, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * Refreshes FaxAccountIncomingArchive object information for a particular fax account from the fax server.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Returns a new iterator (archive cursor) for the archive of inbound fax messages for a particular fax account.
     * @remarks
     * If the setting 'All incoming faxes are viewable by everyone' is true (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-incomingfaxesarepublic-vb">IncomingFaxesArePublic</a>) or if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> access rights, then the fax service enumerates all faxes in the Incoming archive of the Fax Server Receive Folder.
     * @param {Integer} lPrefetchSize Type: <b>long</b>
     * 
     * <b>long</b> value that indicates the size of the prefetch buffer. This value determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents. The default value is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ldefault-prefetch-size">lDEFAULT_PREFETCH_SIZE</a>.
     * @returns {IFaxIncomingMessageIterator} Type: <b>IFaxIncomingMessageIterator**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator">FaxIncomingMessageIterator</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "ptr*", &pFaxIncomingMessageIterator := 0, "HRESULT")
        return IFaxIncomingMessageIterator(pFaxIncomingMessageIterator)
    }

    /**
     * Returns a fax message from the archive of inbound faxes, for a particular fax account, by using the fax message ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_ARCHIVES</a> access right. 
     * 
     * If the setting 'All incoming faxes are viewable by everyone' is true (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-incomingfaxesarepublic-vb">IncomingFaxesArePublic</a>) or if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> access rights, then the fax service searches all faxes in the Incoming archive of the Fax Server Receive Folder.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the message ID of the fax to retrieve from the archive of inbound faxes.
     * @returns {IFaxIncomingMessage} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingmessage">IFaxIncomingMessage</a>**</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingmessage">IFaxIncomingMessage</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(11, this, BSTR, bstrMessageId, "ptr*", &pFaxIncomingMessage := 0, "HRESULT")
        return IFaxIncomingMessage(pFaxIncomingMessage)
    }

    Query(iid) {
        if (IFaxAccountIncomingArchive.IID.Equals(iid)) {
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
