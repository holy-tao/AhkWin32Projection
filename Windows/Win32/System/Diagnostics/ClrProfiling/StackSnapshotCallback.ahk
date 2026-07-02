#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct StackSnapshotCallback {
    value : IntPtr

    __value {
        set {
            if (value is StackSnapshotCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} funcId 
     * @param {Pointer} ip 
     * @param {Pointer} frameInfo 
     * @param {Integer} contextSize 
     * @param {Pointer<Integer>} _context 
     * @param {Pointer<Void>} clientData 
     * @returns {HRESULT} 
     */
    Call(funcId, ip, frameInfo, contextSize, _context, clientData) {
        _contextMarshal := _context is VarRef ? "char*" : "ptr"
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, funcId, IntPtr, ip, IntPtr, frameInfo, UInt32, contextSize, _contextMarshal, _context, clientDataMarshal, clientData, "HRESULT")
        return result
    }

    /**
     * A StackSnapshotCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends StackSnapshotCallback {
        /**
         * Creates a StackSnapshotCallback pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, IntPtr, UInt32, "char*", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, IntPtr, UInt32, "char*", "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
