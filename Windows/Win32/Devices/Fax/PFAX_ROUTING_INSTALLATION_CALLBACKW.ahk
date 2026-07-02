#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FaxRoutingInstallationCallback function is a library-defined callback function that the FaxRegisterRoutingExtension function calls to install a fax routing extension DLL.
 * @remarks
 * The <b>PFAX_ROUTING_INSTALLATION_CALLBACKW</b> data type is a pointer to a <i>FaxRoutingInstallationCallback</i> function.
 * 
 * A fax client application specifies the <i>FaxRoutingInstallationCallback</i> function by passing its address when it calls the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/nf-winfax-faxregisterroutingextensionw">FaxRegisterRoutingExtension</a> function. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-registration-of-a-fax-routing-extension">Registration of a Fax Routing Extension</a>.
 * 
 * For information about fax routing extensions, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfax_routing_installation_callbackw
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_ROUTING_INSTALLATION_CALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_ROUTING_INSTALLATION_CALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Void>} _Context Type: <b>LPVOID</b>
     * 
     * Pointer to a variable that contains application-specific context information or an application-defined value. The <a href="https://docs.microsoft.com/windows/desktop/api/winfax/nf-winfax-faxregisterroutingextensionw">FaxRegisterRoutingExtension</a> function passes this data to the <i>FaxRoutingInstallationCallback</i> function.
     * @param {PWSTR} MethodName Type: <b>LPWSTR</b>
     * 
     * Pointer to a variable to receive a null-terminated Unicode character string that specifies the internal name of the fax routing method. The string must not exceed 100 characters. For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
     * @param {PWSTR} FriendlyName Type: <b>LPWSTR</b>
     * 
     * Pointer to a variable to receive a null-terminated Unicode character string that specifies the user-friendly name to display for the fax routing method. The string must not exceed 100 characters.
     * @param {PWSTR} FunctionName Type: <b>LPWSTR</b>
     * 
     * Pointer to a variable to receive a null-terminated Unicode character string. The string contains the name of the exported function that executes the specified fax routing procedure. The string must not exceed 100 characters.
     * @param {PWSTR} Guid Type: <b>LPWSTR</b>
     * 
     * Pointer to a variable to receive a null-terminated Unicode character string. The string specifies the GUID that uniquely identifies the fax routing method of interest.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The <i>FaxRoutingInstallationCallback</i> function returns a value of nonzero to indicate that the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/nf-winfax-faxregisterroutingextensionw">FaxRegisterRoutingExtension</a> function should register the fax routing method for the fax routing extension, using the data pointed to by the parameters.
     * 
     * The function returns a value of zero to indicate that there are no more fax routing methods to register, and calls to <i>FaxRoutingInstallationCallback</i> should be terminated.
     */
    Call(FaxHandle, _Context, MethodName, FriendlyName, FunctionName, Guid) {
        MethodName := MethodName is String ? StrPtr(MethodName) : MethodName
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        FunctionName := FunctionName is String ? StrPtr(FunctionName) : FunctionName
        Guid := Guid is String ? StrPtr(Guid) : Guid

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, _ContextMarshal, _Context, "ptr", MethodName, "ptr", FriendlyName, "ptr", FunctionName, "ptr", Guid, BOOL)
        return result
    }

    /**
     * A PFAX_ROUTING_INSTALLATION_CALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_ROUTING_INSTALLATION_CALLBACKW {
        /**
         * Creates a PFAX_ROUTING_INSTALLATION_CALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", PWSTR, PWSTR, PWSTR, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", PWSTR, PWSTR, PWSTR, PWSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
