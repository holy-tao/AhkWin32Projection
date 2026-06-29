#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_USER_STREAM.ahk" { MINIDUMP_USER_STREAM }

/**
 * Contains a list of user data streams used by the MiniDumpWriteDump function.
 * @remarks
 * In this context, a data stream refers to a block of data within a minidump file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_user_stream_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct MINIDUMP_USER_STREAM_INFORMATION {
    #StructPack 8

    /**
     * The number of user streams.
     */
    UserStreamCount : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_user_stream">MINIDUMP_USER_STREAM</a> structures.
     */
    UserStreamArray : MINIDUMP_USER_STREAM.Ptr

}
