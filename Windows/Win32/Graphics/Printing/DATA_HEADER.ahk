#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DATA_HEADER {
    #StructPack 4

    dwSignature : UInt32

    wSize : UInt16

    wDataID : UInt16

    dwDataSize : UInt32

    dwReserved : UInt32

}
