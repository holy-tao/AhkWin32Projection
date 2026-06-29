#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUG_DEVICE_ADDRESS {
    #StructPack 8

    Type : Int8

    Valid : BOOLEAN

    Reserved : Int8[2]

    TranslatedAddress : IntPtr

    Length : UInt32

    static __New() {
        DefineProp(this.Prototype, 'BitWidth', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'AccessSize', { type: Int8, offset: 3 })
        this.DeleteProp("__New")
    }
}
