#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_ESCAPE_GPUMMUCAPS {
    #StructPack 8

    ReadOnlyMemorySupported : BOOLEAN

    NoExecuteMemorySupported : BOOLEAN

    ZeroInPteSupported : BOOLEAN

    CacheCoherentMemorySupported : BOOLEAN

    LargePageSupported : BOOLEAN

    DualPteSupported : BOOLEAN

    AllowNonAlignedLargePageAddress : BOOLEAN

    VirtualAddressBitCount : UInt32

    PageTableLevelCount : UInt32

    PageTableLevelDesk : IntPtr[6]

}
