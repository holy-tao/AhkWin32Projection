#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Performs initialization or cleanup when entering or exiting a COM apartment.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iinitializespy
 * @namespace Windows.Win32.System.Com
 */
export default struct IInitializeSpy extends IUnknown {
    /**
     * The interface identifier for IInitializeSpy
     * @type {Guid}
     */
    static IID := Guid("{00000034-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeSpy interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PreInitialize    : IntPtr
        PostInitialize   : IntPtr
        PreUninitialize  : IntPtr
        PostUninitialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeSpy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs initialization steps required before calling the CoInitializeEx function.
     * @param {Integer} dwCoInit The apartment type passed to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-coinit">COINIT</a> enumeration.
     * @param {Integer} dwCurThreadAptRefs The number of times <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> has been called on this thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-preinitialize
     */
    PreInitialize(dwCoInit, dwCurThreadAptRefs) {
        result := ComCall(3, this, "uint", dwCoInit, "uint", dwCurThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * Performs initialization steps required after calling the CoInitializeEx function.
     * @remarks
     * The return value from <b>PostInitialize</b> is intended to be the returned <b>HRESULT</b> from the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>. This is always the case for a single active registration on this thread.
     * 
     * For cases where there are multiple registrations active on this thread, the returned <b>HRESULT</b> is arrived at by chaining of the various <b>PostInitialize</b> methods as follows: The COM determined <b>HRESULT</b> will be passed as the <i>hrCoInit</i> parameter to the first <b>PostInitialize</b> method called. The <b>HRESULT</b> from that <b>PostInitialize</b> call will be passed as the <i>hrCoInit</i> parameter to the next <b>PostInitialize</b> call. This chaining continues leading to the <b>HRESULT</b> from the last <b>PostInitialize</b> call being returned as the <b>HRESULT</b> from the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>.
     * @param {HRESULT} hrCoInit The value returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>.
     * @param {Integer} dwCoInit The apartment type passed to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-coinit">COINIT</a> enumeration.
     * @param {Integer} dwNewThreadAptRefs The number of times <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> has been called on this thread.
     * @returns {HRESULT} This method returns the value that it intends the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> call to return to its caller. For more information, see the Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-postinitialize
     */
    PostInitialize(hrCoInit, dwCoInit, dwNewThreadAptRefs) {
        result := ComCall(4, this, "int", hrCoInit, "uint", dwCoInit, "uint", dwNewThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * Performs cleanup steps required before calling the CoUninitialize function.
     * @param {Integer} dwCurThreadAptRefs The number of times <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> has been called on this thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-preuninitialize
     */
    PreUninitialize(dwCurThreadAptRefs) {
        result := ComCall(5, this, "uint", dwCurThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * Performs cleanup steps required after calling the CoUninitialize function.
     * @param {Integer} dwNewThreadAptRefs The number of calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> remaining on this thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-postuninitialize
     */
    PostUninitialize(dwNewThreadAptRefs) {
        result := ComCall(6, this, "uint", dwNewThreadAptRefs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeSpy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PreInitialize := CallbackCreate(GetMethod(implObj, "PreInitialize"), flags, 3)
        this.vtbl.PostInitialize := CallbackCreate(GetMethod(implObj, "PostInitialize"), flags, 4)
        this.vtbl.PreUninitialize := CallbackCreate(GetMethod(implObj, "PreUninitialize"), flags, 2)
        this.vtbl.PostUninitialize := CallbackCreate(GetMethod(implObj, "PostUninitialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PreInitialize)
        CallbackFree(this.vtbl.PostInitialize)
        CallbackFree(this.vtbl.PreUninitialize)
        CallbackFree(this.vtbl.PostUninitialize)
    }
}
