#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Isolation
 * @version v4.0.30319
 */
class IIsolatedProcessLauncher extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedProcessLauncher
     * @type {Guid}
     */
    static IID => Guid("{1aa24232-9a91-4201-88cb-122f9d6522e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchProcess", "ShareDirectory", "GetContainerGuid", "AllowSetForegroundAccess", "IsContainerRunning"]

    /**
     * 
     * @param {PWSTR} process 
     * @param {PWSTR} arguments 
     * @param {PWSTR} workingDirectory 
     * @returns {HRESULT} 
     */
    LaunchProcess(process, arguments, workingDirectory) {
        process := process is String ? StrPtr(process) : process
        arguments := arguments is String ? StrPtr(arguments) : arguments
        workingDirectory := workingDirectory is String ? StrPtr(workingDirectory) : workingDirectory

        result := ComCall(3, this, "ptr", process, "ptr", arguments, "ptr", workingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} hostPath 
     * @param {PWSTR} containerPath 
     * @param {BOOL} readOnly 
     * @returns {HRESULT} 
     */
    ShareDirectory(hostPath, containerPath, readOnly) {
        hostPath := hostPath is String ? StrPtr(hostPath) : hostPath
        containerPath := containerPath is String ? StrPtr(containerPath) : containerPath

        result := ComCall(4, this, "ptr", hostPath, "ptr", containerPath, "int", readOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    GetContainerGuid(guid) {
        result := ComCall(5, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @returns {HRESULT} 
     */
    AllowSetForegroundAccess(pid) {
        result := ComCall(6, this, "uint", pid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} running 
     * @returns {HRESULT} 
     */
    IsContainerRunning(running) {
        result := ComCall(7, this, "ptr", running, "HRESULT")
        return result
    }
}
