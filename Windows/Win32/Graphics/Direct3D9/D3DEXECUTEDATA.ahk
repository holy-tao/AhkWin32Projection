#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DSTATUS.ahk" { D3DSTATUS }
#Import ".\D3DRECT.ahk" { D3DRECT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DEXECUTEDATA {
    #StructPack 4

    dwSize : UInt32

    dwVertexOffset : UInt32

    dwVertexCount : UInt32

    dwInstructionOffset : UInt32

    dwInstructionLength : UInt32

    dwHVertexOffset : UInt32

    dsStatus : D3DSTATUS

}
