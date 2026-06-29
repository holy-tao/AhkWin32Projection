#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct OFFSETINSTANCEDATAANDLENGTH {
    #StructPack 4

    OffsetInstanceData : UInt32

    LengthInstanceData : UInt32

}
