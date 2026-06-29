#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_PROTECTED_SESSION_STATUS.ahk" { D3DKMT_PROTECTED_SESSION_STATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYPROTECTEDSESSIONSTATUS {
    #StructPack 4

    hHandle : UInt32

    Status : D3DKMT_PROTECTED_SESSION_STATUS

}
