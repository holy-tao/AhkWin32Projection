#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 * @architecture X64, Arm64
 */
export default struct FLOAT_LONG {
    #StructPack 4

    e : Float32

    static __New() {
        DefineProp(this.Prototype, 'l', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
