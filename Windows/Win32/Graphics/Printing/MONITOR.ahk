#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MONITOR {
    #StructPack 8

    pfnEnumPorts : IntPtr

    pfnOpenPort : IntPtr

    pfnOpenPortEx : IntPtr

    pfnStartDocPort : IntPtr

    pfnWritePort : IntPtr

    pfnReadPort : IntPtr

    pfnEndDocPort : IntPtr

    pfnClosePort : IntPtr

    pfnAddPort : IntPtr

    pfnAddPortEx : IntPtr

    pfnConfigurePort : IntPtr

    pfnDeletePort : IntPtr

    pfnGetPrinterDataFromPort : IntPtr

    pfnSetPortTimeOuts : IntPtr

    pfnXcvOpenPort : IntPtr

    pfnXcvDataPort : IntPtr

    pfnXcvClosePort : IntPtr

}
