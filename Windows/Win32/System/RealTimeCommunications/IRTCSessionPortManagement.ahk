#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionPortManagement extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPortManager"]

    /**
     * 
     * @param {IRTCPortManager} pPortManager 
     * @returns {HRESULT} 
     */
    SetPortManager(pPortManager) {
        result := ComCall(3, this, "ptr", pPortManager, "HRESULT")
        return result
    }
}
