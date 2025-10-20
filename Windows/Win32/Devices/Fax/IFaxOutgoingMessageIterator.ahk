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
     * 
     * @param {Pointer<IFaxOutgoingMessage>} pFaxOutgoingMessage 
     * @returns {HRESULT} 
     */
    get_Message(pFaxOutgoingMessage) {
        result := ComCall(7, this, "ptr", pFaxOutgoingMessage, "int")
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
        result := ComCall(8, this, "ptr", pbEOF, "int")
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
        result := ComCall(9, this, "int*", plPrefetchSize, "int")
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
        result := ComCall(10, this, "int", lPrefetchSize, "int")
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
