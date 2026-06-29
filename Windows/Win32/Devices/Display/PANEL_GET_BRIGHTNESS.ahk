#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRIGHTNESS_INTERFACE_VERSION.ahk" { BRIGHTNESS_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_GET_BRIGHTNESS {
    #StructPack 4

    Version : BRIGHTNESS_INTERFACE_VERSION

    Level : Int8

    TargetInMillinits : UInt32

    static __New() {
        DefineProp(this.Prototype, 'CurrentInMillinits', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
