#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxIncomingMessage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxIncomingMessageIterator interface is used by a fax client application to move through the archive of inbound fax messages that the fax service has successfully received.
 * @remarks
 * To create a <b>FaxIncomingMessageIterator</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-getmessages-vb">IFaxIncomingArchive::GetMessages</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxincomingmessageiterator
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingMessageIterator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxIncomingMessageIterator
     * @type {Guid}
     */
    static IID => Guid("{fd73ecc4-6f06-4f52-82a8-f7ba06ae3108}")

    /**
     * The class identifier for FaxIncomingMessageIterator
     * @type {Guid}
     */
    static CLSID => Guid("{6088e1d8-3fc8-45c2-87b1-909a29607ea9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Message", "get_PrefetchSize", "put_PrefetchSize", "get_AtEOF", "MoveFirst", "MoveNext"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-get_message
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &pFaxIncomingMessage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-get_prefetchsize
     */
    get_PrefetchSize() {
        result := ComCall(8, this, "int*", &plPrefetchSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-put_prefetchsize
     */
    put_PrefetchSize(lPrefetchSize) {
        result := ComCall(9, this, "int", lPrefetchSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The AtEOF property is the end of file marker for the archive of inbound fax messages.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-get_ateof
     */
    get_AtEOF() {
        result := ComCall(10, this, "short*", &pbEOF := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbEOF
    }

    /**
     * The MoveFirst method moves the archive cursor to the first fax message in the archive of inbound faxes.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-movefirst
     */
    MoveFirst() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingmessageiterator-movenext
     */
    MoveNext() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
