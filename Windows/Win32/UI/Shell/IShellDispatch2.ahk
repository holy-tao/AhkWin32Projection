#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IShellDispatch.ahk

/**
 * Extends the IShellDispatch object with a variety of new functionality.
 * @remarks
 * The **IShellDispatch2** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * For a discussion of Windows services, see the [Services](../services/services.md) documentation.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch2 extends IShellDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDispatch2
     * @type {Guid}
     */
    static IID => Guid("{a4c6892c-3ba9-11d2-9dea-00c04fb16162}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsRestricted", "ShellExecute", "FindPrinter", "GetSystemInformation", "ServiceStart", "ServiceStop", "IsServiceRunning", "CanStartStopService", "ShowBrowserBar"]

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
     * @param {BSTR} Restriction_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-isrestricted
     */
    IsRestricted(Group, Restriction_) {
        if(Group is String) {
            pin := BSTR.Alloc(Group)
            Group := pin.Value
        }
        if(Restriction_ is String) {
            pin := BSTR.Alloc(Restriction_)
            Restriction_ := pin.Value
        }

        result := ComCall(30, this, "ptr", Group, "ptr", Restriction_, "int*", &plRestrictValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {BSTR} File_ 
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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-shellexecute
     */
    ShellExecute(File_, vArgs, vDir, vOperation, vShow) {
        if(File_ is String) {
            pin := BSTR.Alloc(File_)
            File_ := pin.Value
        }

        result := ComCall(31, this, "ptr", File_, "ptr", vArgs, "ptr", vDir, "ptr", vOperation, "ptr", vShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {BSTR} location_ 
     * @param {BSTR} model 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-findprinter
     */
    FindPrinter(name, location_, model) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }
        if(location_ is String) {
            pin := BSTR.Alloc(location_)
            location_ := pin.Value
        }
        if(model is String) {
            pin := BSTR.Alloc(model)
            model := pin.Value
        }

        result := ComCall(32, this, "ptr", name, "ptr", location_, "ptr", model, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-getsysteminformation
     */
    GetSystemInformation(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        pv := VARIANT()
        result := ComCall(33, this, "ptr", name, "ptr", pv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-servicestart
     */
    ServiceStart(ServiceName, Persistent) {
        if(ServiceName is String) {
            pin := BSTR.Alloc(ServiceName)
            ServiceName := pin.Value
        }

        pSuccess := VARIANT()
        result := ComCall(34, this, "ptr", ServiceName, "ptr", Persistent, "ptr", pSuccess, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-servicestop
     */
    ServiceStop(ServiceName, Persistent) {
        if(ServiceName is String) {
            pin := BSTR.Alloc(ServiceName)
            ServiceName := pin.Value
        }

        pSuccess := VARIANT()
        result := ComCall(35, this, "ptr", ServiceName, "ptr", Persistent, "ptr", pSuccess, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-isservicerunning
     */
    IsServiceRunning(ServiceName) {
        if(ServiceName is String) {
            pin := BSTR.Alloc(ServiceName)
            ServiceName := pin.Value
        }

        pRunning := VARIANT()
        result := ComCall(36, this, "ptr", ServiceName, "ptr", pRunning, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-canstartstopservice
     */
    CanStartStopService(ServiceName) {
        if(ServiceName is String) {
            pin := BSTR.Alloc(ServiceName)
            ServiceName := pin.Value
        }

        pCanStartStop := VARIANT()
        result := ComCall(37, this, "ptr", ServiceName, "ptr", pCanStartStop, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch2-showbrowserbar
     */
    ShowBrowserBar(bstrClsid, bShow) {
        if(bstrClsid is String) {
            pin := BSTR.Alloc(bstrClsid)
            bstrClsid := pin.Value
        }

        pSuccess := VARIANT()
        result := ComCall(38, this, "ptr", bstrClsid, "ptr", bShow, "ptr", pSuccess, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSuccess
    }
}
