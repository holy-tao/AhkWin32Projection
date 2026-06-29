#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInstallationJob.ahk" { IInstallationJob }
#Import ".\IInstallationResult.ahk" { IInstallationResult }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUpdateCollection.ahk" { IUpdateCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Installs or uninstalls updates from or onto a computer.
 * @remarks
 * This interface can be instantiated by using the UpdateInstaller coclass. Use the Microsoft.Update.Installer program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateinstaller
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateInstaller extends IDispatch {
    /**
     * The interface identifier for IUpdateInstaller
     * @type {Guid}
     */
    static IID := Guid("{7b929c68-ccdc-4226-96b1-8724600b54c2}")

    /**
     * The class identifier for UpdateInstaller
     * @type {Guid}
     */
    static CLSID := Guid("{d2e0fe7f-d23e-48e1-93c0-6fa8cc346474}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateInstaller interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ClientApplicationID              : IntPtr
        put_ClientApplicationID              : IntPtr
        get_IsForced                         : IntPtr
        put_IsForced                         : IntPtr
        get_ParentHwnd                       : IntPtr
        put_ParentHwnd                       : IntPtr
        put_ParentWindow                     : IntPtr
        get_ParentWindow                     : IntPtr
        get_Updates                          : IntPtr
        put_Updates                          : IntPtr
        BeginInstall                         : IntPtr
        BeginUninstall                       : IntPtr
        EndInstall                           : IntPtr
        EndUninstall                         : IntPtr
        Install                              : IntPtr
        RunWizard                            : IntPtr
        get_IsBusy                           : IntPtr
        Uninstall                            : IntPtr
        get_AllowSourcePrompts               : IntPtr
        put_AllowSourcePrompts               : IntPtr
        get_RebootRequiredBeforeInstallation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateInstaller.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Gets and sets the current client application. (IUpdateInstaller.get_ClientApplicationID)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the current client application. (IUpdateInstaller.put_ClientApplicationID)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates whether to forcibly install or uninstall an update. (Get)
     * @remarks
     * A forced installation is an installation in which an update is installed even if the metadata indicates that the update is already installed.  A forced uninstallation is an uninstallation in which an update is removed even if the metadata indicates that the update is not installed.
     * 
     * Before you use <b>IsForced</b> to force an installation, determine whether the update is installed and available. If an update is not  installed, a forced installation fails. For example, an update can be downloaded, and then its corresponding files removed from the cache after the expiration limit.   In this case, if the files are not installed, a forced installation of the update  fails.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_isforced
     */
    get_IsForced() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets or sets a Boolean value that indicates whether to forcibly install or uninstall an update. (Put)
     * @remarks
     * A forced installation is an installation in which an update is installed even if the metadata indicates that the update is already installed.  A forced uninstallation is an uninstallation in which an update is removed even if the metadata indicates that the update is not installed.
     * 
     * Before you use <b>IsForced</b> to force an installation, determine whether the update is installed and available. If an update is not  installed, a forced installation fails. For example, an update can be downloaded, and then its corresponding files removed from the cache after the expiration limit.   In this case, if the files are not installed, a forced installation of the update  fails.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_isforced
     */
    put_IsForced(value) {
        result := ComCall(10, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a handle to the parent window that can contain a dialog box. (Get)
     * @remarks
     * This property can be changed only by a user on the computer. This property cannot be accessed by using the <b>IDispatch</b> interface.
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_parenthwnd
     */
    get_ParentHwnd() {
        retval := HWND()
        result := ComCall(11, this, HWND.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a handle to the parent window that can contain a dialog box. (Put)
     * @remarks
     * This property can be changed only by a user on the computer. This property cannot be accessed by using the <b>IDispatch</b> interface.
     * @param {HWND} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_parenthwnd
     */
    put_ParentHwnd(value) {
        result := ComCall(12, this, HWND, value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the interface that represents the parent window that can contain a dialog box. (Put)
     * @remarks
     * This property can be changed only by a user on the computer. This property can be accessed by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_parentwindow
     */
    put_ParentWindow(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the interface that represents the parent window that can contain a dialog box. (Get)
     * @remarks
     * This property can be changed only by a user on the computer. This property can be accessed by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for installation or uninstallation. (Get)
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_updates
     */
    get_Updates() {
        result := ComCall(15, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for installation or uninstallation. (Put)
     * @param {IUpdateCollection} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_updates
     */
    put_Updates(value) {
        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Starts an asynchronous installation of the updates.
     * @remarks
     * If you call this method from a scripting language, set the <i>onProgressChanged</i> parameter to the identifier of  an Automation object with a dispatch identifier (DSIPID) of zero (0) that implements the callback routine. Do the same thing for the <i>onCompleted</i> parameter.
     * 
     * This method returns WU_E_NO_UPDATE if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_updates">Updates</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> is not set. This method also returns WU_E_NO_UPDATE if the  <b>Updates</b> property is set to an empty collection.
     * 
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {IUnknown} onProgressChanged An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback">IInstallationProgressChangedCallback</a> interface that is called periodically for installation progress changes before the installation is complete.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationcompletedcallback">IInstallationCompletedCallback</a> interface that is called when an installation operation is complete.
     * @param {VARIANT} state The caller-specific state that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface.
     * @returns {IInstallationJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that contains the properties and methods that are available to an asynchronous installation operation that was initiated.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-begininstall
     */
    BeginInstall(onProgressChanged, onCompleted, state) {
        result := ComCall(17, this, "ptr", onProgressChanged, "ptr", onCompleted, VARIANT, state, "ptr*", &retval := 0, "HRESULT")
        return IInstallationJob(retval)
    }

    /**
     * Starts an asynchronous uninstallation of the updates.
     * @remarks
     * If you call this method from a scripting language, set the <i>onProgressChanged</i> parameter to the identifier of  an Automation object with a dispatch identifier (DSIPID) of zero (0) that implements the callback routine. Do the same thing for the <i>onCompleted</i> parameter.
     * 
     * This method returns WU_E_NO_UPDATE if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_updates">Updates</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> is not set. This method also returns WU_E_NO_UPDATE if the  <b>Updates</b> property is set to an empty collection.
     * 
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {IUnknown} onProgressChanged An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback">IInstallationProgressChangedCallback</a> interface that is called periodically for uninstallation progress changes before before the uninstallation is complete.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationcompletedcallback">IInstallationCompletedCallback</a> interface that is called when an installation operation is complete.
     * @param {VARIANT} state The caller-specific state that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate">AsyncState</a> property <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface returns.
     * @returns {IInstallationJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that  contains the properties and methods that are available to an asynchronous uninstall operation that was initiated.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-beginuninstall
     */
    BeginUninstall(onProgressChanged, onCompleted, state) {
        result := ComCall(18, this, "ptr", onProgressChanged, "ptr", onCompleted, VARIANT, state, "ptr*", &retval := 0, "HRESULT")
        return IInstallationJob(retval)
    }

    /**
     * Completes an asynchronous installation of the updates.
     * @remarks
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {IInstallationJob} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that is  returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-begininstall">BeginInstall</a> method.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the overall result of the installation operation.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-endinstall
     */
    EndInstall(value) {
        result := ComCall(19, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Completes an asynchronous uninstallation of the updates.
     * @remarks
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {IInstallationJob} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface  that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-beginuninstall">BeginUninstall</a> method returns.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the overall result of an uninstallation operation.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-enduninstall
     */
    EndUninstall(value) {
        result := ComCall(20, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Starts a synchronous installation of the updates.
     * @remarks
     * This method returns WU_E_NO_UPDATE if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_updates">Updates</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> is not set. This method also returns WU_E_NO_UPDATE if the  <b>Updates</b> property is set to an empty collection.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the results of an installation operation for each update that is specified in a request.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-install
     */
    Install() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Starts a wizard that guides the local user through the steps to install the updates.
     * @remarks
     * This method returns WU_E_NO_UPDATE if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_updates">Updates</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> is not set. This method also returns WU_E_NO_UPDATE if the  <b>Updates</b> property is set to an empty collection.
     * @param {BSTR} dialogTitle An optional string value to be displayed in the title bar of the wizard. 
     * 
     * If an empty string value is used, the following text is displayed: Download and Install Updates.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface that represents the results of an installation operation for each update that is specified in the request.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-runwizard
     */
    RunWizard(dialogTitle) {
        dialogTitle := dialogTitle is String ? BSTR.Alloc(dialogTitle).Value : dialogTitle

        result := ComCall(22, this, BSTR, dialogTitle, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Gets a Boolean value that indicates whether an installation or uninstallation is in progress on a computer at a specific time.
     * @remarks
     * A new installation or uninstallation is processed only when no other installation or uninstallation is in progress. While an installation or uninstallation is in progress, a new installation or uninstallation immediately fails with the <b>WU_E_OPERATIONINPROGRESS</b> error. The <b>IsBusy</b> property does not secure an opportunity for the caller to begin a new installation or uninstallation. If the <b>IsBusy</b> property or a recent installation or uninstallation failure indicates that another installation or uninstallation is already in progress, the caller should attempt the installation or uninstallation later.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_isbusy
     */
    get_IsBusy() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Starts a synchronous uninstallation of the updates.
     * @remarks
     * This method returns WU_E_NO_UPDATE if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_updates">Updates</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> is not set. This method also returns WU_E_NO_UPDATE if the  <b>Updates</b> property is set to an empty collection.
     * @returns {IInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationresult">IInstallationResult</a> interface  that represents the results of an uninstallation operation for each update that is specified in a request.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-uninstall
     */
    Uninstall() {
        result := ComCall(24, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationResult(retval)
    }

    /**
     * Gets and sets a Boolean value that indicates whether to show source prompts to the user when installing the updates. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_allowsourceprompts
     */
    get_AllowSourcePrompts() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether to show source prompts to the user when installing the updates. (Put)
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-put_allowsourceprompts
     */
    put_AllowSourcePrompts(value) {
        result := ComCall(26, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether a system restart is required before installing or uninstalling updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller-get_rebootrequiredbeforeinstallation
     */
    get_RebootRequiredBeforeInstallation() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateInstaller.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ClientApplicationID := CallbackCreate(GetMethod(implObj, "get_ClientApplicationID"), flags, 2)
        this.vtbl.put_ClientApplicationID := CallbackCreate(GetMethod(implObj, "put_ClientApplicationID"), flags, 2)
        this.vtbl.get_IsForced := CallbackCreate(GetMethod(implObj, "get_IsForced"), flags, 2)
        this.vtbl.put_IsForced := CallbackCreate(GetMethod(implObj, "put_IsForced"), flags, 2)
        this.vtbl.get_ParentHwnd := CallbackCreate(GetMethod(implObj, "get_ParentHwnd"), flags, 2)
        this.vtbl.put_ParentHwnd := CallbackCreate(GetMethod(implObj, "put_ParentHwnd"), flags, 2)
        this.vtbl.put_ParentWindow := CallbackCreate(GetMethod(implObj, "put_ParentWindow"), flags, 2)
        this.vtbl.get_ParentWindow := CallbackCreate(GetMethod(implObj, "get_ParentWindow"), flags, 2)
        this.vtbl.get_Updates := CallbackCreate(GetMethod(implObj, "get_Updates"), flags, 2)
        this.vtbl.put_Updates := CallbackCreate(GetMethod(implObj, "put_Updates"), flags, 2)
        this.vtbl.BeginInstall := CallbackCreate(GetMethod(implObj, "BeginInstall"), flags, 5)
        this.vtbl.BeginUninstall := CallbackCreate(GetMethod(implObj, "BeginUninstall"), flags, 5)
        this.vtbl.EndInstall := CallbackCreate(GetMethod(implObj, "EndInstall"), flags, 3)
        this.vtbl.EndUninstall := CallbackCreate(GetMethod(implObj, "EndUninstall"), flags, 3)
        this.vtbl.Install := CallbackCreate(GetMethod(implObj, "Install"), flags, 2)
        this.vtbl.RunWizard := CallbackCreate(GetMethod(implObj, "RunWizard"), flags, 3)
        this.vtbl.get_IsBusy := CallbackCreate(GetMethod(implObj, "get_IsBusy"), flags, 2)
        this.vtbl.Uninstall := CallbackCreate(GetMethod(implObj, "Uninstall"), flags, 2)
        this.vtbl.get_AllowSourcePrompts := CallbackCreate(GetMethod(implObj, "get_AllowSourcePrompts"), flags, 2)
        this.vtbl.put_AllowSourcePrompts := CallbackCreate(GetMethod(implObj, "put_AllowSourcePrompts"), flags, 2)
        this.vtbl.get_RebootRequiredBeforeInstallation := CallbackCreate(GetMethod(implObj, "get_RebootRequiredBeforeInstallation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ClientApplicationID)
        CallbackFree(this.vtbl.put_ClientApplicationID)
        CallbackFree(this.vtbl.get_IsForced)
        CallbackFree(this.vtbl.put_IsForced)
        CallbackFree(this.vtbl.get_ParentHwnd)
        CallbackFree(this.vtbl.put_ParentHwnd)
        CallbackFree(this.vtbl.put_ParentWindow)
        CallbackFree(this.vtbl.get_ParentWindow)
        CallbackFree(this.vtbl.get_Updates)
        CallbackFree(this.vtbl.put_Updates)
        CallbackFree(this.vtbl.BeginInstall)
        CallbackFree(this.vtbl.BeginUninstall)
        CallbackFree(this.vtbl.EndInstall)
        CallbackFree(this.vtbl.EndUninstall)
        CallbackFree(this.vtbl.Install)
        CallbackFree(this.vtbl.RunWizard)
        CallbackFree(this.vtbl.get_IsBusy)
        CallbackFree(this.vtbl.Uninstall)
        CallbackFree(this.vtbl.get_AllowSourcePrompts)
        CallbackFree(this.vtbl.put_AllowSourcePrompts)
        CallbackFree(this.vtbl.get_RebootRequiredBeforeInstallation)
    }
}
