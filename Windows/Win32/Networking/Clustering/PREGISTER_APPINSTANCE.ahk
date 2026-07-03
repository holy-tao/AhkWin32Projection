#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PREGISTER_APPINSTANCE {
    value : IntPtr

    __value {
        set {
            if (value is PREGISTER_APPINSTANCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Guid>} AppInstanceId 
     * @param {BOOL} ChildrenInheritAppInstance 
     * @returns {Integer} 
     */
    Call(ProcessHandle, AppInstanceId, ChildrenInheritAppInstance) {
        result := DllCall(this.value, HANDLE, ProcessHandle, Guid.Ptr, AppInstanceId, BOOL, ChildrenInheritAppInstance, UInt32)
        return result
    }

    /**
     * A PREGISTER_APPINSTANCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREGISTER_APPINSTANCE {
        /**
         * Creates a PREGISTER_APPINSTANCE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Guid, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Guid.Ptr, BOOL, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
