#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to implement the batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicecall
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceCall extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceCall
     * @type {Guid}
     */
    static IID => Guid("{bd3e2e12-42dd-40f4-a09a-95a50c58304b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCall"]

    /**
     * Triggers the execution of the batch work implemented in this method.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicecall-oncall
     */
    OnCall() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
