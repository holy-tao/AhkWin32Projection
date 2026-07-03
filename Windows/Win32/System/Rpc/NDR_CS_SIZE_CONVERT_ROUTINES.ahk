#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_CS_SIZE_CONVERT_ROUTINES {
    #StructPack 8

    pfnNetSize : IntPtr

    pfnToNetCs : IntPtr

    pfnLocalSize : IntPtr

    pfnFromNetCs : IntPtr

}
