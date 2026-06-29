#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SCSI_ADDRESS {
    #StructPack 4

    Length : UInt32

    PortNumber : Int8

    PathId : Int8

    TargetId : Int8

    Lun : Int8

}
