#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REFS_SMR_VOLUME_GC_ACTION.ahk" { REFS_SMR_VOLUME_GC_ACTION }
#Import ".\REFS_SMR_VOLUME_GC_METHOD.ahk" { REFS_SMR_VOLUME_GC_METHOD }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REFS_SMR_VOLUME_GC_PARAMETERS {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    Action : REFS_SMR_VOLUME_GC_ACTION

    Method : REFS_SMR_VOLUME_GC_METHOD

    IoGranularity : UInt32

    CompressionFormat : UInt32

    Unused : Int64[8]

}
