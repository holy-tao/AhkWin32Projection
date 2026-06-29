#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MONITORREG {
    #StructPack 8

    cbSize : UInt32 := this.Size

    fpCreateKey : IntPtr

    fpOpenKey : IntPtr

    fpCloseKey : IntPtr

    fpDeleteKey : IntPtr

    fpEnumKey : IntPtr

    fpQueryInfoKey : IntPtr

    fpSetValue : IntPtr

    fpDeleteValue : IntPtr

    fpEnumValue : IntPtr

    fpQueryValue : IntPtr

}
