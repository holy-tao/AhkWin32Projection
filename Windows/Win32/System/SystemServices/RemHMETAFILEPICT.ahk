#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RemHMETAFILEPICT {
    #StructPack 4

    mm : Int32

    xExt : Int32

    yExt : Int32

    cbData : UInt32

    data : Int8[1]

}
