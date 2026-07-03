#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_VIRTUAL_DEVICE_LOCATION {
    value : IntPtr

    __value {
        set {
            if (value is GET_VIRTUAL_DEVICE_LOCATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} VirtualFunction 
     * @param {Pointer<Integer>} SegmentNumber 
     * @param {Pointer<Integer>} BusNumber 
     * @param {Pointer<Integer>} FunctionNumber 
     * @returns {NTSTATUS} 
     */
    Call(_Context, VirtualFunction, SegmentNumber, BusNumber, FunctionNumber) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        SegmentNumberMarshal := SegmentNumber is VarRef ? "ushort*" : "ptr"
        BusNumberMarshal := BusNumber is VarRef ? "char*" : "ptr"
        FunctionNumberMarshal := FunctionNumber is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt16, VirtualFunction, SegmentNumberMarshal, SegmentNumber, BusNumberMarshal, BusNumber, FunctionNumberMarshal, FunctionNumber, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A GET_VIRTUAL_DEVICE_LOCATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_VIRTUAL_DEVICE_LOCATION {
        /**
         * Creates a GET_VIRTUAL_DEVICE_LOCATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt16, "ushort*", "char*", "char*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt16, "ushort*", "char*", "char*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
