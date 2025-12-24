#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the IBITSExtensionSetup interface to enable or disable BITS uploads to a virtual directory.
 * @remarks
 * 
 * This interface is registered on the server when you install the BITS server extension.
 * 
 * On Windows Server 2003, use the <b>Windows Components Wizard</b> to install the BITS server extension. From  <b>Control Panel</b>, select <b>Add or Remove Programs</b>. Then, select <b>Add/Remove Windows Components</b> to display the <b>Windows Components Wizard</b>. The BITS server extension is a sub-component of Internet Information Services (IIS) which is a sub-component of Web Application Server.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nn-bitscfg-ibitsextensionsetup
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBITSExtensionSetup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBITSExtensionSetup
     * @type {Guid}
     */
    static IID => Guid("{29cfbbf7-09e4-4b97-b0bc-f2287e3d8eb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableBITSUploads", "DisableBITSUploads", "GetCleanupTaskName", "GetCleanupTask"]

    /**
     * Use the EnableBITSUploads method to enable BITS upload on the virtual directory to which the ADSI object points. This method sets the BITSUploadEnabled IIS extension property.
     * @returns {HRESULT} This method returns <b>S_OK</b> for success. Otherwise, the method failed.
     * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nf-bitscfg-ibitsextensionsetup-enablebitsuploads
     */
    EnableBITSUploads() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Use the DisableBITSUploads method to disable BITS upload on the virtual directory to which the ADSI object points. This method sets the BITSUploadEnabled IIS extension property.
     * @returns {HRESULT} This method returns <b>S_OK</b> for success. Otherwise, the method failed.
     * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nf-bitscfg-ibitsextensionsetup-disablebitsuploads
     */
    DisableBITSUploads() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Use the GetCleanupTaskName method to retrieve the name of the cleanup task associated with the virtual directory.
     * @returns {BSTR} Null-terminated string containing the name of the cleanup task associated with the virtual directory. If <b>NULL</b>, BITS has not created a cleanup task for the virtual directory. When done, call the <b>SysFreeString</b> function to free <i>pTaskName</i>.
     * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nf-bitscfg-ibitsextensionsetup-getcleanuptaskname
     */
    GetCleanupTaskName() {
        pTaskName := BSTR()
        result := ComCall(9, this, "ptr", pTaskName, "HRESULT")
        return pTaskName
    }

    /**
     * Use the GetCleanupTask method to retrieve an interface pointer to the cleanup task associated with the virtual directory.
     * @param {Pointer<Guid>} riid Identifies the task scheduler interface to return in <i>ppTask</i>. For a list of identifiers, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> method.
     * @returns {IUnknown} A pointer to the interface specified by <i>riid</i>. Use the interface to modify the properties of the task. Release <i>ppTask</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nf-bitscfg-ibitsextensionsetup-getcleanuptask
     */
    GetCleanupTask(riid) {
        result := ComCall(10, this, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
