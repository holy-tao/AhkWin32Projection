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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LastRelease"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedpoolaction-lastrelease
     */
    LastRelease() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
