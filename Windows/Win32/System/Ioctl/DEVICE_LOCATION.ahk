#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_LOCATION {
    #StructPack 4

    Socket : UInt32

    Slot : UInt32

    Adapter : UInt32

    Port : UInt32

    Channel : UInt32

    Device : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Target', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'Lun', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
