#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to be notified before it is released from a COM+ object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imanagedpoolaction
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IManagedPoolAction extends IUnknown{
    /**
     * The interface identifier for IManagedPoolAction
     * @type {Guid}
     */
    static IID => Guid("{da91b74e-5388-4783-949d-c1cd5fb00506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    LastRelease() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
