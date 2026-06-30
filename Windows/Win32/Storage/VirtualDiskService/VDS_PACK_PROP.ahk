#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_PACK_STATUS.ahk

/**
 * Defines the properties of a pack object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-getproperties">IVdsPack::GetProperties</a> method returns this structure to report the property details of a pack object.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_pack_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_PACK_PROP extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The GUID of the pack object.
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
     * A string representing the pack name. Packs managed by the basic provider have no name.
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The pack status enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_pack_status">VDS_PACK_STATUS</a>.
     * @type {VDS_PACK_STATUS}
     */
    status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The pack flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_pack_flag">VDS_PACK_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
