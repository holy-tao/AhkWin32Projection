#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISCPSecureQuery.ahk" { ISCPSecureQuery }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPDevice.ahk" { IMDSPDevice }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISCPSession interface provides efficient common state management for multiple operations.A secure content provider (SCP) session is useful when transferring multiple files.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iscpsession
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct ISCPSession extends IUnknown {
    /**
     * The interface identifier for ISCPSession
     * @type {Guid}
     */
    static IID := Guid("{88a3e6ed-eee4-4619-bbb3-fd4fb62715d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISCPSession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginSession   : IntPtr
        EndSession     : IntPtr
        GetSecureQuery : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISCPSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The BeginSession method indicates beginning of a transfer session. It can be used to optimize operations that need to occur only once per transfer session.
     * @param {IMDSPDevice} pIDevice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspdevice">IMDSPDevice</a> object.
     * @param {Pointer<Integer>} pCtx Pointer to the context.
     * @param {Integer} dwSizeCtx <b>DWORD</b> containing the size of context.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsession-beginsession
     */
    BeginSession(pIDevice, pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pIDevice, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * The EndSession method indicates the ending of a transfer session.
     * @param {Pointer<Integer>} pCtx Pointer to the context.
     * @param {Integer} dwSizeCtx <b>DWORD</b> containing the size of context.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsession-endsession
     */
    EndSession(pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * The GetSecureQuery method is used to obtain a secure query object for the session.
     * @remarks
     * This method should be used to obtain a secure query object when using secure content provider sessions for efficient transfer of multiple files.
     * @returns {ISCPSecureQuery} Pointer to a secure query object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsession-getsecurequery
     */
    GetSecureQuery() {
        result := ComCall(5, this, "ptr*", &ppSecureQuery := 0, "HRESULT")
        return ISCPSecureQuery(ppSecureQuery)
    }

    Query(iid) {
        if (ISCPSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginSession := CallbackCreate(GetMethod(implObj, "BeginSession"), flags, 4)
        this.vtbl.EndSession := CallbackCreate(GetMethod(implObj, "EndSession"), flags, 3)
        this.vtbl.GetSecureQuery := CallbackCreate(GetMethod(implObj, "GetSecureQuery"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginSession)
        CallbackFree(this.vtbl.EndSession)
        CallbackFree(this.vtbl.GetSecureQuery)
    }
}
