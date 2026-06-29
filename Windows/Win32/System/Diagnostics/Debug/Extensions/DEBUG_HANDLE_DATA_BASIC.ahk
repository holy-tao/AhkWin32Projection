#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_HANDLE_DATA_BASIC {
    #StructPack 4

    TypeNameSize : UInt32

    ObjectNameSize : UInt32

    Attributes : UInt32

    GrantedAccess : UInt32

    HandleCount : UInt32

    PointerCount : UInt32

}
