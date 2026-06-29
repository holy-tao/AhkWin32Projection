#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXT_THREAD_FIND_PARAMS {
    #StructPack 8

    SizeofStruct : UInt32

    StackPointer : Int64

    Cid : UInt32

    Thread : Int64

}
