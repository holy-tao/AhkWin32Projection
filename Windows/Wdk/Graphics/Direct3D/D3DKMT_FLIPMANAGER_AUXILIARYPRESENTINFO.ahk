#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE.ahk" { D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_FLIPMANAGER_AUXILIARYPRESENTINFO {
    #StructPack 8

    auxiliaryPresentInfo : IntPtr

    flipManagerTracingId : UInt32

    customDurationChanged : BOOL

    FlipAdapterLuid : IntPtr

    VidPnSourceId : UInt32

    independentFlipStage : D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE

    FlipCompletedQpc : Int64

    HwPresentDurationQpc : UInt32

    WasCanceled : BOOL

    ConvertedToNonIFlip : BOOL

}
