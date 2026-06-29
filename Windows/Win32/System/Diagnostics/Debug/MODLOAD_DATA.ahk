#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MODLOAD_DATA_TYPE.ahk" { MODLOAD_DATA_TYPE }

/**
 * Contains module data.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-modload_data
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MODLOAD_DATA {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    ssize : UInt32

    ssig : MODLOAD_DATA_TYPE

    /**
     * The data. The format of this data depends on the value of the <b>ssig</b> member.
     */
    data : IntPtr

    /**
     * The size of the <b>data</b> buffer, in bytes.
     */
    size : UInt32

    /**
     * This member is unused.
     */
    flags : UInt32

}
