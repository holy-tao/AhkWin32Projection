#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ISystemMonitorEvents extends IUnknown{
    /**
     * The interface identifier for ISystemMonitorEvents
     * @type {Guid}
     */
    static IID => Guid("{ee660ea0-4abd-11cf-943a-008029004347}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCounterSelected(Index) {
        ComCall(3, this, "int", Index)
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCounterAdded(Index) {
        ComCall(4, this, "int", Index)
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCounterDeleted(Index) {
        ComCall(5, this, "int", Index)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnSampleCollected() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnDblClick(Index) {
        ComCall(7, this, "int", Index)
        return result
    }
}
