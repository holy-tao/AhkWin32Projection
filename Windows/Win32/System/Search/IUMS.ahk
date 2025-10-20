#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IUMS extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SqlUmsSuspend", "SqlUmsYield", "SqlUmsSwitchPremptive", "SqlUmsSwitchNonPremptive", "SqlUmsFIsPremptive"]

    /**
     * 
     * @param {Integer} ticks 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsSuspend(ticks) {
        ComCall(0, this, "uint", ticks)
    }

    /**
     * 
     * @param {Integer} ticks 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsYield(ticks) {
        ComCall(1, this, "uint", ticks)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsSwitchPremptive() {
        ComCall(2, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SqlUmsSwitchNonPremptive() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    SqlUmsFIsPremptive() {
        result := ComCall(4, this, "int")
        return result
    }
}
