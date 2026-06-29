#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDMISCELLANEOUSCALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    GetAvailDriverMemory : IntPtr

    UpdateNonLocalHeap : IntPtr

    GetHeapAlignment : IntPtr

    GetSysmemBltStatus : IntPtr

}
