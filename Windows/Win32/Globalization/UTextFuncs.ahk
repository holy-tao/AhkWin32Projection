#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextFuncs {
    #StructPack 8

    tableSize : Int32

    reserved1 : Int32

    reserved2 : Int32

    reserved3 : Int32

    clone : IntPtr

    nativeLength : IntPtr

    access : IntPtr

    extract : IntPtr

    replace : IntPtr

    copy : IntPtr

    mapOffsetToNative : IntPtr

    mapNativeIndexToUTF16 : IntPtr

    close : IntPtr

    spare1 : IntPtr

    spare2 : IntPtr

    spare3 : IntPtr

}
