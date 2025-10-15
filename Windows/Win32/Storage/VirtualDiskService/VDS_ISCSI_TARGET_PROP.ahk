#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Defines the properties of an iSCSI target.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_iscsi_target_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_TARGET_PROP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the target.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A null-terminated, human-readable string that is the iSCSI name of the target.
     * @type {PWSTR}
     */
    pwszIscsiName{
        get {
            if(!this.HasProp("__pwszIscsiName"))
                this.__pwszIscsiName := PWSTR(this.ptr + 8)
            return this.__pwszIscsiName
        }
    }

    /**
     * A null-terminated, human-readable string that is the friendly name of the target. This corresponds to the 
     *      iSCSI alias.
     * @type {PWSTR}
     */
    pwszFriendlyName{
        get {
            if(!this.HasProp("__pwszFriendlyName"))
                this.__pwszFriendlyName := PWSTR(this.ptr + 16)
            return this.__pwszFriendlyName
        }
    }

    /**
     * If <b>TRUE</b>, a CHAP shared secret is required to login to this target.
     * @type {BOOL}
     */
    bChapEnabled{
        get {
            if(!this.HasProp("__bChapEnabled"))
                this.__bChapEnabled := BOOL(this.ptr + 24)
            return this.__bChapEnabled
        }
    }
}
