#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MONITORUI {
    #StructPack 8

    dwMonitorUISize : UInt32

    pfnAddPortUI : IntPtr

    pfnConfigurePortUI : IntPtr

    pfnDeletePortUI : IntPtr

}
