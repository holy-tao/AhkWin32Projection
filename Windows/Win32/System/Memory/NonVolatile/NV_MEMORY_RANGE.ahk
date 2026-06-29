#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory.NonVolatile
 */
export default struct NV_MEMORY_RANGE {
    #StructPack 8

    BaseAddress : IntPtr

    Length : IntPtr

}
