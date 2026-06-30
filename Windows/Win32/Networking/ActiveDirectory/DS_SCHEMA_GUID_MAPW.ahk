#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the results of a call to DsMapSchemaGuids. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_SCHEMA_GUID_MAP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset Unicode
 */
class DS_SCHEMA_GUID_MAPW extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the object GUID.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * Indicates the type of GUID mapped by <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmapschemaguidsa">DsMapSchemaGuids</a>.
     * @type {Integer}
     */
    guidType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string value that specifies the display name associated with the GUID. This value may be <b>NULL</b> if <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmapschemaguidsa">DsMapSchemaGuids</a> was unable to map the GUID to a display name.
     * @type {PWSTR}
     */
    pName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
