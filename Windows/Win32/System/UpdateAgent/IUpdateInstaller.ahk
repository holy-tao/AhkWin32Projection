#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IUpdateCollection.ahk
#Include .\IInstallationJob.ahk
#Include .\IInstallationResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Installs or uninstalls updates from or onto a computer.
 * @remarks
 * 
 * This interface can be instantiated by using the UpdateInstaller coclass. Use the Microsoft.Update.Installer program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateinstaller
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateInstaller extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstaller
     * @type {Guid}
     */
    static IID => Guid("{7b929c68-ccdc-4226-96b1-8724600b54c2}")

    /**
     * The class identifier for UpdateInstaller
     * @type {Guid}
     */
    static CLSID => Guid("{d2e0fe7f-d23e-48e1-93c0-6fa8cc346474}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClientApplicationID", "put_ClientApplicationID", "get_IsForced", "put_IsForced", "get_ParentHwnd", "put_ParentHwnd", "put_ParentWindow", "get_ParentWindow", "get_Updates", "put_Updates", "BeginInstall", "BeginUninstall", "EndInstall", "EndUninstall", "Install", "RunWizard", "get_IsBusy", "Uninstall", "get_AllowSourcePrompts", "put_AllowSourcePrompts", "get_RebootRequiredBeforeInstallation"]

    /**
     * @type {BSTR} 
     */
    ClientApplicationID {
        get => this.get_ClientApplicationID()
        set => this.put_ClientApplicationID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsForced {
        get => this.get_IsForced()
        set => this.put_IsForced(value)
    }

    /**
     * @type {HWND} 
     */
    ParentHwnd {
        get => this.get_ParentHwnd()
        set => this.put_ParentHwnd(value)
    }

    /**
     * @type {IUnknown} 
     */
    ParentWindow {
        get => this.get_ParentWindow()
        set => this.put_ParentWindow(value)
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
        set => this.put_Updates(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsBusy {
        get => this.get_IsBusy()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowSourcePrompts {
        get => this.get_AllowSourcePrompts()
        set => this.put_AllowSourcePrompts(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RebootRequiredBeforeInstallation {
        get => this.get_RebootRequiredBeforeInstallation()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_isforced
     */
    get_IsForced() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_isforced
     */
    put_IsForced(value) {
        result := ComCall(10, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_parenthwnd
     */
    get_ParentHwnd() {
        retval := HWND()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {HWND} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_parenthwnd
     */
    put_ParentHwnd(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_parentwindow
     */
    put_ParentWindow(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_updates
     */
    get_Updates() {
        result := ComCall(15, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * 
     * @param {IUpdateCollection} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_updates
     */
    put_Updates(value) {
        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} onProgressChanged 
     * @param {IUnknown} onCompleted 
     * @param {VARIANT} state 
     * @returns {IInstallationJob} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-begininstall
     */
    BeginInstall(onProgressChanged, onCompleted, state) {
        result := ComCall(17, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return IInstallationJob(retval)
    }

    /**
     * 
     * @param {IUnknown} onProgressChanged 
     * @param {IUnknown} onCompleted 
     * @param {VARIANT} state 
     * @returns {IInstallationJob} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-beginuninstall
     */
    BeginUninstall(onProgressChanged, onCompleted, state) {
        result := ComCall(18, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return IInstallationJob(retval)
    }

    /**
     * 
     * @param {IInstallationJob} value 
     * @returns {IInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-endinstall
     */
    EndInstall(value) {
        result := ComCall(19, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * 
     * @param {IInstallationJob} value 
     * @returns {IInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-enduninstall
     */
    EndUninstall(value) {
        result := ComCall(20, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * 
     * @returns {IInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-install
     */
    Install() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * 
     * @param {BSTR} dialogTitle 
     * @returns {IInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-runwizard
     */
    RunWizard(dialogTitle) {
        dialogTitle := dialogTitle is String ? BSTR.Alloc(dialogTitle).Value : dialogTitle

        result := ComCall(22, this, "ptr", dialogTitle, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_isbusy
     */
    get_IsBusy() {
        result := ComCall(23, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-uninstall
     */
    Uninstall() {
        result := ComCall(24, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_allowsourceprompts
     */
    get_AllowSourcePrompts() {
        result := ComCall(25, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_allowsourceprompts
     */
    put_AllowSourcePrompts(value) {
        result := ComCall(26, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_rebootrequiredbeforeinstallation
     */
    get_RebootRequiredBeforeInstallation() {
        result := ComCall(27, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}
