#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides error information for use in the ISyncMgrSynchronizeCallback::LogError method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrlogerrorinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRLOGERRORINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The mask value. The synchronization manager handler implemented by your application can set any combination of the following bits to indicate which fields of <b>SYNCMGRLOGERRORINFO</b> it has filled in when calling <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror">ISyncMgrSynchronizeCallback::LogError</a>.
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Error flags. At this time only the following value is recognized.
     * @type {Integer}
     */
    dwSyncMgrErrorFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * An error identifier.
     * @type {Pointer<Guid>}
     */
    ErrorID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The item where the error occurred.
     * @type {Pointer<Guid>}
     */
    ItemID {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
