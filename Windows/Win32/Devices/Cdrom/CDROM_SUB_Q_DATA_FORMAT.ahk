#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_SUB_Q_DATA_FORMAT {
    #StructPack 1

    Format : Int8

    Track : Int8

}
