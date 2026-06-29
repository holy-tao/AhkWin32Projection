#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DRIVER_UPGRADE_INFO_2 {
    #StructPack 8

    pPrinterName : IntPtr

    pOldDriverDirectory : IntPtr

    cVersion : UInt32

    pName : IntPtr

    pEnvironment : IntPtr

    pDriverPath : IntPtr

    pDataFile : IntPtr

    pConfigFile : IntPtr

    pHelpFile : IntPtr

    pDependentFiles : IntPtr

    pMonitorName : IntPtr

    pDefaultDataType : IntPtr

    pszzPreviousNames : IntPtr

}
