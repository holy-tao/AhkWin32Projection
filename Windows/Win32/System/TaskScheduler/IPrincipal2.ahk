#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the extended settings applied to security credentials for a principal.
 * @remarks
 * 
  * When reading or writing XML for a task, the security credentials for a principal are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iprincipal2
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IPrincipal2 extends IDispatch{
    /**
     * The interface identifier for IPrincipal2
     * @type {Guid}
     */
    static IID => Guid("{248919ae-e345-4a6d-8aeb-e0d3165c904e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pProcessTokenSidType 
     * @returns {HRESULT} 
     */
    get_ProcessTokenSidType(pProcessTokenSidType) {
        result := ComCall(7, this, "int*", pProcessTokenSidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} processTokenSidType 
     * @returns {HRESULT} 
     */
    put_ProcessTokenSidType(processTokenSidType) {
        result := ComCall(8, this, "int", processTokenSidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_RequiredPrivilegeCount(pCount) {
        result := ComCall(9, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pPrivilege 
     * @returns {HRESULT} 
     */
    get_RequiredPrivilege(index, pPrivilege) {
        result := ComCall(10, this, "int", index, "ptr", pPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} privilege 
     * @returns {HRESULT} 
     */
    AddRequiredPrivilege(privilege) {
        privilege := privilege is String ? BSTR.Alloc(privilege).Value : privilege

        result := ComCall(11, this, "ptr", privilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
