#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_S {
    #StructPack 4

    FocusRect : RECT

    AutoFocusLock : BOOL

    AutoExposureLock : BOOL

    AutoWhitebalanceLock : BOOL

    Capabilities : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Configuration', { type: UInt32, offset: 28 })
        this.DeleteProp("__New")
    }
}
