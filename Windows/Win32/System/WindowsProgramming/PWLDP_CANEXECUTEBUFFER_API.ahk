#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WLDP_EXECUTION_EVALUATION_OPTIONS.ahk" { WLDP_EXECUTION_EVALUATION_OPTIONS }
#Import ".\WLDP_EXECUTION_POLICY.ahk" { WLDP_EXECUTION_POLICY }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_CANEXECUTEBUFFER_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_CANEXECUTEBUFFER_API) {
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
     * @param {Pointer<Integer>} _buffer 
     * @param {Integer} bufferSize 
     * @param {PWSTR} auditInfo 
     * @returns {WLDP_EXECUTION_POLICY} 
     */
    Call(host, options, _buffer, bufferSize, auditInfo) {
        auditInfo := auditInfo is String ? StrPtr(auditInfo) : auditInfo

        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, host, WLDP_EXECUTION_EVALUATION_OPTIONS, options, _bufferMarshal, _buffer, UInt32, bufferSize, "ptr", auditInfo, "int*", &result := 0, "HRESULT")
        return result
    }

    /**
     * A PWLDP_CANEXECUTEBUFFER_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_CANEXECUTEBUFFER_API {
        /**
         * Creates a PWLDP_CANEXECUTEBUFFER_API pointer that invokes the given AHK function when called.
         * @param {Func(Guid, WLDP_EXECUTION_EVALUATION_OPTIONS, "char*", UInt32, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, WLDP_EXECUTION_EVALUATION_OPTIONS, "char*", UInt32, PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
