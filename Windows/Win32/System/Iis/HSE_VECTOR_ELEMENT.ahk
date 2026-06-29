#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_VECTOR_ELEMENT {
    #StructPack 8

    ElementType : UInt32

    pvContext : IntPtr

    cbOffset : Int64

    cbSize : Int64 := this.Size

}
