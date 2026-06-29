#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_INFO_RSP {
    #StructPack 2

    result : UInt16

    dataLen : Int8

    connectionlessMTU : UInt16

    static __New() {
        DefineProp(this.Prototype, 'data', { type: Int8[44], offset: 3 })
        this.DeleteProp("__New")
    }
}
