#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreMemoryUsage {
    #StructPack 8

    committed : Int64

    resident : Int64

}
