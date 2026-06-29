#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellDispatch.ahk" { IShellDispatch }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Extends the IShellDispatch object with a variety of new functionality.
 * @remarks
 * The **IShellDispatch2** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * For a discussion of Windows services, see the [Services](../services/services.md) documentation.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-object
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellDispatch2 extends IShellDispatch {
    /**
     * The interface identifier for IShellDispatch2
     * @type {Guid}
     */
    static IID := Guid("{a4c6892c-3ba9-11d2-9dea-00c04fb16162}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellDispatch2 interfaces
    */
    struct Vtbl extends IShellDispatch.Vtbl {
        IsRestricted         : IntPtr
        ShellExecute         : IntPtr
        FindPrinter          : IntPtr
        GetSystemInformation : IntPtr
        ServiceStart         : IntPtr
        ServiceStop          : IntPtr
        IsServiceRunning     : IntPtr
        CanStartStopService  : IntPtr
        ShowBrowserBar       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellDispatch2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IShellDispatch2.IsRestricted method - Retrieves a group's restriction setting from the registry.
     * @remarks
     * This method is implemented and accessed through the [**Shell.IsRestricted**](./shell-isrestricted.md) method.
     * 
     * **IsRestricted** first looks for a subkey name that matches *sGroup* under the following key.
     * 
     * ```
     * HKEY_LOCAL_MACHINE
     *    Software
     *       Microsoft
     *          Windows
     *             CurrentVersion
     *                Policies
     * ```
     * 
     * Restrictions are declared as values of the individual policy subkeys. If the restriction named in *sRestriction* is found in the subkey named in *sGroup*, **IsRestricted** returns the restriction's current value. If the restriction is not found under **HKEY\_LOCAL\_MACHINE**, the same subkey is checked under **HKEY\_CURRENT\_USER**.
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} Group 
     * @param {BSTR} _Restriction 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-isrestricted
     */
    IsRestricted(Group, _Restriction) {
        Group := Group is String ? BSTR.Alloc(Group).Value : Group
        _Restriction := _Restriction is String ? BSTR.Alloc(_Restriction).Value : _Restriction

        result := ComCall(30, this, BSTR, Group, BSTR, _Restriction, "int*", &plRestrictValue := 0, "HRESULT")
        return plRestrictValue
    }

    /**
     * IShellDispatch2.ShellExecute method - Performs a specified operation on a specified file.
     * @remarks
     * This method is implemented and accessed through the [**Shell.ShellExecute**](./shell-shellexecute.md) method.
     * 
     * This method is equivalent to launching one of the commands associated with a file's shortcut menu. Each command is represented by a verb string. The set of supported verbs varies from file to file. The most commonly supported verb is "open", which is also usually the default verb. Other verbs might be supported by only certain types of files. For further discussion of Shell verbs, see [Launching Applications](launch.md) or [Extending Shortcut Menus](context.md).
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} _File 
     * @param {VARIANT} vArgs 
     * @param {VARIANT} vDir 
     * @param {VARIANT} vOperation Type: **Variant**
     * 
     * The operation to be performed. This value is set to one of the verb strings that is supported by the file. For a discussion of verbs, see the Remarks section. If this parameter is not specified, the default operation is performed.
     * @param {VARIANT} vShow Type: **Variant**
     * 
     * A recommendation as to how the application window should be displayed initially. The application can ignore this recommendation. This parameter can be one of the following values. If this parameter is not specified, the application uses its default value.
     * 
     * 
     * 
     * | Value                                                                                                                               | Meaning                                                                                                                                                  |
     * |-------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt></dt> <dt>0</dt> </dl>  | Open the application with a hidden window.<br/>                                                                                                    |
     * | <dl> <dt></dt> <dt>1</dt> </dl>  | Open the application with a normal window. If the window is minimized or maximized, the system restores it to its original size and position.<br/> |
     * | <dl> <dt></dt> <dt>2</dt> </dl>  | Open the application with a minimized window.<br/>                                                                                                 |
     * | <dl> <dt></dt> <dt>3</dt> </dl>  | Open the application with a maximized window.<br/>                                                                                                 |
     * | <dl> <dt></dt> <dt>4</dt> </dl>  | Open the application with its window at its most recent size and position. The active window remains active.<br/>                                  |
     * | <dl> <dt></dt> <dt>5</dt> </dl>  | Open the application with its window at its current size and position.<br/>                                                                        |
     * | <dl> <dt></dt> <dt>7</dt> </dl>  | Open the application with a minimized window. The active window remains active.<br/>                                                               |
     * | <dl> <dt></dt> <dt>10</dt> </dl> | Open the application with its window in the default state specified by the application.<br/>                                                       |
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-shellexecute
     */
    ShellExecute(_File, vArgs, vDir, vOperation, vShow) {
        _File := _File is String ? BSTR.Alloc(_File).Value : _File

        result := ComCall(31, this, BSTR, _File, VARIANT, vArgs, VARIANT, vDir, VARIANT, vOperation, VARIANT, vShow, "HRESULT")
        return result
    }

    /**
     * IShellDispatch2.FindPrinter method - Displays the Find Printer dialog box.
     * @remarks
     * This method is implemented and accessed through the [**Shell.FindPrinter**](./shell-findprinter.md) method.
     * 
     * If you assign strings to one or more of the optional parameters, they are displayed as default values in the associated edit control when the **Find Printer** dialog box is displayed. The user can either accept or override these values. If no value is assigned to a parameter, the associated edit box is empty and the user must enter a value.
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} name 
     * @param {BSTR} _location 
     * @param {BSTR} model 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-findprinter
     */
    FindPrinter(name, _location, model) {
        name := name is String ? BSTR.Alloc(name).Value : name
        _location := _location is String ? BSTR.Alloc(_location).Value : _location
        model := model is String ? BSTR.Alloc(model).Value : model

        result := ComCall(32, this, BSTR, name, BSTR, _location, BSTR, model, "HRESULT")
        return result
    }

    /**
     * IShellDispatch2.GetSystemInformation method - Retrieves system information.
     * @remarks
     * This method is implemented and accessed through the [**Shell.GetSystemInformation**](./shell-getsysteminformation.md) method.
     * 
     * This method can be used to request many system information values. The following table gives the *sName* value that is used to request the information and the associated type of the returned value.
     * 
     * 
     * 
     * *sName*
     * 
     * Return type
     * 
     * Description
     * 
     * DirectoryServiceAvailable
     * 
     * **Boolean**
     * 
     * Set to **true** if the directory service is available; otherwise, **false**.
     * 
     * DoubleClickTime
     * 
     * **Integer**
     * 
     * The double-click time, in milliseconds.
     * 
     * ProcessorLevel
     * 
     * **Integer**
     * 
     * **Windows Vista and later**. The processor level. Returns 3, 4, or 5, for x386, x486, and Pentium-level processors, respectively.
     * 
     * ProcessorSpeed
     * 
     * **Integer**
     * 
     * The processor speed, in megahertz (MHz).
     * 
     * ProcessorArchitecture
     * 
     * **Integer**
     * 
     * The processor architecture. For details, see the discussion of the **wProcessorArchitecture** member of the [**SYSTEM\_INFO**](/windows/win32/api/sysinfoapi/ns-sysinfoapi-system_info) structure.
     * 
     * PhysicalMemoryInstalled
     * 
     * **Integer**
     * 
     * The amount of physical memory installed, in bytes.
     * 
     * The following are valid only on Windows XP.
     * 
     * IsOS\_Professional
     * 
     * **Boolean**
     * 
     * Set to **true** if the operating system is Windows XP Professional Edition; otherwise, **false**.
     * 
     * IsOS\_Personal
     * 
     * **Boolean**
     * 
     * Set to **true** if the operating system is Windows XP Home Edition; otherwise, **false**.
     * 
     * The following is valid only on Windows XP and later.
     * 
     * IsOS\_DomainMember
     * 
     * **Boolean**
     * 
     * Set to **true** if the computer is a member of a domain; otherwise, **false**.
     * 
     * 
     * 
     *  
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-getsysteminformation
     */
    GetSystemInformation(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pv := VARIANT()
        result := ComCall(33, this, BSTR, name, VARIANT.Ptr, pv, "HRESULT")
        return pv
    }

    /**
     * IShellDispatch2.ServiceStart method - Starts a named service.
     * @remarks
     * This method is implemented and accessed through the [**Shell.ServiceStart**](./shell-servicestart.md) method.
     * 
     * The method returns **false** if the service has already been started. Before calling this method, you can call [**Shell.IsServiceRunning**](./shell-isservicerunning.md) to ascertain the status of the service.
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} ServiceName 
     * @param {VARIANT} Persistent 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-servicestart
     */
    ServiceStart(ServiceName, Persistent) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        pSuccess := VARIANT()
        result := ComCall(34, this, BSTR, ServiceName, VARIANT, Persistent, VARIANT.Ptr, pSuccess, "HRESULT")
        return pSuccess
    }

    /**
     * IShellDispatch2.ServiceStop method - Stops a named service.
     * @remarks
     * This method is implemented and accessed through the [**Shell.ServiceStop**](./shell-servicestop.md) method.
     * 
     * The method returns **false** if the service has already been stopped. Before calling this method, you can call [**Shell.IsServiceRunning**](./shell-isservicerunning.md) to ascertain the status of the service.
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} ServiceName 
     * @param {VARIANT} Persistent 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-servicestop
     */
    ServiceStop(ServiceName, Persistent) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        pSuccess := VARIANT()
        result := ComCall(35, this, BSTR, ServiceName, VARIANT, Persistent, VARIANT.Ptr, pSuccess, "HRESULT")
        return pSuccess
    }

    /**
     * IShellDispatch2.IsServiceRunning method - Returns a value that indicates whether a particular service is running.
     * @remarks
     * This method is implemented and accessed through the [**Shell.IsServiceRunning**](./shell-isservicerunning.md) method.
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} ServiceName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-isservicerunning
     */
    IsServiceRunning(ServiceName) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        pRunning := VARIANT()
        result := ComCall(36, this, BSTR, ServiceName, VARIANT.Ptr, pRunning, "HRESULT")
        return pRunning
    }

    /**
     * IShellDispatch2.CanStartStopService method - Determines if the current user can start and stop the named service.
     * @remarks
     * This method is implemented and accessed through the [**Shell.CanStartStopService**](./shell-canstartstopservice.md) method.
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} ServiceName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-canstartstopservice
     */
    CanStartStopService(ServiceName) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        pCanStartStop := VARIANT()
        result := ComCall(37, this, BSTR, ServiceName, VARIANT.Ptr, pCanStartStop, "HRESULT")
        return pCanStartStop
    }

    /**
     * IShellDispatch2.ShowBrowserBar method - Displays a browser bar.
     * @remarks
     * This method is implemented and accessed through the [**Shell.ShowBrowserBar**](./shell-showbrowserbar.md) method.
     * 
     * You can display one of the standard Explorer Bars by setting the *sCLSID* parameter to the CLSID of that Explorer Bar. The standard Explorer Bars and their CLSID strings are as follows:
     * 
     * 
     * 
     * | Explorer Bar | CLSID string                           |
     * |--------------|----------------------------------------|
     * | Favorites    | {EFA24E61-B078-11d0-89E4-00C04FC9E26E} |
     * | Folders      | {EFA24E64-B078-11d0-89E4-00C04FC9E26E} |
     * | History      | {EFA24E62-B078-11d0-89E4-00C04FC9E26E} |
     * | Search       | {30D02401-6A81-11d0-8274-00C04FD5AE38} |
     * 
     * 
     * 
     *  
     * 
     * This method is not currently available in Microsoft Visual Basic.
     * @param {BSTR} bstrClsid 
     * @param {VARIANT} bShow 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-showbrowserbar
     */
    ShowBrowserBar(bstrClsid, bShow) {
        bstrClsid := bstrClsid is String ? BSTR.Alloc(bstrClsid).Value : bstrClsid

        pSuccess := VARIANT()
        result := ComCall(38, this, BSTR, bstrClsid, VARIANT, bShow, VARIANT.Ptr, pSuccess, "HRESULT")
        return pSuccess
    }

    Query(iid) {
        if (IShellDispatch2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsRestricted := CallbackCreate(GetMethod(implObj, "IsRestricted"), flags, 4)
        this.vtbl.ShellExecute := CallbackCreate(GetMethod(implObj, "ShellExecute"), flags, 6)
        this.vtbl.FindPrinter := CallbackCreate(GetMethod(implObj, "FindPrinter"), flags, 4)
        this.vtbl.GetSystemInformation := CallbackCreate(GetMethod(implObj, "GetSystemInformation"), flags, 3)
        this.vtbl.ServiceStart := CallbackCreate(GetMethod(implObj, "ServiceStart"), flags, 4)
        this.vtbl.ServiceStop := CallbackCreate(GetMethod(implObj, "ServiceStop"), flags, 4)
        this.vtbl.IsServiceRunning := CallbackCreate(GetMethod(implObj, "IsServiceRunning"), flags, 3)
        this.vtbl.CanStartStopService := CallbackCreate(GetMethod(implObj, "CanStartStopService"), flags, 3)
        this.vtbl.ShowBrowserBar := CallbackCreate(GetMethod(implObj, "ShowBrowserBar"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsRestricted)
        CallbackFree(this.vtbl.ShellExecute)
        CallbackFree(this.vtbl.FindPrinter)
        CallbackFree(this.vtbl.GetSystemInformation)
        CallbackFree(this.vtbl.ServiceStart)
        CallbackFree(this.vtbl.ServiceStop)
        CallbackFree(this.vtbl.IsServiceRunning)
        CallbackFree(this.vtbl.CanStartStopService)
        CallbackFree(this.vtbl.ShowBrowserBar)
    }
}
