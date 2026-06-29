#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct IO_COMPLETION_CONTEXT {
    #StructPack 8

    Port : IntPtr

    Key : IntPtr

    UsageCount : IntPtr

}
