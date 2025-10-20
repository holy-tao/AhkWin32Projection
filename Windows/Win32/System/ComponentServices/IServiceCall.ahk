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
     * 
     * @returns {HRESULT} 
     */
    OnCall() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
