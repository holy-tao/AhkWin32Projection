#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Specifies that an object has changed.
 * @remarks
 * A provider calls an implementation of the <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH</b> callback function to indicate that an object has changed.
 * 
 * A pointer to this function is set in the <i>pfnFlush</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</a> function.
 * 
 * An identifier is data chosen by the provider to represent the object being located for the caller. Identifiers need not be unique. If the provider determines that the object associated with the identifier is no longer valid, it should call this function to mark all objects with the associated identifier as invalid. This function is thread safe.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_flush
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pContext Pointer to a provider defined object that contains information about this provider.
     * @param {Pointer<Pointer<CRYPT_INTEGER_BLOB>>} rgIdentifierOrNameList Pointer to an array of names or identifiers.
     * @param {Integer} dwIdentifierOrNameListCount The number of names or identifiers specified by the <i>rgIdentifierOrNameList</i> parameter.
     * @returns {BOOL} If the function succeeds, return nonzero (<b>TRUE</b>).
     * 
     * If the function fails, return zero (<b>FALSE</b>).
     */
    Call(pContext, rgIdentifierOrNameList, dwIdentifierOrNameListCount) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        rgIdentifierOrNameListMarshal := rgIdentifierOrNameList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, rgIdentifierOrNameListMarshal, rgIdentifierOrNameList, UInt32, dwIdentifierOrNameListCount, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
