#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class IKnownSmartCardAppletIds extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownSmartCardAppletIds
     * @type {Guid}
     */
    static IID => Guid("{7b04d8d8-95b4-4c88-8cea-411e55511efc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaymentSystemEnvironment", "get_ProximityPaymentSystemEnvironment"]

    /**
     * @type {IBuffer} 
     */
    PaymentSystemEnvironment {
        get => this.get_PaymentSystemEnvironment()
    }

    /**
     * @type {IBuffer} 
     */
    ProximityPaymentSystemEnvironment {
        get => this.get_ProximityPaymentSystemEnvironment()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PaymentSystemEnvironment() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ProximityPaymentSystemEnvironment() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
