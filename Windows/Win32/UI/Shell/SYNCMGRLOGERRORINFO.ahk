#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides error information for use in the ISyncMgrSynchronizeCallback::LogError method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrlogerrorinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRLOGERRORINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * The mask value. The synchronization manager handler implemented by your application can set any combination of the following bits to indicate which fields of <b>SYNCMGRLOGERRORINFO</b> it has filled in when calling <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror">ISyncMgrSynchronizeCallback::LogError</a>.
     */
    mask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Error flags. At this time only the following value is recognized.
     */
    dwSyncMgrErrorFlags : UInt32

    /**
     * Type: <b>GUID</b>
     * 
     * An error identifier.
     */
    ErrorID : Guid

    /**
     * Type: <b>GUID</b>
     * 
     * The item where the error occurred.
     */
    ItemID : Guid

}
