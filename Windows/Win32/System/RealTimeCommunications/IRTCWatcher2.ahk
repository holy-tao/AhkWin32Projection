#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCWatcher.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCWatcher2 extends IRTCWatcher{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCWatcher2
     * @type {Guid}
     */
    static IID => Guid("{d4d9967f-d011-4b1d-91e3-aba78f96393d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Profile", "get_Scope"]

    /**
     * 
     * @param {Pointer<IRTCProfile2>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(13, this, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penScope 
     * @returns {HRESULT} 
     */
    get_Scope(penScope) {
        result := ComCall(14, this, "int*", penScope, "HRESULT")
        return result
    }
}
