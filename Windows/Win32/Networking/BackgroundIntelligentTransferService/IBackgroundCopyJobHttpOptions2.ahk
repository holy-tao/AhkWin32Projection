#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBackgroundCopyJobHttpOptions.ahk" { IBackgroundCopyJobHttpOptions }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\Apis.ahk" { CoTaskMemFree }

/**
 * Use this interface to retrieve and/or to override the HTTP method used for a BITS transfer.
 * @see https://learn.microsoft.com/windows/win32/api/bits10_2/nn-bits10_2-ibackgroundcopyjobhttpoptions2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyJobHttpOptions2 extends IBackgroundCopyJobHttpOptions {
    /**
     * The interface identifier for IBackgroundCopyJobHttpOptions2
     * @type {Guid}
     */
    static IID := Guid("{b591a192-a405-4fc3-8323-4c5c542578fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyJobHttpOptions2 interfaces
    */
    struct Vtbl extends IBackgroundCopyJobHttpOptions.Vtbl {
        SetHttpMethod : IntPtr
        GetHttpMethod : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyJobHttpOptions2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Overrides the default HTTP method used for a BITS transfer.
     * @remarks
     * BITS allows you, as the developer, to choose an HTTP method other than the default method. This increases BITS' ability to interact with servers that don't adhere to the normal BITS requirements for HTTP servers. Bear the following in mind when you choose a different HTTP method from the default one.
     * 
     * <ul>
     * <li>BITS automatically changes the job priority to <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_priority">BG_JOB_PRIORITY_FOREGROUND</a>, and prevents that priority from being changed.</li>
     * <li>An error that would ordinarily  be resumable (such as loss of connectivity) transitions the job to an ERROR state. You, as the developer, can restart the job by calling <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a>, and the job will be restarted from the beginning. See <a href="https://docs.microsoft.com/windows/desktop/Bits/life-cycle-of-a-bits-job">Life Cycle of a BITS Job</a> for more information on BITS job states.</li>
     * <li>BITS doesn’t allow DYNAMIC_CONTENT nor ON_DEMAND_MODE jobs with <b>SetHttpMethod</b>.</li>
     * </ul>
     * <b>SetHttpMethod</b> does nothing if the method name that you pass matches the default HTTP method for the transfer type. For example, if you set a download job method to "GET" (the default), then the job priority won't be changed. The HTTP method must be set before the first call to <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> that starts the job.
     * @param {PWSTR} method Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A pointer to a constant null-terminated string of wide characters containing the HTTP method name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_2/nf-bits10_2-ibackgroundcopyjobhttpoptions2-sethttpmethod
     */
    SetHttpMethod(method) {
        method := method is String ? StrPtr(method) : method

        result := ComCall(11, this, "ptr", method, "HRESULT")
        return result
    }

    /**
     * Retrieves a wide string containing the HTTP method name for the BITS transfer. By default, download jobs will be &quot;GET&quot;, and upload and upload-reply jobs will be &quot;BITS_POST&quot;.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The address of a pointer to a null-terminated string of wide characters. If successful, the method updates the pointer to point to a string containing the HTTP method name. When you're done with this string, free it with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_2/nf-bits10_2-ibackgroundcopyjobhttpoptions2-gethttpmethod
     */
    GetHttpMethod() {
        result := ComCall(12, this, PWSTR.Ptr, &method := 0, Int32)
        if(result != 0) {
            CoTaskMemFree(method.value)
            throw OSError()
        }

        return method
    }

    Query(iid) {
        if (IBackgroundCopyJobHttpOptions2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHttpMethod := CallbackCreate(GetMethod(implObj, "SetHttpMethod"), flags, 2)
        this.vtbl.GetHttpMethod := CallbackCreate(GetMethod(implObj, "GetHttpMethod"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHttpMethod)
        CallbackFree(this.vtbl.GetHttpMethod)
    }
}
