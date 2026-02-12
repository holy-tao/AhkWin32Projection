#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\OnlineIdServiceTicket.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IOnlineIdSystemIdentity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlineIdSystemIdentity
     * @type {Guid}
     */
    static IID => Guid("{743cd20d-b6ca-434d-8124-53ea12685307}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Ticket", "get_Id"]

    /**
     * @type {OnlineIdServiceTicket} 
     */
    Ticket {
        get => this.get_Ticket()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {OnlineIdServiceTicket} 
     */
    get_Ticket() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OnlineIdServiceTicket(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
