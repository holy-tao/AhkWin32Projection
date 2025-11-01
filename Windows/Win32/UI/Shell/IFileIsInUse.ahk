#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that can be called to get information on or close a file that is in use by another application.
 * @remarks
 * 
  * In versions of Windows before Windows Vista, when a user attempted to access a file that was open in another application, the user would simply receive a dialog box with a message stating that the file was already open. The message instructed that the user close the other application, but did not identify it. Other than that suggestion, the dialog box provided no user action to address the situation. This interface provides methods that can lead to a more informative dialog box from which the user can take direct action.
  * 
  * <h3><a id="The_Running_Object_Table"></a><a id="the_running_object_table"></a><a id="THE_RUNNING_OBJECT_TABLE"></a>The Running Object Table</h3>
  * When an application opens a file, that application registers the file by inserting the instantiated <b>IFileIsInUse</b> object into the running object table (ROT). The ROT is a globally accessible lookup table that keeps track of currently running objects. These objects can be identified by a moniker. When a client attempts to bind a moniker to an object, the moniker checks the ROT to determine whether the object is already running. This allows the moniker to bind to the current instance rather than loading a new instance.
  * 
  * Perform these steps to add a file to the ROT:
  * 
  * 
  * <ol>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getrunningobjecttable">GetRunningObjectTable</a> function to retrieve an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a>.</li>
  * <li>Create an <b>IFileIsInUse</b> object for the file that is currently in use.</li>
  * <li>Create an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> object for the file that is currently in use.</li>
  * <li>Insert the <b>IFileIsInUse</b> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> objects into the ROT by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>.</li>
  * </ol>
  * 
  * 
  * In the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">Register</a>, specify the <b>ROTFLAGS_ALLOWANYCLIENT</b> flag. This allows the ROT entry to work across security boundaries. Use of this flag requires the calling application to have an explicit Application User Model ID (AppUserModelID) (<a href="https://docs.microsoft.com/windows/desktop/properties/props-system-appusermodel-id">System.AppUserModel.ID</a>). An explicit AppUserModelID allows the Component Object Model (COM) to inspect the application's security settings. An attempt to call <b>Register</b> with ROTFLAGS_ALLOWANYCLIENT and no explicit AppUserModelID will fail. You can call <b>Register</b> without the ROTFLAGS_ALLOWANYCLIENT flag and the application will work correctly, but only within its own security level.
  * 
  * The value retrieved in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">Register</a> method's [out] parameter is used to identify the entry in later calls to retrieve or remove it from the ROT.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Applications that open file types that can be opened by other applications should implement <b>IFileIsInUse</b>. An application's implementation of this interface enables Windows Explorer to discover the source of sharing errors, which enables users to address and retry operations that fail due to those errors.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * An application calls <b>IFileIsInUse</b> to communicate with other applications to resolve sharing errors. These errors occur in response to user action in the file system. For example, when a user attempts to rename a folder while a file in that folder is open in an application, the renaming operation fails. Windows Explorer can call that application's implementation of <b>IFileIsInUse</b> to help the user identify the conflict and resolve this issue.
  * 
  * <h3><a id="Sample"></a><a id="sample"></a><a id="SAMPLE"></a>Sample</h3>
  * See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ee330722(v=vs.85)">File Is in Use</a> sample, which demonstrates how to implement <b>IFileIsInUse</b> and register a file with the ROT. It then shows how to customize the <b>File In Use</b> dialog to display additional information and options for files currently opened in an application.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifileisinuse
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileIsInUse extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileIsInUse
     * @type {Guid}
     */
    static IID => Guid("{64a1cbf0-3a1a-4461-9158-376969693950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppName", "GetUsage", "GetCapabilities", "GetSwitchToHWND", "CloseFile"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileisinuse-getappname
     */
    GetAppName(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileisinuse-getusage
     */
    GetUsage(pfut) {
        pfutMarshal := pfut is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pfutMarshal, pfut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCapFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileisinuse-getcapabilities
     */
    GetCapabilities(pdwCapFlags) {
        pdwCapFlagsMarshal := pdwCapFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwCapFlagsMarshal, pdwCapFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileisinuse-getswitchtohwnd
     */
    GetSwitchToHWND(phwnd) {
        result := ComCall(6, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileisinuse-closefile
     */
    CloseFile() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
