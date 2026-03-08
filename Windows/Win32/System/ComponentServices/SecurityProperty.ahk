#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the current object's original caller and direct caller.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-securityproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SecurityProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SecurityProperty
     * @type {Guid}
     */
    static IID => Guid("{e74a7215-014d-11d1-a63c-00a0c911b4e0}")

    /**
     * The class identifier for SecurityProperty
     * @type {Guid}
     */
    static CLSID => Guid("{e74a7215-014d-11d1-a63c-00a0c911b4e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectCallerName", "GetDirectCreatorName", "GetOriginalCallerName", "GetOriginalCreatorName"]

    /**
     * Retrieves the user name associated with the external process that called the currently executing method.
     * @remarks
     * The following scenarios illustrate the functionality of this method:
     * 
     * <ul>
     * <li>A base process, running on server A as user A, calls into object X on server B, running as user B. Then object X calls into object Y, running on server C. If object Y calls <b>GetDirectCallerName</b>, the name of user B is retrieved.</li>
     * <li>A base process, running on server A as user A, calls into object X on server B, running as user B. Then object X calls into object Y, running in the same process as object X, also on server B. When object Y calls <b>GetDirectCallerName</b>, the name of user A is returned, not the name of user B.</li>
     * </ul>
     * @returns {BSTR} A reference to the user name associated with the external process that called the currently executing method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-securityproperty-getdirectcallername
     */
    GetDirectCallerName() {
        bstrUserName := BSTR()
        result := ComCall(7, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves the user name associated with the current object's immediate (out-of-process) creator.
     * @returns {BSTR} A reference to the user name associated with the current object's immediate (out-of-process) creator.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-securityproperty-getdirectcreatorname
     */
    GetDirectCreatorName() {
        bstrUserName := BSTR()
        result := ComCall(8, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves the user name associated with the base process that initiated the sequence of calls from which the call into the current object originated.
     * @remarks
     * Generally, an object's original caller is the same process as its original creator. The only situation in which the original caller and the original creator would be different is one in which the original creator passes a reference to another process and the other process initiates the call sequence.
     * 
     * The following scenario illustrates the functionality of this method:
     * 
     * <ol>
     * <li>Base process 1, running on server A as user A, creates object X, on server B, running as user B.</li>
     * <li>Then base process 1 passes its reference on object X to base process 2, running on server D as user D.</li>
     * <li>Base process 2 uses that reference to call into object X.</li>
     * <li>Object X then calls into object Y, running on server C. If object Y then calls <b>GetOriginalCallerName</b>, the name of user D is returned, not user A, who originally created the object.</li>
     * </ol>
     * The path to the original caller is broken if any object along the chain was created by some other means than <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-createinstance">ObjectContext::CreateInstance</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-itransactioncontext-createinstance">ITransactionContext::CreateInstance</a>. For example, if base process 1 uses <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create object X, when object Y calls <b>GetOriginalCallerName</b>, the name it gets back will be the name of user B, not user D. This is because the call sequence is traced back through the objects' context and COM+ can create a context only for an object that is created with either <b>ObjectContext::CreateInstance</b> or <b>ITransactionContext::CreateInstance</b>.
     * @returns {BSTR} A reference to the user name associated with the base process that initiated the sequence of calls from which the call into the current object originated.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-securityproperty-getoriginalcallername
     */
    GetOriginalCallerName() {
        bstrUserName := BSTR()
        result := ComCall(9, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves the user name associated with the original base process that initiated the activity in which the current object is executing.
     * @returns {BSTR} A reference to the user name associated with the original base process that initiated the activity in which the current object is executing.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-securityproperty-getoriginalcreatorname
     */
    GetOriginalCreatorName() {
        bstrUserName := BSTR()
        result := ComCall(10, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }
}
