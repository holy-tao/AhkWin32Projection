#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Module.ahk" { MI_Module }
#Import ".\MI_Server.ahk" { MI_Server }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_MainFunction {
    value : IntPtr

    __value {
        set {
            if (value is MI_MainFunction) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<MI_Server>} server 
     * @returns {Pointer<MI_Module>} 
     */
    Call(server) {
        result := DllCall(this.value, MI_Server.Ptr, server, MI_Module.Ptr)
        return result
    }

    /**
     * A MI_MainFunction that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_MainFunction {
        /**
         * Creates a MI_MainFunction pointer that invokes the given AHK function when called.
         * @param {Func(MI_Server) => MI_Module.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [MI_Server.Ptr, MI_Module.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
