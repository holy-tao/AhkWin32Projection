#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXCoreMemoryUsage.ahk" { DXCoreMemoryUsage }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreProcessMemoryQueryOutput {
    #StructPack 8

    memoryUsage : DXCoreMemoryUsage

    processQuerySucceeded : Int8

}
