#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionPortManagement extends IUnknown{
    /**
     * The interface identifier for IRTCSessionPortManagement
     * @type {Guid}
     */
    static IID => Guid("{a072f1d6-0286-4e1f-85f2-17a2948456ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRTCPortManager>} pPortManager 
     * @returns {HRESULT} 
     */
    SetPortManager(pPortManager) {
        result := ComCall(3, this, "ptr", pPortManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
