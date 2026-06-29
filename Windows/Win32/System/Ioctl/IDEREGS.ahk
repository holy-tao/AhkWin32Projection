#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct IDEREGS {
    #StructPack 1

    bFeaturesReg : Int8

    bSectorCountReg : Int8

    bSectorNumberReg : Int8

    bCylLowReg : Int8

    bCylHighReg : Int8

    bDriveHeadReg : Int8

    bCommandReg : Int8

    bReserved : Int8

}
