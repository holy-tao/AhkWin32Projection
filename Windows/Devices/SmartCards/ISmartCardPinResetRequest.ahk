#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\SmartCardPinResetDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardPinResetRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardPinResetRequest
     * @type {Guid}
     */
    static IID => Guid("{12fe3c4d-5fb9-4e8e-9ff6-61f475124fef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Challenge", "get_Deadline", "GetDeferral", "SetResponse"]

    /**
     * @type {IBuffer} 
     */
    Challenge {
        get => this.get_Challenge()
    }

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Challenge() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SmartCardPinResetDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardPinResetDeferral(result_)
    }

    /**
     * 
     * @param {IBuffer} response 
     * @returns {HRESULT} 
     */
    SetResponse(response) {
        result := ComCall(9, this, "ptr", response, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
