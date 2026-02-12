#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IOnlineIdServiceTicketRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlineIdServiceTicketRequest
     * @type {Guid}
     */
    static IID => Guid("{297445d3-fb63-4135-8909-4e354c061466}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Service", "get_Policy"]

    /**
     * @type {HSTRING} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * @type {HSTRING} 
     */
    Policy {
        get => this.get_Policy()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Service() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Policy() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
