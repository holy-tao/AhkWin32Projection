#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Lists all the streams that are used for either input or output for the shell and commands.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_stream_id_set
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_STREAM_ID_SET {
    #StructPack 8

    /**
     * Defines the number of stream IDs in <b>streamIDs</b>.
     */
    streamIDsCount : UInt32

    /**
     * Specifies an array of stream IDs.
     */
    streamIDs : PWSTR.Ptr

}
