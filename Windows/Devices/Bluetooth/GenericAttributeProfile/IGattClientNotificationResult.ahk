#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattSubscribedClient.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattClientNotificationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattClientNotificationResult
     * @type {Guid}
     */
    static IID => Guid("{506d5599-0112-419a-8e3b-ae21afabd2c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubscribedClient", "get_Status", "get_ProtocolError"]

    /**
     * @type {GattSubscribedClient} 
     */
    SubscribedClient {
        get => this.get_SubscribedClient()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
    }

    /**
     * 
     * @returns {GattSubscribedClient} 
     */
    get_SubscribedClient() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattSubscribedClient(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetByte(), value)
    }
}
