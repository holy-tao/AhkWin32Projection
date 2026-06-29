#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_BANK_SELECT {
    #StructPack 4

    Length : UInt32

    Size : UInt32

    BankingFlags : UInt32

    BankingType : UInt32

    PlanarHCBankingType : UInt32

    BitmapWidthInBytes : UInt32

    BitmapSize : UInt32

    Granularity : UInt32

    PlanarHCGranularity : UInt32

    CodeOffset : UInt32

    PlanarHCBankCodeOffset : UInt32

    PlanarHCEnableCodeOffset : UInt32

    PlanarHCDisableCodeOffset : UInt32

}
