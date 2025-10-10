#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Context structure. Use the functions with the name prefix &quot;MI_Context_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_contextft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ContextFT extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * Providers call this function to post a return code to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postresult">MI_Context_PostResult</a>.
     * @type {Pointer}
     */
    PostResult {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Providers call this function to post an instance to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postinstance">MI_Context_PostInstance</a>.
     * @type {Pointer}
     */
    PostInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Posts an indication to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postindication">MI_Context_PostIndication</a>.
     * @type {Pointer}
     */
    PostIndication {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_constructinstance">MI_Context_ConstructInstance</a>.
     * @type {Pointer}
     */
    ConstructInstance {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initialize a parameters instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_constructparameters">MI_Context_ConstructParameters</a>.
     * @type {Pointer}
     */
    ConstructParameters {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Creates a new instance of the class given by the classDecl parameter. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_newinstance">MI_Context_NewInstance</a>.
     * @type {Pointer}
     */
    NewInstance {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Creates a new dynamic instance of the class whose name is given by className. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_newdynamicinstance">MI_Context_NewDynamicInstance</a>.
     * @type {Pointer}
     */
    NewDynamicInstance {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Creates a new instance of the method given by methodDecl. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_newparameters">MI_Context_NewParameters</a>.
     * @type {Pointer}
     */
    NewParameters {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Determines whether the operation has been canceled. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_canceled">MI_Context_Canceled</a>.
     * @type {Pointer}
     */
    Canceled {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Returns the locale of the given type. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getlocale">MI_Context_GetLocale</a>.
     * @type {Pointer}
     */
    GetLocale {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Registers a callback that is invoked when the operation is canceled. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_registercancel">MI_Context_RegisterCancel</a>.
     * @type {Pointer}
     */
    RegisterCancel {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Requests to unload the module or the provider (depending on the location of invocation). See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_requestunload">MI_Context_RequestUnload</a>.
     * @type {Pointer}
     */
    RequestUnload {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Tells the provider infrastructure to not unload the provider. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_refuseunload">MI_Context_RefuseUnload</a>.
     * @type {Pointer}
     */
    RefuseUnload {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Gets the local session allowing the provider to communicate with the CIM server. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getlocalsession">MI_Context_GetLocalSession</a>.
     * @type {Pointer}
     */
    GetLocalSession {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Sets a context-specific option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_setstringoption">MI_Context_SetStringOption</a>.
     * @type {Pointer}
     */
    SetStringOption {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Gets the specified provider custom option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getstringoption">MI_Context_GetStringOption</a>.
     * @type {Pointer}
     */
    GetStringOption {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Gets the specified provider custom option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getnumberoption">MI_Context_GetNumberOption</a>.
     * @type {Pointer}
     */
    GetNumberOption {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Gets the specified provider custom option. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getcustomoption">MI_Context_GetCustomOption</a>.
     * @type {Pointer}
     */
    GetCustomOption {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Gets the count of defined provider custom options. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getcustomoptioncount">MI_Context_GetCustomOptionCount</a>.
     * @type {Pointer}
     */
    GetCustomOptionCount {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Gets the provider's custom option at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_getcustomoptionat">MI_Context_GetCustomOptionAt</a>.
     * @type {Pointer}
     */
    GetCustomOptionAt {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Sends an operational message to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writemessage">MI_Context_WriteMessage</a>.
     * @type {Pointer}
     */
    WriteMessage {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * Sends a progress message to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writeprogress">MI_Context_WriteProgress</a>.
     * @type {Pointer}
     */
    WriteProgress {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Sends streamed parameter data to the requestor. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writestreamparameter">MI_Context_WriteStreamParameter</a>.
     * @type {Pointer}
     */
    WriteStreamParameter {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Sends a CIM error instance to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writecimerror">MI_Context_WriteCimError</a>.
     * @type {Pointer}
     */
    WriteCimError {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * Sends a prompt message to the client querying whether to continue the operation or cancel it. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_promptuser">MI_Context_PromptUser</a>.
     * @type {Pointer}
     */
    PromptUser {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * Queries the client to determine if an operation should continue. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_shouldprocess">MI_Context_ShouldProcess</a>.
     * @type {Pointer}
     */
    ShouldProcess {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Queries the client to determine if an operation should continue. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_shouldcontinue">MI_Context_ShouldContinue</a>.
     * @type {Pointer}
     */
    ShouldContinue {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * Providers call this function to post a return code to the client in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_posterror">MI_Context_PostError</a>.
     * @type {Pointer}
     */
    PostError {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * Posts a return code and an error message to the server in response to a request. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_postcimerror">MI_Context_PostCimError</a>.
     * @type {Pointer}
     */
    PostCimError {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * This function has been deprecated. Use 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writeerror">MI_Context_WriteError</a> instead.
     * 
     * Sends an error code and error message to the client. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_writeerror">MI_Context_WriteError</a>.
     * @type {Pointer}
     */
    WriteError {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }
}
