#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\System\Threading\LPTHREAD_START_ROUTINE.ahk" { LPTHREAD_START_ROUTINE }
#Import "..\..\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CREATE_THREAD {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CREATE_THREAD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECURITY_ATTRIBUTES>} SecurityAttributes 
     * @param {Integer} StackSize 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} StartFunction 
     * @param {Pointer<Void>} ThreadParameter 
     * @param {Integer} CreationFlags 
     * @param {Pointer<Integer>} ThreadId 
     * @returns {HANDLE} 
     */
    Call(SecurityAttributes, StackSize, StartFunction, ThreadParameter, CreationFlags, ThreadId) {
        ThreadParameterMarshal := ThreadParameter is VarRef ? "ptr" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SECURITY_ATTRIBUTES.Ptr, SecurityAttributes, UInt32, StackSize, LPTHREAD_START_ROUTINE, StartFunction, ThreadParameterMarshal, ThreadParameter, UInt32, CreationFlags, ThreadIdMarshal, ThreadId, HANDLE.Owned)
        return result
    }

    /**
     * A PLSA_CREATE_THREAD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CREATE_THREAD {
        /**
         * Creates a PLSA_CREATE_THREAD pointer that invokes the given AHK function when called.
         * @param {Func(SECURITY_ATTRIBUTES, UInt32, LPTHREAD_START_ROUTINE, "ptr", UInt32, "uint*") => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECURITY_ATTRIBUTES.Ptr, UInt32, LPTHREAD_START_ROUTINE, "ptr", UInt32, "uint*", HANDLE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
