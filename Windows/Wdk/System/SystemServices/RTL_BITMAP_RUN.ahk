#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_BITMAP_RUN {
    #StructPack 4

    StartingIndex : UInt32

    NumberOfBits : UInt32

}
