#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RemHGLOBAL {
    #StructPack 4

    fNullHGlobal : Int32

    cbData : UInt32

    data : Int8[1]

}
