#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_SYMBOL_PARAMETERS {
    #StructPack 8

    Module : Int64

    TypeId : UInt32

    ParentSymbol : UInt32

    SubElements : UInt32

    Flags : UInt32

    Reserved : Int64

}
