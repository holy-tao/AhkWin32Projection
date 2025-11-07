#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCProfile.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfileEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCProfileEvent
     * @type {Guid}
     */
    static IID => Guid("{d6d5ab3b-770e-43e8-800a-79b062395fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Profile", "get_Cookie", "get_StatusCode"]

    /**
     * 
     * @returns {IRTCProfile} 
     */
    get_Profile() {
        result := ComCall(7, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile(ppProfile)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Cookie() {
        result := ComCall(8, this, "ptr*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }
}
