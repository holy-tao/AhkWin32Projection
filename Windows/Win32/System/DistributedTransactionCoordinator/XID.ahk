#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XID {
    #StructPack 4

    formatID : Int32

    gtrid_length : Int32

    bqual_length : Int32

    data : CHAR[128]

}
