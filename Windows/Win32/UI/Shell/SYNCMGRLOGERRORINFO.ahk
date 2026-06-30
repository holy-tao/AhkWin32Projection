#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides error information for use in the ISyncMgrSynchronizeCallback::LogError method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrlogerrorinfo
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGRLOGERRORINFO extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

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
     * @type {Guid}
     */
    ErrorID {
        get {
            if(!this.HasProp("__ErrorID"))
                this.__ErrorID := Guid(12, this)
            return this.__ErrorID
        }
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The item where the error occurred.
     * @type {Guid}
     */
    ItemID {
        get {
            if(!this.HasProp("__ItemID"))
                this.__ItemID := Guid(28, this)
            return this.__ItemID
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 44
    }
}
