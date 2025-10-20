#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IGCHostControl extends IUnknown{
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
     * 
     * @param {Pointer} sztMaxVirtualMemMB 
     * @param {Pointer<UIntPtr>} psztNewMaxVirtualMemMB 
     * @returns {HRESULT} 
     */
    RequestVirtualMemLimit(sztMaxVirtualMemMB, psztNewMaxVirtualMemMB) {
        result := ComCall(3, this, "ptr", sztMaxVirtualMemMB, "ptr*", psztNewMaxVirtualMemMB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
