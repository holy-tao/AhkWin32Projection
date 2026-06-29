#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXCoreAdapterEngineIndex.ahk" { DXCoreAdapterEngineIndex }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreEngineQueryInput {
    #StructPack 4

    adapterEngineIndex : DXCoreAdapterEngineIndex

    processId : UInt32

}
