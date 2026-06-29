#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The VDS_ISCSI_TARGET_PROP structure (vdshwprv.h) defines the properties of an iSCSI target.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_target_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_ISCSI_TARGET_PROP extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the target.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * A null-terminated, human-readable string that is the iSCSI name of the target.
     * @type {PWSTR}
     */
    pwszIscsiName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A null-terminated, human-readable string that is the friendly name of the target. This corresponds to the 
     *      iSCSI alias.
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If <b>TRUE</b>, a CHAP shared secret is required to login to this target.
     * @type {BOOL}
     */
    bChapEnabled {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
