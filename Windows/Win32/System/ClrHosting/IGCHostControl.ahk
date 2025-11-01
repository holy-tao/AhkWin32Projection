#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IGCHostControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGCHostControl
     * @type {Guid}
     */
    static IID => Guid("{5513d564-8374-4cb9-aed9-0083f4160a1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestVirtualMemLimit"]

    /**
     * 
     * @param {Pointer} sztMaxVirtualMemMB 
     * @param {Pointer<Pointer>} psztNewMaxVirtualMemMB 
     * @returns {HRESULT} 
     */
    RequestVirtualMemLimit(sztMaxVirtualMemMB, psztNewMaxVirtualMemMB) {
        psztNewMaxVirtualMemMBMarshal := psztNewMaxVirtualMemMB is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", sztMaxVirtualMemMB, psztNewMaxVirtualMemMBMarshal, psztNewMaxVirtualMemMB, "HRESULT")
        return result
    }
}
