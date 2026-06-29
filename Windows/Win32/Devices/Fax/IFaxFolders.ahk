#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxOutgoingQueue.ahk" { IFaxOutgoingQueue }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingQueue.ahk" { IFaxIncomingQueue }
#Import ".\IFaxOutgoingArchive.ahk" { IFaxOutgoingArchive }
#Import ".\IFaxIncomingArchive.ahk" { IFaxIncomingArchive }

/**
 * The IFaxFolders interface defines a configuration object used by a fax client application to access the folders, queued jobs, and archived messages on a fax server.
 * @remarks
 * A default implementation of <b>IFaxFolders</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxfolders">FaxFolders</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxfolders
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxFolders extends IDispatch {
    /**
     * The interface identifier for IFaxFolders
     * @type {Guid}
     */
    static IID := Guid("{dce3b2a8-a7ab-42bc-9d0a-3149457261a0}")

    /**
     * The class identifier for FaxFolders
     * @type {Guid}
     */
    static CLSID := Guid("{c35211d7-5776-48cb-af44-c31be3b2cfe5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxFolders interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_OutgoingQueue   : IntPtr
        get_IncomingQueue   : IntPtr
        get_IncomingArchive : IntPtr
        get_OutgoingArchive : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxFolders.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFaxOutgoingQueue} 
     */
    OutgoingQueue {
        get => this.get_OutgoingQueue()
    }

    /**
     * @type {IFaxIncomingQueue} 
     */
    IncomingQueue {
        get => this.get_IncomingQueue()
    }

    /**
     * @type {IFaxIncomingArchive} 
     */
    IncomingArchive {
        get => this.get_IncomingArchive()
    }

    /**
     * @type {IFaxOutgoingArchive} 
     */
    OutgoingArchive {
        get => this.get_OutgoingArchive()
    }

    /**
     * The IFaxFolders::get_OutgoingQueue property represents the queue of outgoing faxes.
     * @returns {IFaxOutgoingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_outgoingqueue
     */
    get_OutgoingQueue() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingQueue := 0, "HRESULT")
        return IFaxOutgoingQueue(pFaxOutgoingQueue)
    }

    /**
     * The IFaxFolders::get_IncomingQueue property represents the queue of incoming faxes.
     * @returns {IFaxIncomingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_incomingqueue
     */
    get_IncomingQueue() {
        result := ComCall(8, this, "ptr*", &pFaxIncomingQueue := 0, "HRESULT")
        return IFaxIncomingQueue(pFaxIncomingQueue)
    }

    /**
     * The IFaxFolders::get_IncomingArchive property represents the archive of incoming faxes.
     * @returns {IFaxIncomingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_incomingarchive
     */
    get_IncomingArchive() {
        result := ComCall(9, this, "ptr*", &pFaxIncomingArchive := 0, "HRESULT")
        return IFaxIncomingArchive(pFaxIncomingArchive)
    }

    /**
     * The IFaxFolders::get_OutgoingArchive property represents the archive of outgoing faxes.
     * @returns {IFaxOutgoingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_outgoingarchive
     */
    get_OutgoingArchive() {
        result := ComCall(10, this, "ptr*", &pFaxOutgoingArchive := 0, "HRESULT")
        return IFaxOutgoingArchive(pFaxOutgoingArchive)
    }

    Query(iid) {
        if (IFaxFolders.IID.Equals(iid)) {
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
