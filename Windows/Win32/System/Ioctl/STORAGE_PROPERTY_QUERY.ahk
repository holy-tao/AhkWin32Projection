#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the properties of a storage device or adapter to retrieve as the input buffer passed to the IOCTL_STORAGE_QUERY_PROPERTY control code.
 * @remarks
 * 
 * The optional output buffer returned through the <i>lpOutBuffer</i> parameter of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> control code can 
 *      be one of several structures depending on the value of the <b>PropertyId</b> member.  If the 
 *      <b>QueryType</b> member is set to <b>PropertyExistsQuery</b>, then no 
 *      structure is returned.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_property_query
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROPERTY_QUERY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Indicates whether the caller is requesting a device descriptor, an adapter descriptor, a write cache 
     *       property, a device unique ID (DUID), or the device identifiers provided in the device's SCSI vital product data 
     *       (VPD) page. For a list of the property IDs that can be assigned to this member, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_property_id">STORAGE_PROPERTY_ID</a>.
     * @type {Integer}
     */
    PropertyId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

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
     * @type {Integer}
     */
    QueryType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Contains an array of bytes that can be used to retrieve additional parameters for specific queries.
     * @type {Array<Byte>}
     */
    AdditionalParameters{
        get {
            if(!this.HasProp("__AdditionalParametersProxyArray"))
                this.__AdditionalParametersProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__AdditionalParametersProxyArray
        }
    }
}
