#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxAccountIncomingArchive.ahk" { IFaxAccountIncomingArchive }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IFaxAccountIncomingQueue.ahk" { IFaxAccountIncomingQueue }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxAccountOutgoingArchive.ahk" { IFaxAccountOutgoingArchive }
#Import ".\IFaxAccountOutgoingQueue.ahk" { IFaxAccountOutgoingQueue }

/**
 * Provides access to the incoming and outgoing fax queues and fax archives.
 * @remarks
 * A default implementation is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountfolders">FaxAccountFolders</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountfolders
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountFolders extends IDispatch {
    /**
     * The interface identifier for IFaxAccountFolders
     * @type {Guid}
     */
    static IID := Guid("{6463f89d-23d8-46a9-8f86-c47b77ca7926}")

    /**
     * The class identifier for FaxAccountFolders
     * @type {Guid}
     */
    static CLSID := Guid("{85398f49-c034-4a3f-821c-db7d685e8129}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountFolders interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_OutgoingQueue   : IntPtr
        get_IncomingQueue   : IntPtr
        get_IncomingArchive : IntPtr
        get_OutgoingArchive : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccountFolders.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Represents the queue of outgoing faxes for a particular fax account. These are the faxes that have not yet been sent.
     * @returns {IFaxAccountOutgoingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_outgoingqueue
     */
    get_OutgoingQueue() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingQueue := 0, "HRESULT")
        return IFaxAccountOutgoingQueue(pFaxOutgoingQueue)
    }

    /**
     * Represents the queue of incoming faxes for a particular fax account. These are the incoming faxes that have not yet been fully processed.
     * @returns {IFaxAccountIncomingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_incomingqueue
     */
    get_IncomingQueue() {
        result := ComCall(8, this, "ptr*", &pFaxIncomingQueue := 0, "HRESULT")
        return IFaxAccountIncomingQueue(pFaxIncomingQueue)
    }

    /**
     * Represents the archive of incoming faxes for a particular fax account. These are the faxes that have been received.
     * @returns {IFaxAccountIncomingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_incomingarchive
     */
    get_IncomingArchive() {
        result := ComCall(9, this, "ptr*", &pFaxIncomingArchive := 0, "HRESULT")
        return IFaxAccountIncomingArchive(pFaxIncomingArchive)
    }

    /**
     * Represents the archive of outgoing faxes for a particular fax account that have been sent.
     * @returns {IFaxAccountOutgoingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountfolders-get_outgoingarchive
     */
    get_OutgoingArchive() {
        result := ComCall(10, this, "ptr*", &pFaxOutgoingArchive := 0, "HRESULT")
        return IFaxAccountOutgoingArchive(pFaxOutgoingArchive)
    }

    Query(iid) {
        if (IFaxAccountFolders.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_OutgoingQueue := CallbackCreate(GetMethod(implObj, "get_OutgoingQueue"), flags, 2)
        this.vtbl.get_IncomingQueue := CallbackCreate(GetMethod(implObj, "get_IncomingQueue"), flags, 2)
        this.vtbl.get_IncomingArchive := CallbackCreate(GetMethod(implObj, "get_IncomingArchive"), flags, 2)
        this.vtbl.get_OutgoingArchive := CallbackCreate(GetMethod(implObj, "get_OutgoingArchive"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_OutgoingQueue)
        CallbackFree(this.vtbl.get_IncomingQueue)
        CallbackFree(this.vtbl.get_IncomingArchive)
        CallbackFree(this.vtbl.get_OutgoingArchive)
    }
}
