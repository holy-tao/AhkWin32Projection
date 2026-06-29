#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ACTIVATEOPTIONS.ahk" { ACTIVATEOPTIONS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellItemArray.ahk" { IShellItemArray }

/**
 * Provides methods which activate Windows Store apps for the Launch, File, and Protocol extensions. You will normally use this interface in debuggers and design tools.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface yourself. Windows provides an implementation as part of the CApplicationActivationManager class. To get an instance of this class, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with the CLSID_ApplicationActivationManager class ID.
 * 
 * <h3><a id="Usage_notes"></a><a id="usage_notes"></a><a id="USAGE_NOTES"></a>Usage notes</h3>
 * An <b>IApplicationActivationManager</b> object creates a thread in its host process to serve any activated event arguments objects (<a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs">LaunchActivatedEventArgs</a>, <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs">FileActivatedEventArgs</a>, and <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolactivatedeventargs">ProtocolActivatedEventArgs</a>) that are passed to the app. If the calling process is long-lived, you can create this object in-proc, based on the assumption that the event arguments will exist long enough for the target app to use them. However, if the calling process is spawned only to launch the target app, it should create the <b>IApplicationActivationManager</b> object out-of-process, by using CLSCTX_LOCAL_SERVER. This causes the object to be created in a Dllhost.exe instance that automatically manages the object's lifetime based on outstanding references to the activated event argument objects.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationactivationmanager
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IApplicationActivationManager extends IUnknown {
    /**
     * The interface identifier for IApplicationActivationManager
     * @type {Guid}
     */
    static IID := Guid("{2e941141-7f97-4756-ba1d-9decde894a3d}")

    /**
     * The class identifier for ApplicationActivationManager
     * @type {Guid}
     */
    static CLSID := Guid("{45ba127d-10a8-46ea-8ab7-56ea9078943c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApplicationActivationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ActivateApplication : IntPtr
        ActivateForFile     : IntPtr
        ActivateForProtocol : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApplicationActivationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Activates the specified Windows Store app for the generic launch contract (Windows.Launch) in the current session.
     * @param {PWSTR} appUserModelId The application user model ID of the Windows Store app.
     * @param {PWSTR} arguments A pointer to an optional, app-specific, argument string.
     * @param {ACTIVATEOPTIONS} options One or more of the following flags used to support design mode, debugging, and testing scenarios.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the process ID of the app instance that fulfills this contract.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationactivationmanager-activateapplication
     */
    ActivateApplication(appUserModelId, arguments, options) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        arguments := arguments is String ? StrPtr(arguments) : arguments

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", arguments, ACTIVATEOPTIONS, options, "uint*", &processId := 0, "HRESULT")
        return processId
    }

    /**
     * Activates the specified Windows Store app for the file contract (Windows.File).
     * @param {PWSTR} appUserModelId The application user model ID of the Windows Store app.
     * @param {IShellItemArray} itemArray A pointer to an array of Shell items, each representing a file. This value is converted to a <a href="https://docs.microsoft.com/cpp/cppcx/platform-collections-vectorview-class?view=vs-2019&preserve-view=true">VectorView</a> of <a href="https://docs.microsoft.com/uwp/api/windows.storage.istorageitem">StorageItem</a> objects that is passed to the app through <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs">FileActivatedEventArgs</a>.
     * @param {PWSTR} verb The verb being applied to the file or files specified by <i>itemArray</i>.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the process ID of the app instance that fulfills this contract.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationactivationmanager-activateforfile
     */
    ActivateForFile(appUserModelId, itemArray, verb) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        verb := verb is String ? StrPtr(verb) : verb

        result := ComCall(4, this, "ptr", appUserModelId, "ptr", itemArray, "ptr", verb, "uint*", &processId := 0, "HRESULT")
        return processId
    }

    /**
     * Activates the specified Windows Store app for the protocol contract (Windows.Protocol).
     * @param {PWSTR} appUserModelId The application user model ID of the Windows Store app.
     * @param {IShellItemArray} itemArray A pointer to an array of a single Shell item. The first item in the array is converted into a Uri object that is passed to the app through <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolactivatedeventargs">ProtocolActivatedEventArgs</a>. Any items in the array except for the first element are ignored.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the process ID of the app instance that fulfills this contract.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationactivationmanager-activateforprotocol
     */
    ActivateForProtocol(appUserModelId, itemArray) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId

        result := ComCall(5, this, "ptr", appUserModelId, "ptr", itemArray, "uint*", &processId := 0, "HRESULT")
        return processId
    }

    Query(iid) {
        if (IApplicationActivationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ActivateApplication := CallbackCreate(GetMethod(implObj, "ActivateApplication"), flags, 5)
        this.vtbl.ActivateForFile := CallbackCreate(GetMethod(implObj, "ActivateForFile"), flags, 5)
        this.vtbl.ActivateForProtocol := CallbackCreate(GetMethod(implObj, "ActivateForProtocol"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ActivateApplication)
        CallbackFree(this.vtbl.ActivateForFile)
        CallbackFree(this.vtbl.ActivateForProtocol)
    }
}
