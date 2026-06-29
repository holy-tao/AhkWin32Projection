#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_MIX_CAPS {
    #StructPack 4

    Mute : BOOL

    Minimum : Int32

    Maximum : Int32

    Reset : Int32

    static __New() {
        DefineProp(this.Prototype, 'Resolution', { type: Int32, offset: 12 })
        this.DeleteProp("__New")
    }
}
