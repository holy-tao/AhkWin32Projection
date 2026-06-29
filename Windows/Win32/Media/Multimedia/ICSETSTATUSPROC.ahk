#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * The ICSETSTATUSPROC structure contains status information used with the ICM_SET_STATUS_PROC message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icsetstatusproc
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICSETSTATUSPROC {
    #StructPack 8

    /**
     * Reserved; set to zero.
     */
    dwFlags : UInt32

    /**
     * Parameter that contains a constant to pass to the status procedure.
     */
    lParam : LPARAM

    Status : IntPtr

}
