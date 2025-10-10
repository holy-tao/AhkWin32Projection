#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * BLUETOOTH_OOB_DATA_INFO structure contains data used to authenticate prior to establishing an Out-of-Band device pairing.
 * @remarks
 * 
  * For more details regarding the creation of keys for OOB authentication, see the <a href="https://www.bluetooth.com/specifications/bluetooth-core-specification/">Bluetooth Core Specification</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ns-bluetoothapis-bluetooth_oob_data_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_OOB_DATA_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * A 128-bit cryptographic key used for two-way authentication.
     * @type {Array<Byte>}
     */
    C{
        get {
            if(!this.HasProp("__CProxyArray"))
                this.__CProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__CProxyArray
        }
    }

    /**
     * A randomly generated number used for one-way authentication. If this number is not provided by the device initiating the OOB session, this value is 0.
     * @type {Array<Byte>}
     */
    R{
        get {
            if(!this.HasProp("__RProxyArray"))
                this.__RProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__RProxyArray
        }
    }
}
