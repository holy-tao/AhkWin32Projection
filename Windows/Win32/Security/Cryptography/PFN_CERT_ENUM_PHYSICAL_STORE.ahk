#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_PHYSICAL_STORE_INFO.ahk" { CERT_PHYSICAL_STORE_INFO }

/**
 * The CertEnumPhysicalStoreCallback callback function formats and presents information on each physical store found by a call to CertEnumPhysicalStore.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_enum_physical_store
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_ENUM_PHYSICAL_STORE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_ENUM_PHYSICAL_STORE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvSystemStore If CERT_SYSTEM_STORE_RELOCATE_FLAG is set in <i>dwFlags</i>, <i>pvSystemStore</i> points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_system_store_relocate_para">CERT_SYSTEM_STORE_RELOCATE_PARA</a> structure that indicates both the name and the location of the system store to be enumerated. Otherwise, <i>pvSystemStore</i> is a pointer to a Unicode string that names the system store whose physical stores are to be enumerated. For information about prefixing the name of a service or computer to the system store name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certregistersystemstore">CertRegisterSystemStore</a>.
     * @param {Integer} dwFlags Specifies the location of the system store. The following flag values are defined:
     * 
     * <ul>
     * <li>CERT_SYSTEM_STORE_CURRENT_USER</li>
     * <li>CERT_SYSTEM_STORE_CURRENT_SERVICE</li>
     * <li>CERT_SYSTEM_STORE_LOCAL_MACHINE</li>
     * <li>CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY</li>
     * <li>CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY</li>
     * <li>CERT_SYSTEM_STORE_SERVICES</li>
     * <li>CERT_SYSTEM_STORE_USERS</li>
     * <li>CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE</li>
     * </ul>
     * In addition, CERT_SYSTEM_STORE_RELOCATE_FLAG or CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG can be combined using a bitwise-<b>OR</b> operation with any of the high-word location flags. The CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG constant is set if the physical store is predefined rather than registered.
     * @param {PWSTR} pwszStoreName Name of the physical store.
     * @param {Pointer<CERT_PHYSICAL_STORE_INFO>} pStoreInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_physical_store_info">CERT_PHYSICAL_STORE_INFO</a> structure containing information about the store.
     * @param {Pointer<Void>} pvArg A pointer to information passed to the callback function in the <i>pvArg</i> passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certenumphysicalstore">CertEnumPhysicalStore</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, <b>FALSE</b> if it fails.
     */
    Call(pvSystemStore, dwFlags, pwszStoreName, pStoreInfo, pvArg) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pwszStoreName := pwszStoreName is String ? StrPtr(pwszStoreName) : pwszStoreName

        pvSystemStoreMarshal := pvSystemStore is VarRef ? "ptr" : "ptr"
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvSystemStoreMarshal, pvSystemStore, UInt32, dwFlags, "ptr", pwszStoreName, CERT_PHYSICAL_STORE_INFO.Ptr, pStoreInfo, "ptr", pvReserved, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CERT_ENUM_PHYSICAL_STORE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_ENUM_PHYSICAL_STORE {
        /**
         * Creates a PFN_CERT_ENUM_PHYSICAL_STORE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, PWSTR, CERT_PHYSICAL_STORE_INFO, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, PWSTR, CERT_PHYSICAL_STORE_INFO.Ptr, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
