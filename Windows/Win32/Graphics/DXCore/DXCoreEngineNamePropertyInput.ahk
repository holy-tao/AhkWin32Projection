#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DXCoreAdapterEngineIndex.ahk" { DXCoreAdapterEngineIndex }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreEngineNamePropertyInput {
    #StructPack 8

    adapterEngineIndex : DXCoreAdapterEngineIndex

    engineNameLength : UInt32

    engineName : PWSTR

}
