#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_BRIGHTNESS_INFO_TYPE.ahk" { D3DKMT_BRIGHTNESS_INFO_TYPE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DXGK_BACKLIGHT_OPTIMIZATION_LEVEL.ahk" { DXGK_BACKLIGHT_OPTIMIZATION_LEVEL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_BRIGHTNESS_INFO {
    #StructPack 8

    Type : D3DKMT_BRIGHTNESS_INFO_TYPE

    ChildUid : UInt32

    PossibleLevels : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'Brightness', { type: Int8, offset: 8 })
        DefineProp(this.Prototype, 'BrightnessCaps', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'BrightnessState', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'OptimizationLevel', { type: DXGK_BACKLIGHT_OPTIMIZATION_LEVEL, offset: 8 })
        DefineProp(this.Prototype, 'ReductionInfo', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'VerboseLogging', { type: BOOLEAN, offset: 8 })
        DefineProp(this.Prototype, 'NitRanges', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'GetBrightnessMillinits', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'SetBrightnessMillinits', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
