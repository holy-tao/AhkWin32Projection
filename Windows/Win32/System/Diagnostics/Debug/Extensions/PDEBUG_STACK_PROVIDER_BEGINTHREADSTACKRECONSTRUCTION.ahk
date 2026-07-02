#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_STACK_PROVIDER_BEGINTHREADSTACKRECONSTRUCTION {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_STACK_PROVIDER_BEGINTHREADSTACKRECONSTRUCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} StreamType 
     * @param {Pointer<Void>} MiniDumpStreamBuffer 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    Call(StreamType, MiniDumpStreamBuffer, BufferSize) {
        MiniDumpStreamBufferMarshal := MiniDumpStreamBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, StreamType, MiniDumpStreamBufferMarshal, MiniDumpStreamBuffer, UInt32, BufferSize, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_STACK_PROVIDER_BEGINTHREADSTACKRECONSTRUCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_STACK_PROVIDER_BEGINTHREADSTACKRECONSTRUCTION {
        /**
         * Creates a PDEBUG_STACK_PROVIDER_BEGINTHREADSTACKRECONSTRUCTION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
