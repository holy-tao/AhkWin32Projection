#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISecurityCallContext.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves a reference to an object created from the SecurityCallContext class that is associated with the current call. (IGetSecurityCallContext)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-igetsecuritycallcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IGetSecurityCallContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetSecurityCallContext
     * @type {Guid}
     */
    static IID => Guid("{cafc823f-b441-11d1-b82b-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecurityCallContext"]

    /**
     * Retrieves a reference to an object created from the SecurityCallContext class that is associated with the current call. (IGetSecurityCallContext.GetSecurityCallContext)
     * @remarks
     * With an object's security call context, you can retrieve items in the security call context collection, such as the minimum authentication level, the direct caller, the original caller, the chain of callers, and the number of callers. You can also call the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled">IsSecurityEnabled</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole">IsCallerInRole</a> methods to ensure that a particular section of code is executed. However, you can call these methods only if role-based security is enabled and if the direct caller is a member of a specified role.
     * @returns {ISecurityCallContext} A reference to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-isecuritycallcontext">ISecurityCallContext</a> on the object's context.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetsecuritycallcontext-getsecuritycallcontext
     */
    GetSecurityCallContext() {
        result := ComCall(7, this, "ptr*", &ppObject := 0, "HRESULT")
        return ISecurityCallContext(ppObject)
    }
}
