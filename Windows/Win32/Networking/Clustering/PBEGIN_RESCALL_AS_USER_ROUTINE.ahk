#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PBEGIN_RESCALL_AS_USER_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PBEGIN_RESCALL_AS_USER_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource 
     * @param {HANDLE} TokenHandle 
     * @param {Integer} ControlCode 
     * @param {Pointer<Void>} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Pointer<Void>} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @param {Integer} _context 
     * @param {Pointer<BOOL>} ReturnedAsynchronously 
     * @returns {Integer} 
     */
    Call(Resource, TokenHandle, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned, _context, ReturnedAsynchronously) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"
        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"
        ReturnedAsynchronouslyMarshal := ReturnedAsynchronously is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, HANDLE, TokenHandle, UInt32, ControlCode, InBufferMarshal, InBuffer, UInt32, InBufferSize, OutBufferMarshal, OutBuffer, UInt32, OutBufferSize, BytesReturnedMarshal, BytesReturned, Int64, _context, ReturnedAsynchronouslyMarshal, ReturnedAsynchronously, UInt32)
        return result
    }

    /**
     * A PBEGIN_RESCALL_AS_USER_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PBEGIN_RESCALL_AS_USER_ROUTINE {
        /**
         * Creates a PBEGIN_RESCALL_AS_USER_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HANDLE, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", Int64, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HANDLE, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", Int64, BOOL.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
