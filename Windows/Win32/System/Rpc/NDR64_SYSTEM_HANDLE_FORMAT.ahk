#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_SYSTEM_HANDLE_FORMAT {
    #StructPack 4

    FormatCode : Int8

    HandleType : Int8

    DesiredAccess : UInt32

}
