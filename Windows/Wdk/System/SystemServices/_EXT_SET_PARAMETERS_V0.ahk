#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct _EXT_SET_PARAMETERS_V0 {
    #StructPack 8

    Version : UInt32

    Reserved : UInt32

    NoWakeTolerance : Int64

}
