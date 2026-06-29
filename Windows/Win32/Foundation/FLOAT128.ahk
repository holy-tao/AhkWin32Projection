#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct FLOAT128 {
    #StructPack 8

    LowPart : Int64

    HighPart : Int64

}
