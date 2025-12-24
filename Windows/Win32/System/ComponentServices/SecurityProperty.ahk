#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the current object's original caller and direct caller.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-securityproperty
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
     * @returns {BSTR} A reference to the user name associated with the external process that called the currently executing method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-securityproperty-getdirectcallername
     */
    GetDirectCallerName() {
        bstrUserName := BSTR()
        result := ComCall(7, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves the user name associated with the current object's immediate (out-of-process) creator.
     * @returns {BSTR} A reference to the user name associated with the current object's immediate (out-of-process) creator.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-securityproperty-getdirectcreatorname
     */
    GetDirectCreatorName() {
        bstrUserName := BSTR()
        result := ComCall(8, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves the user name associated with the base process that initiated the sequence of calls from which the call into the current object originated.
     * @returns {BSTR} A reference to the user name associated with the base process that initiated the sequence of calls from which the call into the current object originated.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-securityproperty-getoriginalcallername
     */
    GetOriginalCallerName() {
        bstrUserName := BSTR()
        result := ComCall(9, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves the user name associated with the original base process that initiated the activity in which the current object is executing.
     * @returns {BSTR} A reference to the user name associated with the original base process that initiated the activity in which the current object is executing.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-securityproperty-getoriginalcreatorname
     */
    GetOriginalCreatorName() {
        bstrUserName := BSTR()
        result := ComCall(10, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }
}
