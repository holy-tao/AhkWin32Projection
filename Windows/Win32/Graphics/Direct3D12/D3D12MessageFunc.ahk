#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\D3D12_MESSAGE_CATEGORY.ahk" { D3D12_MESSAGE_CATEGORY }
#Import ".\D3D12_MESSAGE_ID.ahk" { D3D12_MESSAGE_ID }
#Import ".\D3D12_MESSAGE_SEVERITY.ahk" { D3D12_MESSAGE_SEVERITY }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12MessageFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12MessageFunc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {D3D12_MESSAGE_CATEGORY} Category 
     * @param {D3D12_MESSAGE_SEVERITY} Severity 
     * @param {D3D12_MESSAGE_ID} ID 
     * @param {PSTR} pDescription 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Category, Severity, ID, pDescription, pContext) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, D3D12_MESSAGE_CATEGORY, Category, D3D12_MESSAGE_SEVERITY, Severity, D3D12_MESSAGE_ID, ID, "ptr", pDescription, pContextMarshal, pContext)
    }

    /**
     * A D3D12MessageFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12MessageFunc {
        /**
         * Creates a D3D12MessageFunc pointer that invokes the given AHK function when called.
         * @param {Func(D3D12_MESSAGE_CATEGORY, D3D12_MESSAGE_SEVERITY, D3D12_MESSAGE_ID, PSTR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3D12_MESSAGE_CATEGORY, D3D12_MESSAGE_SEVERITY, D3D12_MESSAGE_ID, PSTR, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
