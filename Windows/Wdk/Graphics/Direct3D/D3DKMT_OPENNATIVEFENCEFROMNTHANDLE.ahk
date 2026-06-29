#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENNATIVEFENCEFROMNTHANDLE {
    #StructPack 8

    hNtHandle : HANDLE

    hDevice : UInt32

    EngineAffinity : UInt32

    Flags : IntPtr

    hSyncObject : UInt32

    NativeFenceMapping : IntPtr

}
