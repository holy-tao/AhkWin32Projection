#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_XML_ALGORITHM_INFO.ahk" { CRYPT_XML_ALGORITHM_INFO }

/**
 * Enumerates predefined and registered CRYPT_XML_ALGORITHM_INFO entries.
 * @remarks
 * If the callback function returns <b>FALSE</b>, then stop the enumeration.
 * 
 *  This function enumerates  either the predefined and registered 
 *  entries or the structures identified by a selected URI group.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-pfn_crypt_xml_enum_alg_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_XML_ENUM_ALG_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_XML_ENUM_ALG_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_ALGORITHM_INFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info">CRYPT_XML_ALGORITHM_INFO</a> structure.
     * @param {Pointer<Void>} pvArg A pointer to an argument that is passed to the callback function from the calling function.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     */
    Call(pInfo, pvArg) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_XML_ALGORITHM_INFO.Ptr, pInfo, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_XML_ENUM_ALG_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_XML_ENUM_ALG_INFO {
        /**
         * Creates a PFN_CRYPT_XML_ENUM_ALG_INFO pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM_INFO, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM_INFO.Ptr, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
