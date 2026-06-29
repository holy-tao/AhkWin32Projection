#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct OS_STRING {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    MicrosoftString : WCHAR[7]

    bVendorCode : Int8

    bPad : Int8

    static __New() {
        DefineProp(this.Prototype, 'bFlags', { type: Int8, offset: 17 })
        this.DeleteProp("__New")
    }
}
