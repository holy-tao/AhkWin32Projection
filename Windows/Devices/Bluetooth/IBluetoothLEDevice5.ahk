#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEDevice5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEDevice5
     * @type {Guid}
     */
    static IID => Guid("{9d6a1260-5287-458e-95ba-17c8b7bb326e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WasSecureConnectionUsedForPairing"]

    /**
     * @type {Boolean} 
     */
    WasSecureConnectionUsedForPairing {
        get => this.get_WasSecureConnectionUsedForPairing()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasSecureConnectionUsedForPairing() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
