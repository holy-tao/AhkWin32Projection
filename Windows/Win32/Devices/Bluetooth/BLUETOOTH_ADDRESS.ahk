#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_ADDRESS {
    #StructPack 8

    ullLong : Int64

    static __New() {
        DefineProp(this.Prototype, 'rgBytes', { type: Int8[6], offset: 0 })
        this.DeleteProp("__New")
    }
}
