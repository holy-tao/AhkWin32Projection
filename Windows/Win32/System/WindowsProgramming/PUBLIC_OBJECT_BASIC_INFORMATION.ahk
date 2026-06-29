#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PUBLIC_OBJECT_BASIC_INFORMATION {
    #StructPack 4

    Attributes : UInt32

    GrantedAccess : UInt32

    HandleCount : UInt32

    PointerCount : UInt32

    Reserved : UInt32[10]

}
