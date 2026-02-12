#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsStatusMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsStatusMessage
     * @type {Guid}
     */
    static IID => Guid("{e6d28342-b70b-4677-9379-c9783fdff8f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_To", "get_From", "get_Body", "get_Status", "get_MessageReferenceNumber", "get_ServiceCenterTimestamp", "get_DischargeTime"]

    /**
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
    }

    /**
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
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
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    MessageReferenceNumber {
        get => this.get_MessageReferenceNumber()
    }

    /**
     * @type {DateTime} 
     */
    ServiceCenterTimestamp {
        get => this.get_ServiceCenterTimestamp()
    }

    /**
     * @type {DateTime} 
     */
    DischargeTime {
        get => this.get_DischargeTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
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
    get_From() {
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
    get_Status() {
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
    get_MessageReferenceNumber() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ServiceCenterTimestamp() {
        value := DateTime()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DischargeTime() {
        value := DateTime()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
