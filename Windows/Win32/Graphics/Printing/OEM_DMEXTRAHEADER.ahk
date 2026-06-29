#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEM_DMEXTRAHEADER {
    #StructPack 4

    dwSize : UInt32

    dwSignature : UInt32

    dwVersion : UInt32

}
