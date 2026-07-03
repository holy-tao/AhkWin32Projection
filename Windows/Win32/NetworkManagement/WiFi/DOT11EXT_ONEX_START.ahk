#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Security\ExtensibleAuthenticationProtocol\EAP_ATTRIBUTES.ahk" { EAP_ATTRIBUTES }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_ONEX_START {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_ONEX_START) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDot11SvcHandle 
     * @param {Pointer<EAP_ATTRIBUTES>} pEapAttributes 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, pEapAttributes) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, EAP_ATTRIBUTES.Ptr, pEapAttributes, UInt32)
        return result
    }

    /**
     * A DOT11EXT_ONEX_START that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_ONEX_START {
        /**
         * Creates a DOT11EXT_ONEX_START pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, EAP_ATTRIBUTES) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, EAP_ATTRIBUTES.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
