#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Moves messages from one queue to another queue.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imessagemover
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMessageMover extends IDispatch {
    /**
     * The interface identifier for IMessageMover
     * @type {Guid}
     */
    static IID := Guid("{588a085a-b795-11d1-8054-00c04fc340ee}")

    /**
     * The class identifier for MessageMover
     * @type {Guid}
     */
    static CLSID := Guid("{ecabb0bf-7f19-11d2-978e-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMessageMover interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SourcePath      : IntPtr
        put_SourcePath      : IntPtr
        get_DestPath        : IntPtr
        put_DestPath        : IntPtr
        get_CommitBatchSize : IntPtr
        put_CommitBatchSize : IntPtr
        MoveMessages        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMessageMover.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    SourcePath {
        get => this.get_SourcePath()
        set => this.put_SourcePath(value)
    }

    /**
     * @type {BSTR} 
     */
    DestPath {
        get => this.get_DestPath()
        set => this.put_DestPath(value)
    }

    /**
     * @type {Integer} 
     */
    CommitBatchSize {
        get => this.get_CommitBatchSize()
        set => this.put_CommitBatchSize(value)
    }

    /**
     * Retrieves the current path of the source (input) queue.
     * @returns {BSTR} The path.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-get_sourcepath
     */
    get_SourcePath() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets the path of the source (input) queue.
     * @param {BSTR} newVal The path.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-put_sourcepath
     */
    put_SourcePath(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the path of the destination (output) queue.
     * @returns {BSTR} The path.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-get_destpath
     */
    get_DestPath() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets the path of the destination (output) queue.
     * @param {BSTR} newVal The path.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-put_destpath
     */
    put_DestPath(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the commit batch size.
     * @returns {Integer} The commit batch size.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-get_commitbatchsize
     */
    get_CommitBatchSize() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the commit batch size. This is the number of messages that should be moved from source to destination queue between commit operations.
     * @param {Integer} newVal The commit batch size.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-put_commitbatchsize
     */
    put_CommitBatchSize(newVal) {
        result := ComCall(12, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Moves all messages from the source queue to the destination queue.
     * @remarks
     * Messages are moved one at a time unless both the source and destination queue are transacted. In this case, <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imessagemover-get_commitbatchsize">CommitBatchSize</a> specifies the number of messages that are moved before <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-itransactioncontext-commit">Commit</a> is invoked. There is no provision for moving fewer than all of the messages on the queue.
     * @returns {Integer} The number of messages that were moved from the source to the destination queue.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-movemessages
     */
    MoveMessages() {
        result := ComCall(13, this, "int*", &plMessagesMoved := 0, "HRESULT")
        return plMessagesMoved
    }

    Query(iid) {
        if (IMessageMover.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SourcePath := CallbackCreate(GetMethod(implObj, "get_SourcePath"), flags, 2)
        this.vtbl.put_SourcePath := CallbackCreate(GetMethod(implObj, "put_SourcePath"), flags, 2)
        this.vtbl.get_DestPath := CallbackCreate(GetMethod(implObj, "get_DestPath"), flags, 2)
        this.vtbl.put_DestPath := CallbackCreate(GetMethod(implObj, "put_DestPath"), flags, 2)
        this.vtbl.get_CommitBatchSize := CallbackCreate(GetMethod(implObj, "get_CommitBatchSize"), flags, 2)
        this.vtbl.put_CommitBatchSize := CallbackCreate(GetMethod(implObj, "put_CommitBatchSize"), flags, 2)
        this.vtbl.MoveMessages := CallbackCreate(GetMethod(implObj, "MoveMessages"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SourcePath)
        CallbackFree(this.vtbl.put_SourcePath)
        CallbackFree(this.vtbl.get_DestPath)
        CallbackFree(this.vtbl.put_DestPath)
        CallbackFree(this.vtbl.get_CommitBatchSize)
        CallbackFree(this.vtbl.put_CommitBatchSize)
        CallbackFree(this.vtbl.MoveMessages)
    }
}
