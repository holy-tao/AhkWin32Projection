#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\OnlineIdServiceTicketRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IOnlineIdServiceTicket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlineIdServiceTicket
     * @type {Guid}
     */
    static IID => Guid("{c95c547f-d781-4a94-acb8-c59874238c26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "get_Request", "get_ErrorCode"]

    /**
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {OnlineIdServiceTicketRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {OnlineIdServiceTicketRequest} 
     */
    get_Request() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OnlineIdServiceTicketRequest(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
