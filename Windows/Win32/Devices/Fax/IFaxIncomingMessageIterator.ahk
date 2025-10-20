#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxIncomingMessageIterator interface is used by a fax client application to move through the archive of inbound fax messages that the fax service has successfully received.
 * @remarks
 * 
  * To create a <b>FaxIncomingMessageIterator</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-getmessages-vb">IFaxIncomingArchive::GetMessages</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingmessageiterator
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingMessageIterator extends IDispatch{
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
     * 
     * @param {Pointer<IFaxIncomingMessage>} pFaxIncomingMessage 
     * @returns {HRESULT} 
     */
    get_Message(pFaxIncomingMessage) {
        result := ComCall(7, this, "ptr", pFaxIncomingMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPrefetchSize 
     * @returns {HRESULT} 
     */
    get_PrefetchSize(plPrefetchSize) {
        result := ComCall(8, this, "int*", plPrefetchSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @returns {HRESULT} 
     */
    put_PrefetchSize(lPrefetchSize) {
        result := ComCall(9, this, "int", lPrefetchSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEOF 
     * @returns {HRESULT} 
     */
    get_AtEOF(pbEOF) {
        result := ComCall(10, this, "ptr", pbEOF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveFirst() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveNext() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
