#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EISA_PORT_CONFIGURATION {
    #StructPack 8

    Configuration : IntPtr

    PortAddress : UInt16

}
