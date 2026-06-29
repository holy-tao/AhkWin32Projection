#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DRIVER_UPGRADE_INFO_1 {
    #StructPack 8

    pPrinterName : IntPtr

    pOldDriverDirectory : IntPtr

}
