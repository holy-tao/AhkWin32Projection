#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\SmartCardEmulatorConnectionProperties.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardEmulatorApduReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardEmulatorApduReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d55d1576-69d2-5333-5b5f-f8c0d6e9f09f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommandApdu", "get_ConnectionProperties", "TryRespondAsync", "get_AutomaticResponseStatus"]

    /**
     * @type {IBuffer} 
     */
    CommandApdu {
        get => this.get_CommandApdu()
    }

    /**
     * @type {SmartCardEmulatorConnectionProperties} 
     */
    ConnectionProperties {
        get => this.get_ConnectionProperties()
    }

    /**
     * @type {Integer} 
     */
    AutomaticResponseStatus {
        get => this.get_AutomaticResponseStatus()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CommandApdu() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {SmartCardEmulatorConnectionProperties} 
     */
    get_ConnectionProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardEmulatorConnectionProperties(value)
    }

    /**
     * 
     * @param {IBuffer} responseApdu 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRespondAsync(responseApdu) {
        result := ComCall(8, this, "ptr", responseApdu, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutomaticResponseStatus() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
