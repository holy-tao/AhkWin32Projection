#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEO_CLUTDATA.ahk" { VIDEO_CLUTDATA }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_CLUT {
    #StructPack 4

    NumEntries : UInt16

    FirstEntry : UInt16

    RgbArray : VIDEO_CLUTDATA

    static __New() {
        DefineProp(this.Prototype, 'RgbLong', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
