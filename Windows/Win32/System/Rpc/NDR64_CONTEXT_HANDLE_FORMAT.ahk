#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_CONTEXT_HANDLE_FORMAT {
    #StructPack 1

    FormatCode : Int8

    ContextFlags : Int8

    RundownRoutineIndex : Int8

    Ordinal : Int8

}
