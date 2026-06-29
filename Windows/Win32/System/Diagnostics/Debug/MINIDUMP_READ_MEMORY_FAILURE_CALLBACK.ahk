#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains information about a failed memory read operation.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_read_memory_failure_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_READ_MEMORY_FAILURE_CALLBACK {
    #StructPack 8

    /**
     * The offset of the address for the failed memory read operation.
     */
    Offset : Int64

    /**
     * The size of the failed memory read operation, in bytes.
     */
    Bytes : UInt32

    /**
     * The resulting error code from the failed memory read operation.
     */
    FailureStatus : HRESULT

}
