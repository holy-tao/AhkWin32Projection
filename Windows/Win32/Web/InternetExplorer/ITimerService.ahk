#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITimerService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimerService
     * @type {Guid}
     */
    static IID => Guid("{3050f35f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTimer", "GetNamedTimer", "SetNamedTimerReference"]

    /**
     * 
     * @param {ITimer} pReferenceTimer 
     * @param {Pointer<ITimer>} ppNewTimer 
     * @returns {HRESULT} 
     */
    CreateTimer(pReferenceTimer, ppNewTimer) {
        result := ComCall(3, this, "ptr", pReferenceTimer, "ptr*", ppNewTimer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidName 
     * @param {Pointer<ITimer>} ppTimer 
     * @returns {HRESULT} 
     */
    GetNamedTimer(rguidName, ppTimer) {
        result := ComCall(4, this, "ptr", rguidName, "ptr*", ppTimer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidName 
     * @param {ITimer} pReferenceTimer 
     * @returns {HRESULT} 
     */
    SetNamedTimerReference(rguidName, pReferenceTimer) {
        result := ComCall(5, this, "ptr", rguidName, "ptr", pReferenceTimer, "HRESULT")
        return result
    }
}
