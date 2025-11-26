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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProcessTokenSidType", "put_ProcessTokenSidType", "get_RequiredPrivilegeCount", "get_RequiredPrivilege", "AddRequiredPrivilege"]

    /**
     */
    ProcessTokenSidType {
        get => this.get_ProcessTokenSidType()
        set => this.put_ProcessTokenSidType(value)
    }

    /**
     */
    RequiredPrivilegeCount {
        get => this.get_RequiredPrivilegeCount()
    }

    /**
     * Gets or sets the task process security identifier (SID) type.
     * @param {Pointer<Integer>} pProcessTokenSidType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal2-get_processtokensidtype
     */
    get_ProcessTokenSidType(pProcessTokenSidType) {
        pProcessTokenSidTypeMarshal := pProcessTokenSidType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pProcessTokenSidTypeMarshal, pProcessTokenSidType, "HRESULT")
        return result
    }

    /**
     * Gets or sets the task process security identifier (SID) type.
     * @param {Integer} processTokenSidType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal2-put_processtokensidtype
     */
    put_ProcessTokenSidType(processTokenSidType) {
        result := ComCall(8, this, "int", processTokenSidType, "HRESULT")
        return result
    }

    /**
     * Gets the number of privileges in the required privileges array.
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal2-get_requiredprivilegecount
     */
    get_RequiredPrivilegeCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Gets the required privilege of the task by index.
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pPrivilege 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal2-get_requiredprivilege
     */
    get_RequiredPrivilege(index, pPrivilege) {
        result := ComCall(10, this, "int", index, "ptr", pPrivilege, "HRESULT")
        return result
    }

    /**
     * Adds the required privilege to the task process token.
     * @param {BSTR} privilege Specifies the right of a task to perform various system-related operations, such as shutting down the system, loading device drivers, or changing the system time.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal2-addrequiredprivilege
     */
    AddRequiredPrivilege(privilege) {
        privilege := privilege is String ? BSTR.Alloc(privilege).Value : privilege

        result := ComCall(11, this, "ptr", privilege, "HRESULT")
        return result
    }
}
