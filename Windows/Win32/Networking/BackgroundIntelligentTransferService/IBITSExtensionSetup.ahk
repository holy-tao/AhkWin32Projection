#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use the IBITSExtensionSetup interface to enable or disable BITS uploads to a virtual directory.
 * @remarks
 * This interface is registered on the server when you install the BITS server extension.
 * 
 * On Windows Server 2003, use the <b>Windows Components Wizard</b> to install the BITS server extension. From  <b>Control Panel</b>, select <b>Add or Remove Programs</b>. Then, select <b>Add/Remove Windows Components</b> to display the <b>Windows Components Wizard</b>. The BITS server extension is a sub-component of Internet Information Services (IIS) which is a sub-component of Web Application Server.
 * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nn-bitscfg-ibitsextensionsetup
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBITSExtensionSetup extends IDispatch {
    /**
     * The interface identifier for IBITSExtensionSetup
     * @type {Guid}
     */
    static IID := Guid("{29cfbbf7-09e4-4b97-b0bc-f2287e3d8eb3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBITSExtensionSetup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EnableBITSUploads  : IntPtr
        DisableBITSUploads : IntPtr
        GetCleanupTaskName : IntPtr
        GetCleanupTask     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBITSExtensionSetup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Use the EnableBITSUploads method to enable BITS upload on the virtual directory to which the ADSI object points. This method sets the BITSUploadEnabled IIS extension property.
     * @remarks
     * This method turns off the scripting and execute permissions on the virtual directory; you cannot upload files to a virtual directory that has scripting and execute permissions enabled. If the permissions are restored after calling this method, the upload jobs fail with an error code of <b>BG_E_SERVER_EXECUTE_ENABLED</b>.
     * 
     * The 
     * <b>EnableBITSUploads</b> method fails if the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a> is disabled.
     * @returns {HRESULT} This method returns <b>S_OK</b> for success. Otherwise, the method failed.
     * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nf-bitscfg-ibitsextensionsetup-enablebitsuploads
     */
    EnableBITSUploads() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Use the DisableBITSUploads method to disable BITS upload on the virtual directory to which the ADSI object points. This method sets the BITSUploadEnabled IIS extension property.
     * @returns {HRESULT} This method returns <b>S_OK</b> for success. Otherwise, the method failed.
     * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nf-bitscfg-ibitsextensionsetup-disablebitsuploads
     */
    DisableBITSUploads() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Use the GetCleanupTaskName method to retrieve the name of the cleanup task associated with the virtual directory.
     * @remarks
     * When you create a virtual directory and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bitscfg/nf-bitscfg-ibitsextensionsetup-enablebitsuploads">enable</a> it for BITS uploads, BITS adds a work item in the 
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a>. The work item cleans up the virtual directory once every 12 hours by deleting jobs that have not been modified within the time-out period. To specify the time-out period, set the 
     * <a href="https://docs.microsoft.com/windows/desktop/Bits/bits-iis-extension-properties">BITSSessionTimeout</a> IIS extension property.
     * 
     * Use the <i>pTaskName</i> name as an input parameter to the Schtasks.exe executable file, which you can use to change the properties of the cleanup task from a script.
     * @returns {BSTR} Null-terminated string containing the name of the cleanup task associated with the virtual directory. If <b>NULL</b>, BITS has not created a cleanup task for the virtual directory. When done, call the <b>SysFreeString</b> function to free <i>pTaskName</i>.
     * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nf-bitscfg-ibitsextensionsetup-getcleanuptaskname
     */
    GetCleanupTaskName() {
        pTaskName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pTaskName, "HRESULT")
        return pTaskName
    }

    /**
     * Use the GetCleanupTask method to retrieve an interface pointer to the cleanup task associated with the virtual directory.
     * @remarks
     * When you create a virtual directory and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bitscfg/nf-bitscfg-ibitsextensionsetup-enablebitsuploads">enable</a> it for BITS uploads, BITS adds a work item in the 
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-start-page">Task Scheduler</a>. The work item cleans up the virtual directory once every 12 hours by deleting jobs that have not been modified within the time-out period. To specify the time-out period, set the 
     * <a href="https://docs.microsoft.com/windows/desktop/Bits/bits-iis-extension-properties">BITSSessionTimeout</a> IIS extension property.
     * 
     * To change the cleanup schedule, see the <a href="https://docs.microsoft.com/windows/desktop/Bits/bits-iis-extension-properties">BITSCleanupUseDefault</a> BITS IIS extension property.
     * @param {Pointer<Guid>} riid Identifies the task scheduler interface to return in <i>ppTask</i>. For a list of identifiers, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> method.
     * @returns {IUnknown} A pointer to the interface specified by <i>riid</i>. Use the interface to modify the properties of the task. Release <i>ppTask</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nf-bitscfg-ibitsextensionsetup-getcleanuptask
     */
    GetCleanupTask(riid) {
        result := ComCall(10, this, Guid.Ptr, riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (IBITSExtensionSetup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableBITSUploads := CallbackCreate(GetMethod(implObj, "EnableBITSUploads"), flags, 1)
        this.vtbl.DisableBITSUploads := CallbackCreate(GetMethod(implObj, "DisableBITSUploads"), flags, 1)
        this.vtbl.GetCleanupTaskName := CallbackCreate(GetMethod(implObj, "GetCleanupTaskName"), flags, 2)
        this.vtbl.GetCleanupTask := CallbackCreate(GetMethod(implObj, "GetCleanupTask"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableBITSUploads)
        CallbackFree(this.vtbl.DisableBITSUploads)
        CallbackFree(this.vtbl.GetCleanupTaskName)
        CallbackFree(this.vtbl.GetCleanupTask)
    }
}
