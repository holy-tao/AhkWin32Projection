#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WLDP_EXECUTION_EVALUATION_OPTIONS.ahk" { WLDP_EXECUTION_EVALUATION_OPTIONS }
#Import ".\WLDP_EXECUTION_POLICY.ahk" { WLDP_EXECUTION_POLICY }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} host 
     * @param {WLDP_EXECUTION_EVALUATION_OPTIONS} options 
     * @param {HANDLE} contentFileHandle 
     * @param {HANDLE} signatureFileHandle 
     * @param {PWSTR} auditInfo 
     * @returns {WLDP_EXECUTION_POLICY} 
     */
    Call(host, options, contentFileHandle, signatureFileHandle, auditInfo) {
        auditInfo := auditInfo is String ? StrPtr(auditInfo) : auditInfo

        result := DllCall(this.value, Guid.Ptr, host, WLDP_EXECUTION_EVALUATION_OPTIONS, options, HANDLE, contentFileHandle, HANDLE, signatureFileHandle, "ptr", auditInfo, "int*", &result := 0, "HRESULT")
        return result
    }

    /**
     * A PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API {
        /**
         * Creates a PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API pointer that invokes the given AHK function when called.
         * @param {Func(Guid, WLDP_EXECUTION_EVALUATION_OPTIONS, HANDLE, HANDLE, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, WLDP_EXECUTION_EVALUATION_OPTIONS, HANDLE, HANDLE, PWSTR, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
