#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFND3DKMT_TRIMNOTIFICATIONCALLBACK.ahk" { PFND3DKMT_TRIMNOTIFICATIONCALLBACK }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_UNREGISTERTRIMNOTIFICATION {
    #StructPack 8

    Handle : IntPtr

    Callback : PFND3DKMT_TRIMNOTIFICATIONCALLBACK

}
