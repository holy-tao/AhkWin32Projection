#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_ASYNC_RESULT.ahk" { WINBIO_ASYNC_RESULT }

/**
 * Notifies the client application that an asynchronous operation started by using WinBioAsyncOpenSession or WinBioAsyncOpenFramework has completed.
 * @remarks
 * You must create this callback if you open a biometric session by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a> function and you set  <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b> in the <i>NotificationMethod</i> parameter of either function.
 * 
 * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure is allocated internally by the Windows Biometric Framework. Therefore, when you are through using it, call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the allocated memory and avoid leaks. Because this also releases all nested data structures, you should not keep a copy of any pointers returned in the <b>WINBIO_ASYNC_RESULT</b> structure. If you want to save any data returned in a nested structure, make a private copy of that data before calling <b>WinBioFree</b>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winbio/nc-winbio-pwinbio_async_completion_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PWINBIO_ASYNC_COMPLETION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PWINBIO_ASYNC_COMPLETION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_ASYNC_RESULT>} AsyncResult Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure that contains information about the completed operation. The structure is created by the Windows Biometric Framework. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the structure.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(AsyncResult) {
        DllCall(this.value, WINBIO_ASYNC_RESULT.Ptr, AsyncResult)
    }

    /**
     * A PWINBIO_ASYNC_COMPLETION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINBIO_ASYNC_COMPLETION_CALLBACK {
        /**
         * Creates a PWINBIO_ASYNC_COMPLETION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_ASYNC_RESULT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_ASYNC_RESULT.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
