#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct val_context {
    #StructPack 8

    valuelen : Int32

    value_context : IntPtr

    val_buff_ptr : IntPtr

}
