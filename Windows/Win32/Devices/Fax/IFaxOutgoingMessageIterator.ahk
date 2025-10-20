#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IFaxOutgoingMessage>} pFaxOutgoingMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_message
     */
    get_Message(pFaxOutgoingMessage) {
        result := ComCall(7, this, "ptr*", pFaxOutgoingMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEOF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_ateof
     */
    get_AtEOF(pbEOF) {
        result := ComCall(8, this, "ptr", pbEOF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPrefetchSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-get_prefetchsize
     */
    get_PrefetchSize(plPrefetchSize) {
        result := ComCall(9, this, "int*", plPrefetchSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-put_prefetchsize
     */
    put_PrefetchSize(lPrefetchSize) {
        result := ComCall(10, this, "int", lPrefetchSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-movefirst
     */
    MoveFirst() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessageiterator-movenext
     */
    MoveNext() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
