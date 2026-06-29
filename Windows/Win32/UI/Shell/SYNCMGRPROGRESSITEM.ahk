#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides status information while a synchronization is in progress. This structure is used with the ISyncMgrSynchronizeCallback::Progress method and corresponds to a single synchronization item.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrprogressitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRPROGRESSITEM {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>UINT</b>
     * 
     * Flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrstatus">SYNCMGRSTATUS</a> enumeration that specify which members of this structure are used.
     */
    mask : UInt32

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Status text.
     */
    lpcStatusText : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * One of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrstatus">SYNCMGRSTATUS</a> enumeration.
     */
    dwStatusType : UInt32

    /**
     * Type: <b>int</b>
     * 
     * An integer that indicates the progress value.
     */
    iProgValue : Int32

    /**
     * Type: <b>int</b>
     * 
     * An integer that indicates the maximum progress value.
     */
    iMaxValue : Int32

}
