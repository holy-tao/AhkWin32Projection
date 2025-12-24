#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCBuddy.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddyEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddyEvent
     * @type {Guid}
     */
    static IID => Guid("{f36d755d-17e6-404e-954f-0fc07574c78d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Buddy"]

    /**
     * @type {IRTCBuddy} 
     */
    Buddy {
        get => this.get_Buddy()
    }

    /**
     * 
     * @returns {IRTCBuddy} 
     */
    get_Buddy() {
        result := ComCall(7, this, "ptr*", &ppBuddy := 0, "HRESULT")
        return IRTCBuddy(ppBuddy)
    }
}
