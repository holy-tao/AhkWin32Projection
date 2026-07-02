#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFN_NT_OPEN_TRANSACTION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_NT_OPEN_TRANSACTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Guid>} Uow 
     * @param {HANDLE} TmHandle 
     * @returns {NTSTATUS} 
     */
    Call(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle) {
        result := DllCall(this.value, HANDLE.Ptr, TransactionHandle, UInt32, DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, Guid.Ptr, Uow, HANDLE, TmHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFN_NT_OPEN_TRANSACTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_NT_OPEN_TRANSACTION {
        /**
         * Creates a PFN_NT_OPEN_TRANSACTION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, OBJECT_ATTRIBUTES, Guid, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE.Ptr, UInt32, OBJECT_ATTRIBUTES.Ptr, Guid.Ptr, HANDLE, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
