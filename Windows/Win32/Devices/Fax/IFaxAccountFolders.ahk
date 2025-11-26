#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxAccountOutgoingQueue.ahk
#Include .\IFaxAccountIncomingQueue.ahk
#Include .\IFaxAccountIncomingArchive.ahk
#Include .\IFaxAccountOutgoingArchive.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutgoingQueue", "get_IncomingQueue", "get_IncomingArchive", "get_OutgoingArchive"]

    /**
     * @type {IFaxAccountOutgoingQueue} 
     */
    OutgoingQueue {
        get => this.get_OutgoingQueue()
    }

    /**
     * @type {IFaxAccountIncomingQueue} 
     */
    IncomingQueue {
        get => this.get_IncomingQueue()
    }

    /**
     * @type {IFaxAccountIncomingArchive} 
     */
    IncomingArchive {
        get => this.get_IncomingArchive()
    }

    /**
     * @type {IFaxAccountOutgoingArchive} 
     */
    OutgoingArchive {
        get => this.get_OutgoingArchive()
    }

    /**
     * 
     * @returns {IFaxAccountOutgoingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_outgoingqueue
     */
    get_OutgoingQueue() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingQueue := 0, "HRESULT")
        return IFaxAccountOutgoingQueue(pFaxOutgoingQueue)
    }

    /**
     * 
     * @returns {IFaxAccountIncomingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_incomingqueue
     */
    get_IncomingQueue() {
        result := ComCall(8, this, "ptr*", &pFaxIncomingQueue := 0, "HRESULT")
        return IFaxAccountIncomingQueue(pFaxIncomingQueue)
    }

    /**
     * 
     * @returns {IFaxAccountIncomingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_incomingarchive
     */
    get_IncomingArchive() {
        result := ComCall(9, this, "ptr*", &pFaxIncomingArchive := 0, "HRESULT")
        return IFaxAccountIncomingArchive(pFaxIncomingArchive)
    }

    /**
     * 
     * @returns {IFaxAccountOutgoingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_outgoingarchive
     */
    get_OutgoingArchive() {
        result := ComCall(10, this, "ptr*", &pFaxOutgoingArchive := 0, "HRESULT")
        return IFaxAccountOutgoingArchive(pFaxOutgoingArchive)
    }
}
