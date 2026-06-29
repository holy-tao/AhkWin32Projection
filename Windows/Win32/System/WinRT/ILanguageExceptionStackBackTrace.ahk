#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows projections to provide custom stack trace for that exception.
 * @remarks
 * It is recommended that language projections implement this interface when the stack trace is not captured by the relevant Global Error Handler API.
 * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionstackbacktrace
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ILanguageExceptionStackBackTrace extends IUnknown {
    /**
     * The interface identifier for ILanguageExceptionStackBackTrace
     * @type {Guid}
     */
    static IID := Guid("{cbe53fb5-f967-4258-8d34-42f5e25833de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILanguageExceptionStackBackTrace interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStackBackTrace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILanguageExceptionStackBackTrace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the back stack trace.
     * @remarks
     * You should implement <b>GetStackBackTrace</b> in your language projections when the Global Error Handler surface is unable to capture a backtrace. <b>GetStackBackTrace</b> is called by the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginatelanguageexception">RoOriginateLanguageException</a> export and by <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-capturepropagationcontext">CapturePropagationContext</a> when those functions detect, through querying for interface (QI), that the language exception provided to them implements it.
     * @param {Integer} maxFramesToCapture The maximum number of frames to capture.
     * @param {Pointer<Pointer>} stackBackTrace An array containing the stack back trace; the maximum size is the <i>maxFramesToCapture</i>.
     * @returns {Integer} On success, contains a pointer to the number of frames actually captured.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionstackbacktrace-getstackbacktrace
     */
    GetStackBackTrace(maxFramesToCapture, stackBackTrace) {
        stackBackTraceMarshal := stackBackTrace is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", maxFramesToCapture, stackBackTraceMarshal, stackBackTrace, "uint*", &framesCaptured := 0, "HRESULT")
        return framesCaptured
    }

    Query(iid) {
        if (ILanguageExceptionStackBackTrace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStackBackTrace := CallbackCreate(GetMethod(implObj, "GetStackBackTrace"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStackBackTrace)
    }
}
