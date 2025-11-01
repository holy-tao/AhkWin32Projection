#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods which activate Windows Store apps for the Launch, File, and Protocol extensions. You will normally use this interface in debuggers and design tools.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Do not implement this interface yourself. Windows provides an implementation as part of the CApplicationActivationManager class. To get an instance of this class, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with the CLSID_ApplicationActivationManager class ID.
  * 
  * <h3><a id="Usage_notes"></a><a id="usage_notes"></a><a id="USAGE_NOTES"></a>Usage notes</h3>
  * An <b>IApplicationActivationManager</b> object creates a thread in its host process to serve any activated event arguments objects (<a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs">LaunchActivatedEventArgs</a>, <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs">FileActivatedEventArgs</a>, and <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolactivatedeventargs">ProtocolActivatedEventArgs</a>) that are passed to the app. If the calling process is long-lived, you can create this object in-proc, based on the assumption that the event arguments will exist long enough for the target app to use them. However, if the calling process is spawned only to launch the target app, it should create the <b>IApplicationActivationManager</b> object out-of-process, by using CLSCTX_LOCAL_SERVER. This causes the object to be created in a Dllhost.exe instance that automatically manages the object's lifetime based on outstanding references to the activated event argument objects.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iapplicationactivationmanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationActivationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationActivationManager
     * @type {Guid}
     */
    static IID => Guid("{2e941141-7f97-4756-ba1d-9decde894a3d}")

    /**
     * The class identifier for ApplicationActivationManager
     * @type {Guid}
     */
    static CLSID => Guid("{45ba127d-10a8-46ea-8ab7-56ea9078943c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateApplication", "ActivateForFile", "ActivateForProtocol"]

    /**
     * 
     * @param {PWSTR} appUserModelId 
     * @param {PWSTR} arguments 
     * @param {Integer} options 
     * @param {Pointer<Integer>} processId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationactivationmanager-activateapplication
     */
    ActivateApplication(appUserModelId, arguments, options, processId) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        arguments := arguments is String ? StrPtr(arguments) : arguments

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", arguments, "int", options, "uint*", processId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} appUserModelId 
     * @param {IShellItemArray} itemArray 
     * @param {PWSTR} verb 
     * @param {Pointer<Integer>} processId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationactivationmanager-activateforfile
     */
    ActivateForFile(appUserModelId, itemArray, verb, processId) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        verb := verb is String ? StrPtr(verb) : verb

        result := ComCall(4, this, "ptr", appUserModelId, "ptr", itemArray, "ptr", verb, "uint*", processId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} appUserModelId 
     * @param {IShellItemArray} itemArray 
     * @param {Pointer<Integer>} processId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationactivationmanager-activateforprotocol
     */
    ActivateForProtocol(appUserModelId, itemArray, processId) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId

        result := ComCall(5, this, "ptr", appUserModelId, "ptr", itemArray, "uint*", processId, "HRESULT")
        return result
    }
}
