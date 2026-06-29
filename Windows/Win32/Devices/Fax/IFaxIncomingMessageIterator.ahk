#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingMessage.ahk" { IFaxIncomingMessage }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IFaxIncomingMessageIterator interface is used by a fax client application to move through the archive of inbound fax messages that the fax service has successfully received.
 * @remarks
 * To create a <b>FaxIncomingMessageIterator</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-getmessages-vb">IFaxIncomingArchive::GetMessages</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxincomingmessageiterator
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxIncomingMessageIterator extends IDispatch {
    /**
     * The interface identifier for IFaxIncomingMessageIterator
     * @type {Guid}
     */
    static IID := Guid("{fd73ecc4-6f06-4f52-82a8-f7ba06ae3108}")

    /**
     * The class identifier for FaxIncomingMessageIterator
     * @type {Guid}
     */
    static CLSID := Guid("{6088e1d8-3fc8-45c2-87b1-909a29607ea9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxIncomingMessageIterator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Message      : IntPtr
        get_PrefetchSize : IntPtr
        put_PrefetchSize : IntPtr
        get_AtEOF        : IntPtr
        MoveFirst        : IntPtr
        MoveNext         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxIncomingMessageIterator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFaxIncomingMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {Integer} 
     */
    PrefetchSize {
        get => this.get_PrefetchSize()
        set => this.put_PrefetchSize(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AtEOF {
        get => this.get_AtEOF()
    }

    /**
     * The Message property retrieves the inbound fax message under the archive cursor.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {IFaxIncomingMessage} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-get_message
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &pFaxIncomingMessage := 0, "HRESULT")
        return IFaxIncomingMessage(pFaxIncomingMessage)
    }

    /**
     * The PrefetchSize property indicates the size of the prefetch (read-ahead) buffer. (Get)
     * @remarks
     * The prefetch buffer contains messages and makes the iteration process more efficient because you iterate through the buffer rather than through a folder. 
     * 
     * Changes you make to the size of the prefetch buffer take place immediately because <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator">FaxIncomingMessageIterator</a> is a local object.
     * 
     * The value of the <i>lPrefetchSize</i> property determines how many fax messages the iterator object retrieves from the archive each time the object refreshes its contents. The default value is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ldefault-prefetch-size">lDEFAULT_PREFETCH_SIZE</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-get_prefetchsize
     */
    get_PrefetchSize() {
        result := ComCall(8, this, "int*", &plPrefetchSize := 0, "HRESULT")
        return plPrefetchSize
    }

    /**
     * The PrefetchSize property indicates the size of the prefetch (read-ahead) buffer. (Put)
     * @remarks
     * The prefetch buffer contains messages and makes the iteration process more efficient because you iterate through the buffer rather than through a folder. 
     * 
     * Changes you make to the size of the prefetch buffer take place immediately because <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator">FaxIncomingMessageIterator</a> is a local object.
     * 
     * The value of the <i>lPrefetchSize</i> property determines how many fax messages the iterator object retrieves from the archive each time the object refreshes its contents. The default value is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ldefault-prefetch-size">lDEFAULT_PREFETCH_SIZE</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @param {Integer} lPrefetchSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-put_prefetchsize
     */
    put_PrefetchSize(lPrefetchSize) {
        result := ComCall(9, this, "int", lPrefetchSize, "HRESULT")
        return result
    }

    /**
     * The AtEOF property is the end of file marker for the archive of inbound fax messages.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-get_ateof
     */
    get_AtEOF() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pbEOF := 0, "HRESULT")
        return pbEOF
    }

    /**
     * The MoveFirst method moves the archive cursor to the first fax message in the archive of inbound faxes.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-movefirst
     */
    MoveFirst() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The MoveNext method moves the archive cursor to the next message in the archive of inbound faxes.
     * @remarks
     * You can make the iteration process more efficient by using a prefetch buffer. A prefetch buffer contains messages and allows you to iterate through the buffer rather than through a folder. Set the size of the buffer (the number of messages to be held in the buffer) using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator-prefetchsize">PrefetchSize</a> property.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-movenext
     */
    MoveNext() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxIncomingMessageIterator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
        this.vtbl.get_PrefetchSize := CallbackCreate(GetMethod(implObj, "get_PrefetchSize"), flags, 2)
        this.vtbl.put_PrefetchSize := CallbackCreate(GetMethod(implObj, "put_PrefetchSize"), flags, 2)
        this.vtbl.get_AtEOF := CallbackCreate(GetMethod(implObj, "get_AtEOF"), flags, 2)
        this.vtbl.MoveFirst := CallbackCreate(GetMethod(implObj, "MoveFirst"), flags, 1)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Message)
        CallbackFree(this.vtbl.get_PrefetchSize)
        CallbackFree(this.vtbl.put_PrefetchSize)
        CallbackFree(this.vtbl.get_AtEOF)
        CallbackFree(this.vtbl.MoveFirst)
        CallbackFree(this.vtbl.MoveNext)
    }
}
