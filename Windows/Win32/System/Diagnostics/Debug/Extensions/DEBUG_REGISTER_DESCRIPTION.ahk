#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_REGISTER_DESCRIPTION {
    #StructPack 8

    Type : UInt32

    Flags : UInt32

    SubregMaster : UInt32

    SubregLength : UInt32

    SubregMask : Int64

    SubregShift : UInt32

    Reserved0 : UInt32

}
