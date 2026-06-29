#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VOLUME_PHYSICAL_OFFSET.ahk" { VOLUME_PHYSICAL_OFFSET }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_PHYSICAL_OFFSETS {
    #StructPack 8

    NumberOfPhysicalOffsets : UInt32

    PhysicalOffset : VOLUME_PHYSICAL_OFFSET[1]

}
