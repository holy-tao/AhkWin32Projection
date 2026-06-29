#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct WCS_DEVICE_MHC2_CAPABILITIES {
    #StructPack 4

    Size : UInt32

    SupportsMhc2 : BOOL

    RegammaLutEntryCount : UInt32

    CscXyzMatrixRows : UInt32

    CscXyzMatrixColumns : UInt32

}
