#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct VAR_STRING {
    #StructPack 4

    ulTotalSize : UInt32

    ulNeededSize : UInt32

    ulUsedSize : UInt32

    ulStringFormat : UInt32

    ulStringSize : UInt32

    ulStringOffset : UInt32

}
