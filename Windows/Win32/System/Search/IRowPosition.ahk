#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowPosition extends IUnknown {
    /**
     * The interface identifier for IRowPosition
     * @type {Guid}
     */
    static IID := Guid("{0c733a94-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowPosition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ClearRowPosition : IntPtr
        GetRowPosition   : IntPtr
        GetRowset        : IntPtr
        Initialize       : IntPtr
        SetRowPosition   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowPosition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearRowPosition() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} phChapter 
     * @param {Pointer<Pointer>} phRow 
     * @param {Pointer<Integer>} pdwPositionFlags 
     * @returns {HRESULT} 
     */
    GetRowPosition(phChapter, phRow, pdwPositionFlags) {
        phChapterMarshal := phChapter is VarRef ? "ptr*" : "ptr"
        phRowMarshal := phRow is VarRef ? "ptr*" : "ptr"
        pdwPositionFlagsMarshal := pdwPositionFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, phChapterMarshal, phChapter, phRowMarshal, phRow, pdwPositionFlagsMarshal, pdwPositionFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetRowset(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {IUnknown} pRowset 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pRowset) {
        result := ComCall(6, this, "ptr", pRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} hRow 
     * @param {Integer} dwPositionFlags 
     * @returns {HRESULT} 
     */
    SetRowPosition(hChapter, hRow, dwPositionFlags) {
        result := ComCall(7, this, "ptr", hChapter, "ptr", hRow, "uint", dwPositionFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowPosition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ClearRowPosition := CallbackCreate(GetMethod(implObj, "ClearRowPosition"), flags, 1)
        this.vtbl.GetRowPosition := CallbackCreate(GetMethod(implObj, "GetRowPosition"), flags, 4)
        this.vtbl.GetRowset := CallbackCreate(GetMethod(implObj, "GetRowset"), flags, 3)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.SetRowPosition := CallbackCreate(GetMethod(implObj, "SetRowPosition"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ClearRowPosition)
        CallbackFree(this.vtbl.GetRowPosition)
        CallbackFree(this.vtbl.GetRowset)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.SetRowPosition)
    }
}
