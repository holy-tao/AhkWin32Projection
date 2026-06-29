#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct SIMULATE_CAPS_1 {
    #StructPack 4

    dwLevel : UInt32

    dwPageOrderFlags : UInt32

    dwNumberOfCopies : UInt32

    dwCollate : UInt32

    dwNupOptions : UInt32

}
