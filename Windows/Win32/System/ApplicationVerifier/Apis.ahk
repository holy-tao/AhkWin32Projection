#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class ApplicationVerifier {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static AVRF_MAX_TRACES => 32
;@endregion Constants

;@region Methods
    /**
     * Enumerates operating system resources for use by debugging and support tools.
     * @param {HANDLE} Process A handle to the process in which resources are being enumerated.
     * 
     * When the <i>ResourceType</i> parameter is AvrfResrouceHeapAllocation, the handle must be opened with the PROCESS_VM_READ and PROCESS_QUERY_INFORMATION access rights.
     * 
     * If <i>ResourceType</i> is AvrfResrouceHeapAllocation and the <i>Flags</i> parameter contains AVRF_ENUM_RESOURCES_FLAGS_SUSPEND, the PROCESS_SUSPEND_RESUME flag must be used as well.
     * @param {Integer} Flags If <i>ResourceType</i> is AvrfResourceHandleTrace, no flags are defined and the value for the Flags parameter must be 0.
     * @param {Integer} ResourceType 
     * @param {Pointer<AVRF_RESOURCE_ENUMERATE_CALLBACK>} ResourceCallback An application-defined function that is invoked by the API.
     * 
     * The prototype is agnostic toward the type of resource being enumerated. The use will pass a prototype suitable for the type of enumeration being performed
     * @param {Pointer<Void>} EnumerationContext An application-specific pointer that is passed back to the callback function.
     * @returns {Integer} This function returns one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrfsdk/nf-avrfsdk-verifierenumerateresource
     */
    static VerifierEnumerateResource(Process, Flags, ResourceType, ResourceCallback, EnumerationContext) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        EnumerationContextMarshal := EnumerationContext is VarRef ? "ptr" : "ptr"

        result := DllCall("verifier.dll\VerifierEnumerateResource", "ptr", Process, "uint", Flags, "uint", ResourceType, "ptr", ResourceCallback, EnumerationContextMarshal, EnumerationContext, "uint")
        return result
    }

;@endregion Methods
}
