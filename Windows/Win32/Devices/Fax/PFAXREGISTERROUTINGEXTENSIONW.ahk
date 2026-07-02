#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PFAX_ROUTING_INSTALLATION_CALLBACKW.ahk" { PFAX_ROUTING_INSTALLATION_CALLBACKW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXREGISTERROUTINGEXTENSIONW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXREGISTERROUTINGEXTENSIONW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {PWSTR} ExtensionName 
     * @param {PWSTR} FriendlyName 
     * @param {PWSTR} ImageName 
     * @param {Pointer<PFAX_ROUTING_INSTALLATION_CALLBACKW>} CallBack 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOL} 
     */
    Call(FaxHandle, ExtensionName, FriendlyName, ImageName, CallBack, _Context) {
        ExtensionName := ExtensionName is String ? StrPtr(ExtensionName) : ExtensionName
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, "ptr", ExtensionName, "ptr", FriendlyName, "ptr", ImageName, PFAX_ROUTING_INSTALLATION_CALLBACKW, CallBack, _ContextMarshal, _Context, BOOL)
        return result
    }

    /**
     * A PFAXREGISTERROUTINGEXTENSIONW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXREGISTERROUTINGEXTENSIONW {
        /**
         * Creates a PFAXREGISTERROUTINGEXTENSIONW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, PWSTR, PWSTR, PFAX_ROUTING_INSTALLATION_CALLBACKW, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, PWSTR, PWSTR, PFAX_ROUTING_INSTALLATION_CALLBACKW, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
