#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KDEXT_DUMP_HANDLE_CALLBACK.ahk" { KDEXT_DUMP_HANDLE_CALLBACK }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PENUMERATE_HANDLES {
    value : IntPtr

    __value {
        set {
            if (value is PENUMERATE_HANDLES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Process 
     * @param {Integer} HandleToDump 
     * @param {Integer} Flags 
     * @param {Pointer<KDEXT_DUMP_HANDLE_CALLBACK>} Callback 
     * @param {Pointer<Void>} _Context 
     * @returns {HRESULT} 
     */
    Call(Client, Process, HandleToDump, Flags, Callback, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", Client, Int64, Process, Int64, HandleToDump, UInt32, Flags, KDEXT_DUMP_HANDLE_CALLBACK, Callback, _ContextMarshal, _Context, "HRESULT")
        return result
    }

    /**
     * A PENUMERATE_HANDLES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMERATE_HANDLES {
        /**
         * Creates a PENUMERATE_HANDLES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, Int64, UInt32, KDEXT_DUMP_HANDLE_CALLBACK, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, Int64, UInt32, KDEXT_DUMP_HANDLE_CALLBACK, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
