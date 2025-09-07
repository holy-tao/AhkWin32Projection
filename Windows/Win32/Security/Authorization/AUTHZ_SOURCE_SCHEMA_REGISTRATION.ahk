#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET.ahk

/**
 * Specifies information about source schema registration.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_source_schema_registration
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SOURCE_SCHEMA_REGISTRATION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Flags that control the behavior of the operation. The following table shows a possible value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES"></a><a id="authz_allow_multiple_source_instances"></a><dl>
     * <dt><b>AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows registration of  multiple sources with the same name.  Use of this flag  means that   more than one source can call the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzregistersecurityeventsource">AuthzRegisterSecurityEventSource</a> function with the same <i>szEventSourceName</i> at runtime.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUTHZ_MIGRATED_LEGACY_PUBLISHER"></a><a id="authz_migrated_legacy_publisher"></a><dl>
     * <dt><b>AUTHZ_MIGRATED_LEGACY_PUBLISHER</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is a migrated publisher that has registered a manifest with WEvtUtil.exe. The <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> of the provider specified by the <b>pProviderGuid</b> member is stored in the registry.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a wide character string that represents the name of the event source.
     * @type {PWSTR}
     */
    szEventSourceName{
        get {
            if(!this.HasProp("__szEventSourceName"))
                this.__szEventSourceName := PWSTR(this.ptr + 8)
            return this.__szEventSourceName
        }
    }

    /**
     * A pointer to a wide character string that represents the name of the resource that contains the event messages.
     * @type {PWSTR}
     */
    szEventMessageFile{
        get {
            if(!this.HasProp("__szEventMessageFile"))
                this.__szEventMessageFile := PWSTR(this.ptr + 16)
            return this.__szEventMessageFile
        }
    }

    /**
     * A pointer to a wide character string that represents the name of the XML schema file for the event source.
     * @type {PWSTR}
     */
    szEventSourceXmlSchemaFile{
        get {
            if(!this.HasProp("__szEventSourceXmlSchemaFile"))
                this.__szEventSourceXmlSchemaFile := PWSTR(this.ptr + 24)
            return this.__szEventSourceXmlSchemaFile
        }
    }

    /**
     * A pointer to a wide character string that represents the name of the resource that contains the event parameter strings.
     * @type {PWSTR}
     */
    szEventAccessStringsFile{
        get {
            if(!this.HasProp("__szEventAccessStringsFile"))
                this.__szEventAccessStringsFile := PWSTR(this.ptr + 32)
            return this.__szEventAccessStringsFile
        }
    }

    /**
     * This member is reserved and must be set to <b>NULL</b>.
     * @type {PWSTR}
     */
    szExecutableImagePath{
        get {
            if(!this.HasProp("__szExecutableImagePath"))
                this.__szExecutableImagePath := PWSTR(this.ptr + 40)
            return this.__szExecutableImagePath
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Guid>}
     */
    pProviderGuid {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The number of objects in the <i>ObjectTypeNames</i> array.
     * @type {Integer}
     */
    dwObjectTypeNameCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/authz/ns-authz-authz_registration_object_type_name_offset">AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET</a> structures that represents the object types for the events.
     * @type {Array<AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET>}
     */
    ObjectTypeNames{
        get {
            if(!this.HasProp("__ObjectTypeNamesProxyArray"))
                this.__ObjectTypeNamesProxyArray := Win32FixedArray(this.ptr + 64, 8, AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET, "")
            return this.__ObjectTypeNamesProxyArray
        }
    }
}
