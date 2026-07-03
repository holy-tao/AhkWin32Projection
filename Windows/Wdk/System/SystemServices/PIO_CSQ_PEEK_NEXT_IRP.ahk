#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PIO_CSQ_PEEK_NEXT_IRP {
    value : IntPtr

    __value {
        set {
            if (value is PIO_CSQ_PEEK_NEXT_IRP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<IRP>} 
     */
    Call() {
        result := DllCall(this.value, IRP.Ptr)
        return result
    }

    /**
     * A PIO_CSQ_PEEK_NEXT_IRP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIO_CSQ_PEEK_NEXT_IRP {
        /**
         * Creates a PIO_CSQ_PEEK_NEXT_IRP pointer that invokes the given AHK function when called.
         * @param {Func() => IRP.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IRP.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
