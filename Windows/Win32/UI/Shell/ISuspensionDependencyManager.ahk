#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-isuspensiondependencymanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISuspensionDependencyManager extends IUnknown{
    /**
     * The interface identifier for ISuspensionDependencyManager
     * @type {Guid}
     */
    static IID => Guid("{52b83a42-2543-416a-81d9-c0de7969c8b3}")

    /**
     * The class identifier for SuspensionDependencyManager
     * @type {Guid}
     */
    static CLSID => Guid("{6b273fc5-61fd-4918-95a2-c3b5e9d7f581}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HANDLE} processHandle 
     * @returns {HRESULT} 
     */
    RegisterAsChild(processHandle) {
        processHandle := processHandle is Win32Handle ? NumGet(processHandle, "ptr") : processHandle

        result := ComCall(3, this, "ptr", processHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} childProcessHandle 
     * @returns {HRESULT} 
     */
    GroupChildWithParent(childProcessHandle) {
        childProcessHandle := childProcessHandle is Win32Handle ? NumGet(childProcessHandle, "ptr") : childProcessHandle

        result := ComCall(4, this, "ptr", childProcessHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} childProcessHandle 
     * @returns {HRESULT} 
     */
    UngroupChildFromParent(childProcessHandle) {
        childProcessHandle := childProcessHandle is Win32Handle ? NumGet(childProcessHandle, "ptr") : childProcessHandle

        result := ComCall(5, this, "ptr", childProcessHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
