#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxOutgoingMessage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingMessageIterator interface describes an object that is used by a fax client application to move through the archive of fax messages that the fax service has successfully transmitted, represented by FaxOutgoingMessage objects.
 * @remarks
 * 
 * A default implementation of <b>IFaxOutgoingMessageIterator</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessageiterator">FaxOutgoingMessageIterator</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingmessageiterator
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingMessageIterator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingMessageIterator
     * @type {Guid}
     */
    static IID => Guid("{f5ec5d4f-b840-432f-9980-112fe42a9b7a}")

    /**
     * The class identifier for FaxOutgoingMessageIterator
     * @type {Guid}
     */
    static CLSID => Guid("{8a3224d0-d30b-49de-9813-cb385790fbbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Message", "get_AtEOF", "get_PrefetchSize", "put_PrefetchSize", "MoveFirst", "MoveNext"]

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
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> and <b>farQUERY_OUT_ARCHIVE</b> access rights.
     * 
     * 
     * @returns {IFaxOutgoingMessage} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_message
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingMessage := 0, "HRESULT")
        return IFaxOutgoingMessage(pFaxOutgoingMessage)
    }

    /**
     * The AtEOF property is the end-of-file marker for the archive of outbound fax messages.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the archive cursor has moved beyond the last fax message in the archive. If this property is equal to <b>FALSE</b>, the archive cursor has not reached the end of the archive.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_ateof
     */
    get_AtEOF() {
        result := ComCall(8, this, "short*", &pbEOF := 0, "HRESULT")
        return pbEOF
    }

    /**
     * The IFaxOutgoingMessageIterator::get_PrefetchSize property indicates the size of the prefetch (read-ahead) buffer. This determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_prefetchsize
     */
    get_PrefetchSize() {
        result := ComCall(9, this, "int*", &plPrefetchSize := 0, "HRESULT")
        return plPrefetchSize
    }

    /**
     * The IFaxOutgoingMessageIterator::get_PrefetchSize property indicates the size of the prefetch (read-ahead) buffer. This determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents.
     * @param {Integer} lPrefetchSize 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-put_prefetchsize
     */
    put_PrefetchSize(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingMessageIterator::MoveFirst method moves the archive cursor to the first fax message in the outbound archive.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-movefirst
     */
    MoveFirst() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingMessageIterator::MoveNext method moves the archive cursor to the next fax message in the outbound archive.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-movenext
     */
    MoveNext() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
