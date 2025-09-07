#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines the properties of a pack object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-getproperties">IVdsPack::GetProperties</a> method returns this structure to report the property details of a pack object.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_pack_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PACK_PROP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The GUID of the pack object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A string representing the pack name. Packs managed by the basic provider have no name.
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 8)
            return this.__pwszName
        }
    }

    /**
     * The pack status enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_pack_status">VDS_PACK_STATUS</a>.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The pack flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_pack_flag">VDS_PACK_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
