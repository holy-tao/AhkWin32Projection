#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\VERIFIER_ENUM_RESOURCE_FLAGS.ahk" { VERIFIER_ENUM_RESOURCE_FLAGS }

/**
 * @namespace Windows.Win32.System.ApplicationVerifier
 */

;@region Functions
/**
 * Enumerates operating system resources for use by debugging and support tools.
 * @remarks
 * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Verifier.dll.
 * @param {HANDLE} Process A handle to the process in which resources are being enumerated.
 * 
 * When the <i>ResourceType</i> parameter is AvrfResrouceHeapAllocation, the handle must be opened with the PROCESS_VM_READ and PROCESS_QUERY_INFORMATION access rights.
 * 
 * If <i>ResourceType</i> is AvrfResrouceHeapAllocation and the <i>Flags</i> parameter contains AVRF_ENUM_RESOURCES_FLAGS_SUSPEND, the PROCESS_SUSPEND_RESUME flag must be used as well.
 * @param {VERIFIER_ENUM_RESOURCE_FLAGS} Flags If <i>ResourceType</i> is AvrfResourceHandleTrace, no flags are defined and the value for the Flags parameter must be 0.
 * @param {Integer} _ResourceType 
 * @param {Pointer<AVRF_RESOURCE_ENUMERATE_CALLBACK>} ResourceCallback An application-defined function that is invoked by the API.
 * 
 * The prototype is agnostic toward the type of resource being enumerated. The use will pass a prototype suitable for the type of enumeration being performed
 * @param {Pointer<Void>} EnumerationContext An application-specific pointer that is passed back to the callback function.
 * @returns {Integer} This function returns one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/nf-avrfsdk-verifierenumerateresource
 */
export VerifierEnumerateResource(Process, Flags, _ResourceType, ResourceCallback, EnumerationContext) {
    EnumerationContextMarshal := EnumerationContext is VarRef ? "ptr" : "ptr"

    result := DllCall("verifier.dll\VerifierEnumerateResource", HANDLE, Process, VERIFIER_ENUM_RESOURCE_FLAGS, Flags, "uint", _ResourceType, "ptr", ResourceCallback, EnumerationContextMarshal, EnumerationContext, UInt32)
    return result
}

;@endregion Functions
