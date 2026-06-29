#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Context structure. Use the functions with the name prefix &quot;MI_Context_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_contextft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ContextFT {
    #StructPack 8

    /**
     * Providers call this function to post a return code to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postresult">MI_Context_PostResult</a>.
     */
    PostResult : IntPtr

    /**
     * Providers call this function to post an instance to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postinstance">MI_Context_PostInstance</a>.
     */
    PostInstance : IntPtr

    /**
     * Posts an indication to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postindication">MI_Context_PostIndication</a>.
     */
    PostIndication : IntPtr

    /**
     * Initializes an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_constructinstance">MI_Context_ConstructInstance</a>.
     */
    ConstructInstance : IntPtr

    /**
     * Initialize a parameters instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_constructparameters">MI_Context_ConstructParameters</a>.
     */
    ConstructParameters : IntPtr

    /**
     * Creates a new instance of the class given by the classDecl parameter. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_newinstance">MI_Context_NewInstance</a>.
     */
    NewInstance : IntPtr

    /**
     * Creates a new dynamic instance of the class whose name is given by className. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_newdynamicinstance">MI_Context_NewDynamicInstance</a>.
     */
    NewDynamicInstance : IntPtr

    /**
     * Creates a new instance of the method given by methodDecl. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_newparameters">MI_Context_NewParameters</a>.
     */
    NewParameters : IntPtr

    /**
     * Determines whether the operation has been canceled. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_canceled">MI_Context_Canceled</a>.
     */
    Canceled : IntPtr

    /**
     * Returns the locale of the given type. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getlocale">MI_Context_GetLocale</a>.
     */
    GetLocale : IntPtr

    /**
     * Registers a callback that is invoked when the operation is canceled. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_registercancel">MI_Context_RegisterCancel</a>.
     */
    RegisterCancel : IntPtr

    /**
     * Requests to unload the module or the provider (depending on the location of invocation). See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_requestunload">MI_Context_RequestUnload</a>.
     */
    RequestUnload : IntPtr

    /**
     * Tells the provider infrastructure to not unload the provider. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_refuseunload">MI_Context_RefuseUnload</a>.
     */
    RefuseUnload : IntPtr

    /**
     * Gets the local session allowing the provider to communicate with the CIM server. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getlocalsession">MI_Context_GetLocalSession</a>.
     */
    GetLocalSession : IntPtr

    /**
     * Sets a context-specific option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_setstringoption">MI_Context_SetStringOption</a>.
     */
    SetStringOption : IntPtr

    /**
     * Gets the specified provider custom option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getstringoption">MI_Context_GetStringOption</a>.
     */
    GetStringOption : IntPtr

    /**
     * Gets the specified provider custom option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getnumberoption">MI_Context_GetNumberOption</a>.
     */
    GetNumberOption : IntPtr

    /**
     * Gets the specified provider custom option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getcustomoption">MI_Context_GetCustomOption</a>.
     */
    GetCustomOption : IntPtr

    /**
     * Gets the count of defined provider custom options. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getcustomoptioncount">MI_Context_GetCustomOptionCount</a>.
     */
    GetCustomOptionCount : IntPtr

    /**
     * Gets the provider's custom option at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getcustomoptionat">MI_Context_GetCustomOptionAt</a>.
     */
    GetCustomOptionAt : IntPtr

    /**
     * Sends an operational message to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writemessage">MI_Context_WriteMessage</a>.
     */
    WriteMessage : IntPtr

    /**
     * Sends a progress message to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writeprogress">MI_Context_WriteProgress</a>.
     */
    WriteProgress : IntPtr

    /**
     * Sends streamed parameter data to the requestor. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writestreamparameter">MI_Context_WriteStreamParameter</a>.
     */
    WriteStreamParameter : IntPtr

    /**
     * Sends a CIM error instance to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writecimerror">MI_Context_WriteCimError</a>.
     */
    WriteCimError : IntPtr

    /**
     * Sends a prompt message to the client querying whether to continue the operation or cancel it. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_promptuser">MI_Context_PromptUser</a>.
     */
    PromptUser : IntPtr

    /**
     * Queries the client to determine if an operation should continue. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_shouldprocess">MI_Context_ShouldProcess</a>.
     */
    ShouldProcess : IntPtr

    /**
     * Queries the client to determine if an operation should continue. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_shouldcontinue">MI_Context_ShouldContinue</a>.
     */
    ShouldContinue : IntPtr

    /**
     * Providers call this function to post a return code to the client in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_posterror">MI_Context_PostError</a>.
     */
    PostError : IntPtr

    /**
     * Posts a return code and an error message to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postcimerror">MI_Context_PostCimError</a>.
     */
    PostCimError : IntPtr

    /**
     * This function has been deprecated. Use 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writeerror">MI_Context_WriteError</a> instead.
     * 
     * Sends an error code and error message to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writeerror">MI_Context_WriteError</a>.
     */
    WriteError : IntPtr

}
