#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_HISTORY_BUFFER_STATUS {
    #StructPack 4

    Enabled : BOOLEAN

    Reserved : UInt32

}
