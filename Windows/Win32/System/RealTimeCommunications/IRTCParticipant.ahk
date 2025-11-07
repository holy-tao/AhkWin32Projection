#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCSession.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCParticipant extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCParticipant
     * @type {Guid}
     */
    static IID => Guid("{ae86add5-26b1-4414-af1d-b94cd938d739}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserURI", "get_Name", "get_Removable", "get_State", "get_Session"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserURI() {
        pbstrUserURI := BSTR()
        result := ComCall(3, this, "ptr", pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Removable() {
        result := ComCall(5, this, "short*", &pfRemovable := 0, "HRESULT")
        return pfRemovable
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(6, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @returns {IRTCSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }
}
