#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattClientNotificationResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattClientNotificationResult2
     * @type {Guid}
     */
    static IID => Guid("{8faec497-45e0-497e-9582-29a1fe281ad5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BytesSent"]

    /**
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesSent() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
