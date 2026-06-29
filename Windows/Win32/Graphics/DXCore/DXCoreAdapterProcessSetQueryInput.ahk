#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreAdapterProcessSetQueryInput {
    #StructPack 8

    arraySize : UInt32

    processIds : IntPtr

}
