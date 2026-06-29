#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_Result.ahk" { MI_Result }
#Import ".\MI_Application.ahk" { MI_Application }

/**
 * @namespace Windows.Win32.System.Wmi
 */

;@region Functions
/**
 * Initializes an application so that it can make Management Infrastructure (MI) client API calls.
 * @remarks
 * This API needs to be called only once per application; although, it can be called multiple times safely. 
 *     Calling this API multiple times will result in a small amount of extra memory usage.  When called, the application 
 *     passes in an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_application">MI_Application</a> pointer to be initialized. 
 *     This pointer must be closed by calling 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_close">MI_Application_Close</a>. Not doing so will cause 
 *     memory leaks and potential crashes during shutdown.
 * 
 * MI.h defines 
 *      <b>MI_Application_Initialize</b> as 
 *    <b>MI_Application_InitializeV1</b> with this 
 *      line:
 * 
 * <c>#define MI_Application_Initialize MI_Application_InitializeV1</c>
 * @param {Integer} flags Must be 0.
 * @param {Pointer<Integer>} applicationID An optional string (usually <b>GUID</b> in string format) to represent a client 
 *     application. This string may be used for application specific configuration and application specific 
 *   logging.
 * @param {Pointer<Pointer<MI_Instance>>} extendedError Optional parameter giving more error information if the operation failed. If an instance is returned, 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_delete">MI_Instance_Delete</a> must  be called to free it 
 *       when it is no longer needed.
 * @param {Pointer<MI_Application>} _application A pointer to an uninitialized <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_application">MI_Application</a> 
 *       handle is passed in and a populated handle is returned. The initialized handle must be passed to 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_close">MI_Application_Close</a> before the application 
 *   shuts down. If an application passes this handle, pass it by value rather than as a pointer.
 * @returns {MI_Result} This function returns MI_Result MI_MAIN_CALL.
 * @see https://learn.microsoft.com/windows/win32/api/mi/nf-mi-mi_application_initializev1
 * @since windows8.0
 */
export MI_Application_InitializeV1(flags, applicationID, extendedError, _application) {
    applicationIDMarshal := applicationID is VarRef ? "ushort*" : "ptr"
    extendedErrorMarshal := extendedError is VarRef ? "ptr*" : "ptr"

    result := DllCall("mi.dll\MI_Application_InitializeV1", "uint", flags, applicationIDMarshal, applicationID, extendedErrorMarshal, extendedError, MI_Application.Ptr, _application, MI_Result)
    return result
}

;@endregion Functions
