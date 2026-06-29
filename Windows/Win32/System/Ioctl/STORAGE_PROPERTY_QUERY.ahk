#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_QUERY_TYPE.ahk" { STORAGE_QUERY_TYPE }
#Import ".\STORAGE_PROPERTY_ID.ahk" { STORAGE_PROPERTY_ID }

/**
 * Indicates the properties of a storage device or adapter to retrieve as the input buffer passed to the IOCTL_STORAGE_QUERY_PROPERTY control code.
 * @remarks
 * The optional output buffer returned through the <i>lpOutBuffer</i> parameter of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> control code can 
 *      be one of several structures depending on the value of the <b>PropertyId</b> member.  If the 
 *      <b>QueryType</b> member is set to <b>PropertyExistsQuery</b>, then no 
 *      structure is returned.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_property_query
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROPERTY_QUERY {
    #StructPack 4

    /**
     * Indicates whether the caller is requesting a device descriptor, an adapter descriptor, a write cache 
     *       property, a device unique ID (DUID), or the device identifiers provided in the device's SCSI vital product data 
     *       (VPD) page. For a list of the property IDs that can be assigned to this member, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_property_id">STORAGE_PROPERTY_ID</a>.
     */
    PropertyId : STORAGE_PROPERTY_ID

    /**
     * Contains flags indicating the type of query to be performed as enumerated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_query_type">STORAGE_QUERY_TYPE</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PropertyStandardQuery"></a><a id="propertystandardquery"></a><a id="PROPERTYSTANDARDQUERY"></a><dl>
     * <dt><b>PropertyStandardQuery</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instructs the port driver to report a device descriptor, an adapter descriptor or a unique hardware 
     *         device ID (DUID).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PropertyExistsQuery"></a><a id="propertyexistsquery"></a><a id="PROPERTYEXISTSQUERY"></a><dl>
     * <dt><b>PropertyExistsQuery</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instructs the port driver to report whether the descriptor is supported.
     * 
     * </td>
     * </tr>
     * </table>
     */
    QueryType : STORAGE_QUERY_TYPE

    /**
     * Contains an array of bytes that can be used to retrieve additional parameters for specific queries.
     */
    AdditionalParameters : Int8[1]

}
