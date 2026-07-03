#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IStream.ahk" { IStream }
#Import ".\WLDP_EXECUTION_EVALUATION_OPTIONS.ahk" { WLDP_EXECUTION_EVALUATION_OPTIONS }
#Import ".\WLDP_EXECUTION_POLICY.ahk" { WLDP_EXECUTION_POLICY }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_CANEXECUTESTREAM_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_CANEXECUTESTREAM_API) {
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
     * @param {IStream} stream 
     * @param {PWSTR} auditInfo 
     * @returns {WLDP_EXECUTION_POLICY} 
     */
    Call(host, options, stream, auditInfo) {
        auditInfo := auditInfo is String ? StrPtr(auditInfo) : auditInfo

        result := DllCall(this.value, Guid.Ptr, host, WLDP_EXECUTION_EVALUATION_OPTIONS, options, "ptr", stream, "ptr", auditInfo, "int*", &result := 0, "HRESULT")
        return result
    }

    /**
     * A PWLDP_CANEXECUTESTREAM_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_CANEXECUTESTREAM_API {
        /**
         * Creates a PWLDP_CANEXECUTESTREAM_API pointer that invokes the given AHK function when called.
         * @param {Func(Guid, WLDP_EXECUTION_EVALUATION_OPTIONS, "ptr", PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, WLDP_EXECUTION_EVALUATION_OPTIONS, "ptr", PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
