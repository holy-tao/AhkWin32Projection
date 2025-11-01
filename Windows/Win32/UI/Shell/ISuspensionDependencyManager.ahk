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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterAsChild", "GroupChildWithParent", "UngroupChildFromParent"]

    /**
     * 
     * @param {HANDLE} processHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isuspensiondependencymanager-registeraschild
     */
    RegisterAsChild(processHandle) {
        processHandle := processHandle is Win32Handle ? NumGet(processHandle, "ptr") : processHandle

        result := ComCall(3, this, "ptr", processHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} childProcessHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isuspensiondependencymanager-groupchildwithparent
     */
    GroupChildWithParent(childProcessHandle) {
        childProcessHandle := childProcessHandle is Win32Handle ? NumGet(childProcessHandle, "ptr") : childProcessHandle

        result := ComCall(4, this, "ptr", childProcessHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} childProcessHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isuspensiondependencymanager-ungroupchildfromparent
     */
    UngroupChildFromParent(childProcessHandle) {
        childProcessHandle := childProcessHandle is Win32Handle ? NumGet(childProcessHandle, "ptr") : childProcessHandle

        result := ComCall(5, this, "ptr", childProcessHandle, "HRESULT")
        return result
    }
}
