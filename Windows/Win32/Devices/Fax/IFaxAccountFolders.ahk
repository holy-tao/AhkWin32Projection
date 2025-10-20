#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides access to the incoming and outgoing fax queues and fax archives.
 * @remarks
 * 
  * A default implementation is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountfolders">FaxAccountFolders</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountfolders
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountFolders extends IDispatch{
    /**
     * The interface identifier for IFaxAccountFolders
     * @type {Guid}
     */
    static IID => Guid("{6463f89d-23d8-46a9-8f86-c47b77ca7926}")

    /**
     * The class identifier for FaxAccountFolders
     * @type {Guid}
     */
    static CLSID => Guid("{85398f49-c034-4a3f-821c-db7d685e8129}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IFaxAccountOutgoingQueue>} pFaxOutgoingQueue 
     * @returns {HRESULT} 
     */
    get_OutgoingQueue(pFaxOutgoingQueue) {
        result := ComCall(7, this, "ptr", pFaxOutgoingQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccountIncomingQueue>} pFaxIncomingQueue 
     * @returns {HRESULT} 
     */
    get_IncomingQueue(pFaxIncomingQueue) {
        result := ComCall(8, this, "ptr", pFaxIncomingQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccountIncomingArchive>} pFaxIncomingArchive 
     * @returns {HRESULT} 
     */
    get_IncomingArchive(pFaxIncomingArchive) {
        result := ComCall(9, this, "ptr", pFaxIncomingArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccountOutgoingArchive>} pFaxOutgoingArchive 
     * @returns {HRESULT} 
     */
    get_OutgoingArchive(pFaxOutgoingArchive) {
        result := ComCall(10, this, "ptr", pFaxOutgoingArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
