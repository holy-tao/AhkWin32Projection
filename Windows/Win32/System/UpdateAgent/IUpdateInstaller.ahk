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
     * Gets and sets the current client application.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the current client application.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates whether to forcibly install or uninstall an update.
     * @remarks
     * 
     * A forced installation is an installation in which an update is installed even if the metadata indicates that the update is already installed.  A forced uninstallation is an uninstallation in which an update is removed even if the metadata indicates that the update is not installed.
     * 
     * Before you use <b>IsForced</b> to force an installation, determine whether the update is installed and available. If an update is not  installed, a forced installation fails. For example, an update can be downloaded, and then its corresponding files removed from the cache after the expiration limit.   In this case, if the files are not installed, a forced installation of the update  fails.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_isforced
     */
    get_IsForced() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets or sets a Boolean value that indicates whether to forcibly install or uninstall an update.
     * @remarks
     * 
     * A forced installation is an installation in which an update is installed even if the metadata indicates that the update is already installed.  A forced uninstallation is an uninstallation in which an update is removed even if the metadata indicates that the update is not installed.
     * 
     * Before you use <b>IsForced</b> to force an installation, determine whether the update is installed and available. If an update is not  installed, a forced installation fails. For example, an update can be downloaded, and then its corresponding files removed from the cache after the expiration limit.   In this case, if the files are not installed, a forced installation of the update  fails.
     * 
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-put_isforced
     */
    put_IsForced(value) {
        result := ComCall(10, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a handle to the parent window that can contain a dialog box.
     * @remarks
     * 
     * This property can be changed only by a user on the computer. This property cannot be accessed by using the <b>IDispatch</b> interface.
     * 
     * 
     * @returns {HWND} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_parenthwnd
     */
    get_ParentHwnd() {
        retval := HWND()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a handle to the parent window that can contain a dialog box.
     * @remarks
     * 
     * This property can be changed only by a user on the computer. This property cannot be accessed by using the <b>IDispatch</b> interface.
     * 
     * 
     * @param {HWND} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-put_parenthwnd
     */
    put_ParentHwnd(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the interface that represents the parent window that can contain a dialog box.
     * @remarks
     * 
     * This property can be changed only by a user on the computer. This property can be accessed by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * 
     * 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-put_parentwindow
     */
    put_ParentWindow(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the interface that represents the parent window that can contain a dialog box.
     * @remarks
     * 
     * This property can be changed only by a user on the computer. This property can be accessed by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for installation or uninstallation.
     * @returns {IUpdateCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_updates
     */
    get_Updates() {
        result := ComCall(15, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for installation or uninstallation.
     * @param {IUpdateCollection} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-put_updates
     */
    put_Updates(value) {
        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Starts an asynchronous installation of the updates.
     * @param {IUnknown} onProgressChanged An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback">IInstallationProgressChangedCallback</a> interface that is called periodically for installation progress changes before the installation is complete.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationcompletedcallback">IInstallationCompletedCallback</a> interface that is called when an installation operation is complete.
     * @param {VARIANT} state The caller-specific state that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface.
     * @returns {IInstallationJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that contains the properties and methods that are available to an asynchronous installation operation that was initiated.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-begininstall
     */
    BeginInstall(onProgressChanged, onCompleted, state) {
        result := ComCall(17, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return IInstallationJob(retval)
    }

    /**
     * Starts an asynchronous uninstallation of the updates.
     * @param {IUnknown} onProgressChanged An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback">IInstallationProgressChangedCallback</a> interface that is called periodically for uninstallation progress changes before before the uninstallation is complete.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationcompletedcallback">IInstallationCompletedCallback</a> interface that is called when an installation operation is complete.
     * @param {VARIANT} state The caller-specific state that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate">AsyncState</a> property <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface returns.
     * @returns {IInstallationJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that  contains the properties and methods that are available to an asynchronous uninstall operation that was initiated.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-beginuninstall
     */
    BeginUninstall(onProgressChanged, onCompleted, state) {
        result := ComCall(18, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return IInstallationJob(retval)
    }

    /**
     * Completes an asynchronous installation of the updates.
     * @param {IInstallationJob} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that is  returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-begininstall">BeginInstall</a> method.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the overall result of the installation operation.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-endinstall
     */
    EndInstall(value) {
        result := ComCall(19, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Completes an asynchronous uninstallation of the updates.
     * @param {IInstallationJob} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface  that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-beginuninstall">BeginUninstall</a> method returns.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the overall result of an uninstallation operation.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-enduninstall
     */
    EndUninstall(value) {
        result := ComCall(20, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Starts a synchronous installation of the updates.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the results of an installation operation for each update that is specified in a request.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-install
     */
    Install() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Starts a wizard that guides the local user through the steps to install the updates.
     * @param {BSTR} dialogTitle An optional string value to be displayed in the title bar of the wizard. 
     * 
     * If an empty string value is used, the following text is displayed: Download and Install Updates.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the results of an installation operation for each update that is specified in the request.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-runwizard
     */
    RunWizard(dialogTitle) {
        dialogTitle := dialogTitle is String ? BSTR.Alloc(dialogTitle).Value : dialogTitle

        result := ComCall(22, this, "ptr", dialogTitle, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Gets a Boolean value that indicates whether an installation or uninstallation is in progress on a computer at a specific time.
     * @remarks
     * 
     * A new installation or uninstallation is processed only when no other installation or uninstallation is in progress. While an installation or uninstallation is in progress, a new installation or uninstallation immediately fails with the <b>WU_E_OPERATIONINPROGRESS</b> error. The <b>IsBusy</b> property does not secure an opportunity for the caller to begin a new installation or uninstallation. If the <b>IsBusy</b> property or a recent installation or uninstallation failure indicates that another installation or uninstallation is already in progress, the caller should attempt the installation or uninstallation later.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_isbusy
     */
    get_IsBusy() {
        result := ComCall(23, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Starts a synchronous uninstallation of the updates.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface  that represents the results of an uninstallation operation for each update that is specified in a request.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-uninstall
     */
    Uninstall() {
        result := ComCall(24, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Gets and sets a Boolean value that indicates whether to show source prompts to the user when installing the updates.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_allowsourceprompts
     */
    get_AllowSourcePrompts() {
        result := ComCall(25, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether to show source prompts to the user when installing the updates.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-put_allowsourceprompts
     */
    put_AllowSourcePrompts(value) {
        result := ComCall(26, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether a system restart is required before installing or uninstalling updates.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateinstaller-get_rebootrequiredbeforeinstallation
     */
    get_RebootRequiredBeforeInstallation() {
        result := ComCall(27, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}
