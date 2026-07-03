#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\AsnObjectIdentifier.ahk" { AsnObjectIdentifier }

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPEXTENSIONINIT {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPEXTENSIONINIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwUpTimeReference 
     * @param {Pointer<HANDLE>} phSubagentTrapEvent 
     * @param {Pointer<AsnObjectIdentifier>} pFirstSupportedRegion 
     * @returns {BOOL} 
     */
    Call(dwUpTimeReference, phSubagentTrapEvent, pFirstSupportedRegion) {
        result := DllCall(this.value, UInt32, dwUpTimeReference, HANDLE.Ptr, phSubagentTrapEvent, AsnObjectIdentifier.Ptr, pFirstSupportedRegion, BOOL)
        return result
    }

    /**
     * A PFNSNMPEXTENSIONINIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPEXTENSIONINIT {
        /**
         * Creates a PFNSNMPEXTENSIONINIT pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, HANDLE, AsnObjectIdentifier) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, HANDLE.Ptr, AsnObjectIdentifier.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
