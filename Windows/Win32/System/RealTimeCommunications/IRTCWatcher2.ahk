#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RTC_ACE_SCOPE.ahk
#Include .\IRTCProfile2.ahk
#Include .\IRTCWatcher.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCWatcher2 extends IRTCWatcher {

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
     * @type {IRTCProfile2} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {RTC_ACE_SCOPE} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(13, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
    }

    /**
     * 
     * @returns {RTC_ACE_SCOPE} 
     */
    get_Scope() {
        result := ComCall(14, this, "int*", &penScope := 0, "HRESULT")
        return penScope
    }
}
