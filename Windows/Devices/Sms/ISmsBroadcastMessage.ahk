#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsBroadcastMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsBroadcastMessage
     * @type {Guid}
     */
    static IID => Guid("{75aebbf1-e4b7-4874-a09c-2956e592f957}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_To", "get_Body", "get_Channel", "get_GeographicalScope", "get_MessageCode", "get_UpdateNumber", "get_BroadcastType", "get_IsEmergencyAlert", "get_IsUserPopupRequested"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
    }

    /**
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
    }

    /**
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * @type {Integer} 
     */
    GeographicalScope {
        get => this.get_GeographicalScope()
    }

    /**
     * @type {Integer} 
     */
    MessageCode {
        get => this.get_MessageCode()
    }

    /**
     * @type {Integer} 
     */
    UpdateNumber {
        get => this.get_UpdateNumber()
    }

    /**
     * @type {Integer} 
     */
    BroadcastType {
        get => this.get_BroadcastType()
    }

    /**
     * @type {Boolean} 
     */
    IsEmergencyAlert {
        get => this.get_IsEmergencyAlert()
    }

    /**
     * @type {Boolean} 
     */
    IsUserPopupRequested {
        get => this.get_IsUserPopupRequested()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
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
    get_To() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Channel() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeographicalScope() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateNumber() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BroadcastType() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEmergencyAlert() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserPopupRequested() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
