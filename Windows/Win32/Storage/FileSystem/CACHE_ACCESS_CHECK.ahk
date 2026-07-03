#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Security\GENERIC_MAPPING.ahk" { GENERIC_MAPPING }
#Import "..\..\Security\PRIVILEGE_SET.ahk" { PRIVILEGE_SET }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CACHE_ACCESS_CHECK {
    value : IntPtr

    __value {
        set {
            if (value is CACHE_ACCESS_CHECK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {HANDLE} hClientToken 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Pointer<PRIVILEGE_SET>} PrivilegeSet 
     * @param {Pointer<Integer>} PrivilegeSetLength 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<BOOL>} AccessStatus 
     * @returns {BOOL} 
     */
    Call(pSecurityDescriptor, hClientToken, dwDesiredAccess, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus) {
        PrivilegeSetLengthMarshal := PrivilegeSetLength is VarRef ? "uint*" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, PSECURITY_DESCRIPTOR, pSecurityDescriptor, HANDLE, hClientToken, UInt32, dwDesiredAccess, GENERIC_MAPPING.Ptr, GenericMapping, PRIVILEGE_SET.Ptr, PrivilegeSet, PrivilegeSetLengthMarshal, PrivilegeSetLength, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, BOOL)
        return result
    }

    /**
     * A CACHE_ACCESS_CHECK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CACHE_ACCESS_CHECK {
        /**
         * Creates a CACHE_ACCESS_CHECK pointer that invokes the given AHK function when called.
         * @param {Func(PSECURITY_DESCRIPTOR, HANDLE, UInt32, GENERIC_MAPPING, PRIVILEGE_SET, "uint*", "uint*", BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSECURITY_DESCRIPTOR, HANDLE, UInt32, GENERIC_MAPPING.Ptr, PRIVILEGE_SET.Ptr, "uint*", "uint*", BOOL.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
