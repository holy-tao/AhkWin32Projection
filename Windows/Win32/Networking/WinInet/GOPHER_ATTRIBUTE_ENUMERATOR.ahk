#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GOPHER_ATTRIBUTE_TYPE.ahk" { GOPHER_ATTRIBUTE_TYPE }

/**
 * Prototype for a callback function that processes attribute information from a Gopher server.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nc-wininet-gopher_attribute_enumerator
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct GOPHER_ATTRIBUTE_ENUMERATOR {
    value : IntPtr

    __value {
        set {
            if (value is GOPHER_ATTRIBUTE_ENUMERATOR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<GOPHER_ATTRIBUTE_TYPE>} lpAttributeInfo Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_attribute_type">GOPHER_ATTRIBUTE_TYPE</a> structure. The 
     * <i>lpBuffer</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophergetattributea">GopherGetAttribute</a> is used for storing this structure. The 
     * <i>lpBuffer</i> size must be equal to or greater than the value of MIN_GOPHER_ATTRIBUTE_LENGTH.
     * @param {Integer} dwError Error value. This parameter is NO_ERROR if the attribute was parsed and written to the buffer successfully. If a problem was encountered, an error value is returned.
     * @returns {BOOL} Return <b>TRUE</b> to continue the enumeration, or <b>FALSE</b> to stop it immediately. This function is primarily used for returning the results of a Gopher+ ASK item.
     */
    Call(lpAttributeInfo, dwError) {
        result := DllCall(this.value, GOPHER_ATTRIBUTE_TYPE.Ptr, lpAttributeInfo, UInt32, dwError, BOOL)
        return result
    }

    /**
     * A GOPHER_ATTRIBUTE_ENUMERATOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GOPHER_ATTRIBUTE_ENUMERATOR {
        /**
         * Creates a GOPHER_ATTRIBUTE_ENUMERATOR pointer that invokes the given AHK function when called.
         * @param {Func(GOPHER_ATTRIBUTE_TYPE, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [GOPHER_ATTRIBUTE_TYPE.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
