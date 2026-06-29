#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET.ahk" { AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies information about source schema registration.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_source_schema_registration
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_SOURCE_SCHEMA_REGISTRATION {
    #StructPack 8

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
     */
    dwFlags : UInt32

    /**
     * A pointer to a wide character string that represents the name of the event source.
     */
    szEventSourceName : PWSTR

    /**
     * A pointer to a wide character string that represents the name of the resource that contains the event messages.
     */
    szEventMessageFile : PWSTR

    /**
     * A pointer to a wide character string that represents the name of the XML schema file for the event source.
     */
    szEventSourceXmlSchemaFile : PWSTR

    /**
     * A pointer to a wide character string that represents the name of the resource that contains the event parameter strings.
     */
    szEventAccessStringsFile : PWSTR

    /**
     * This member is reserved and must be set to <b>NULL</b>.
     */
    szExecutableImagePath : PWSTR

    pReserved : IntPtr

    /**
     * The number of objects in the <i>ObjectTypeNames</i> array.
     */
    dwObjectTypeNameCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/authz/ns-authz-authz_registration_object_type_name_offset">AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET</a> structures that represents the object types for the events.
     */
    ObjectTypeNames : AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET[1]

    static __New() {
        DefineProp(this.Prototype, 'pProviderGuid', { type: Guid.Ptr, offset: 48 })
        this.DeleteProp("__New")
    }
}
