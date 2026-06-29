#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_LAYER_STATISTICS1 {
    #StructPack 4

    layerId : Guid

    classifyPermitCount : UInt32

    classifyBlockCount : UInt32

    classifyVetoCount : UInt32

    numCacheEntries : UInt32

    filterCount : UInt32

    totalFilterSize : UInt32

}
