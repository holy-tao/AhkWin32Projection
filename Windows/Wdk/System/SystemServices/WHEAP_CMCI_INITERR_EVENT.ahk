#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_CMCI_INITERR_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Msr : Int64

    Type : UInt32

    Bank : UInt32

    EpIndex : UInt32

}
