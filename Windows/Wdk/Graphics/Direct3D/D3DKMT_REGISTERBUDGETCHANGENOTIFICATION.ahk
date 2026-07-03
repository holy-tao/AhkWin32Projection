#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK.ahk" { PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_REGISTERBUDGETCHANGENOTIFICATION {
    #StructPack 8

    hDevice : UInt32

    Callback : PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK

    Context : IntPtr

    Handle : IntPtr

}
