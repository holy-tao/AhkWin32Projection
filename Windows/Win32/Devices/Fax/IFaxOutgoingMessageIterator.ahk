#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IFaxOutgoingMessage.ahk" { IFaxOutgoingMessage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IFaxOutgoingMessageIterator interface describes an object that is used by a fax client application to move through the archive of fax messages that the fax service has successfully transmitted, represented by FaxOutgoingMessage objects.
 * @remarks
 * A default implementation of <b>IFaxOutgoingMessageIterator</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator">FaxOutgoingMessageIterator</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutgoingmessageiterator
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutgoingMessageIterator extends IDispatch {
    /**
     * The interface identifier for IFaxOutgoingMessageIterator
     * @type {Guid}
     */
    static IID := Guid("{f5ec5d4f-b840-432f-9980-112fe42a9b7a}")

    /**
     * The class identifier for FaxOutgoingMessageIterator
     * @type {Guid}
     */
    static CLSID := Guid("{8a3224d0-d30b-49de-9813-cb385790fbbb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutgoingMessageIterator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Message      : IntPtr
        get_AtEOF        : IntPtr
        get_PrefetchSize : IntPtr
        put_PrefetchSize : IntPtr
        MoveFirst        : IntPtr
        MoveNext         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutgoingMessageIterator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFaxOutgoingMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AtEOF {
        get => this.get_AtEOF()
    }

    /**
     * @type {Integer} 
     */
    PrefetchSize {
        get => this.get_PrefetchSize()
        set => this.put_PrefetchSize(value)
    }

    /**
     * The IFaxOutgoingMessageIterator::get_Message property retrieves the outbound fax message under the archive cursor.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> and <b>farQUERY_OUT_ARCHIVE</b> access rights.
     * @returns {IFaxOutgoingMessage} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_message
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingMessage := 0, "HRESULT")
        return IFaxOutgoingMessage(pFaxOutgoingMessage)
    }

    /**
     * The AtEOF property is the end-of-file marker for the archive of outbound fax messages.
     * @remarks
     * If this property is equal to <b>TRUE</b>, the archive cursor has moved beyond the last fax message in the archive. If this property is equal to <b>FALSE</b>, the archive cursor has not reached the end of the archive.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_ateof
     */
    get_AtEOF() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &pbEOF := 0, "HRESULT")
        return pbEOF
    }

    /**
     * The IFaxOutgoingMessageIterator::get_PrefetchSize property indicates the size of the prefetch (read-ahead) buffer. This determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_prefetchsize
     */
    get_PrefetchSize() {
        result := ComCall(9, this, "int*", &plPrefetchSize := 0, "HRESULT")
        return plPrefetchSize
    }

    /**
     * The IFaxOutgoingMessageIterator::get_PrefetchSize property indicates the size of the prefetch (read-ahead) buffer. This determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents. (Put)
     * @param {Integer} lPrefetchSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-put_prefetchsize
     */
    put_PrefetchSize(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingMessageIterator::MoveFirst method moves the archive cursor to the first fax message in the outbound archive.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> and <b>farQUERY_OUT_ARCHIVE</b> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-movefirst
     */
    MoveFirst() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingMessageIterator::MoveNext method moves the archive cursor to the next fax message in the outbound archive.
     * @remarks
     * The method will fail if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator-ateof-vb">IFaxOutgoingMessageIterator::get_AtEOF</a> property is equal to <b>TRUE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-movenext
     */
    MoveNext() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxOutgoingMessageIterator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
        this.vtbl.get_AtEOF := CallbackCreate(GetMethod(implObj, "get_AtEOF"), flags, 2)
        this.vtbl.get_PrefetchSize := CallbackCreate(GetMethod(implObj, "get_PrefetchSize"), flags, 2)
        this.vtbl.put_PrefetchSize := CallbackCreate(GetMethod(implObj, "put_PrefetchSize"), flags, 2)
        this.vtbl.MoveFirst := CallbackCreate(GetMethod(implObj, "MoveFirst"), flags, 1)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Message)
        CallbackFree(this.vtbl.get_AtEOF)
        CallbackFree(this.vtbl.get_PrefetchSize)
        CallbackFree(this.vtbl.put_PrefetchSize)
        CallbackFree(this.vtbl.MoveFirst)
        CallbackFree(this.vtbl.MoveNext)
    }
}
