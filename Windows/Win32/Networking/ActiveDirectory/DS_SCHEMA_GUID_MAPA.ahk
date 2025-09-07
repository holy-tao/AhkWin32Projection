#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the results of a call to DsMapSchemaGuids. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The ntdsapi.h header defines DS_SCHEMA_GUID_MAP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset ANSI
 */
class DS_SCHEMA_GUID_MAPA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the object GUID.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the type of GUID mapped by <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmapschemaguidsa">DsMapSchemaGuids</a>.
     * @type {Integer}
     */
    guidType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string value that specifies the display name associated with the GUID. This value may be <b>NULL</b> if <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmapschemaguidsa">DsMapSchemaGuids</a> was unable to map the GUID to a display name.
     * @type {Pointer<Ptr>}
     */
    pName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
