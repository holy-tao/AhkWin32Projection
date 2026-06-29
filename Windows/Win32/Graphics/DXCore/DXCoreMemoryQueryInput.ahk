#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXCoreMemoryType.ahk" { DXCoreMemoryType }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreMemoryQueryInput {
    #StructPack 4

    physicalAdapterIndex : UInt32

    memoryType : DXCoreMemoryType

}
