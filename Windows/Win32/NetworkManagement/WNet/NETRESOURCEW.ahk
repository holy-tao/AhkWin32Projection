#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The following structure contains information about a network resource. It is used by several of the network provider functions, including NPOpenEnum and NPAddConnection.
 * @remarks
 * 
  * > [!NOTE]
  * > The winnetwk.h header defines NETRESOURCE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnetwk/ns-winnetwk-netresourcew
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 * @charset Unicode
 */
class NETRESOURCEW extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwScope {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Set by the provider to indicate what display type a user interface should use to represent this resource. The following types are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEDISPLAYTYPE_NETWORK"></a><a id="resourcedisplaytype_network"></a><dl>
     * <dt><b>RESOURCEDISPLAYTYPE_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is a network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEDISPLAYTYPE_DOMAIN"></a><a id="resourcedisplaytype_domain"></a><dl>
     * <dt><b>RESOURCEDISPLAYTYPE_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is a collection of servers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEDISPLAYTYPE_SERVER"></a><a id="resourcedisplaytype_server"></a><dl>
     * <dt><b>RESOURCEDISPLAYTYPE_SERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is a server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEDISPLAYTYPE_SHARE"></a><a id="resourcedisplaytype_share"></a><dl>
     * <dt><b>RESOURCEDISPLAYTYPE_SHARE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is a share point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEDISPLAYTYPE_DIRECTORY"></a><a id="resourcedisplaytype_directory"></a><dl>
     * <dt><b>RESOURCEDISPLAYTYPE_DIRECTORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is a directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEDISPLAYTYPE_GENERIC"></a><a id="resourcedisplaytype_generic"></a><dl>
     * <dt><b>RESOURCEDISPLAYTYPE_GENERIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource type is unspecified. This value is used by network providers that do not specify resource types.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwDisplayType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A bitmask that indicates how you can enumerate information about the resource. It is defined only if <b>dwScope</b> is set to RESOURCE_GLOBALNET. The <b>dwUsage</b> field can contain one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEUSAGE_CONNECTABLE"></a><a id="resourceusage_connectable"></a><dl>
     * <dt><b>RESOURCEUSAGE_CONNECTABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can connect to the resource by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection">NPAddConnection</a>. If <b>dwType</b> is RESOURCETYPE_DISK, then, after you have connected to the resource, you can use the file system APIs, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextfilea">FindNextFile</a>, to enumerate any files and directories the resource contains.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEUSAGE_CONTAINER"></a><a id="resourceusage_container"></a><dl>
     * <dt><b>RESOURCEUSAGE_CONTAINER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is a container for other resources that can be enumerated by means of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npopenenum">NPOpenEnum</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npcloseenum">NPCloseEnum</a> functions. 
     * 
     * 
     * 
     * 
     * The container may, however, be empty at the time  the enumeration is made. In other words, the first call to <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a> may return WN_NO_MORE_ENTRIES.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwUsage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * If <b>dwScope</b> is RESOURCE_CONNECTED, the <b>lpLocalName</b> field contains the name of a redirected device. If the connection is a deviceless connection, this field contains <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If <b>dwScope</b> is not set to RESOURCE_CONNECTED, this field is undefined.
     * @type {PWSTR}
     */
    lpLocalName{
        get {
            if(!this.HasProp("__lpLocalName"))
                this.__lpLocalName := PWSTR(this.ptr + 16)
            return this.__lpLocalName
        }
    }

    /**
     * If the enumerated item is a network resource, this field contains a remote network name. This name may be then passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection">NPAddConnection</a> to make a network connection if <b>dwUsage</b> is set to RESOURCEUSAGE_CONNECTABLE. If the enumerated item is a current connection, this field will refer to the remote network name that <b>lpLocalName</b> is connected to.
     * @type {PWSTR}
     */
    lpRemoteName{
        get {
            if(!this.HasProp("__lpRemoteName"))
                this.__lpRemoteName := PWSTR(this.ptr + 24)
            return this.__lpRemoteName
        }
    }

    /**
     * May be any provider-supplied comment associated with the enumerated item.
     * @type {PWSTR}
     */
    lpComment{
        get {
            if(!this.HasProp("__lpComment"))
                this.__lpComment := PWSTR(this.ptr + 32)
            return this.__lpComment
        }
    }

    /**
     * Specifies the name of the provider that owns this enumerated item.
     * @type {PWSTR}
     */
    lpProvider{
        get {
            if(!this.HasProp("__lpProvider"))
                this.__lpProvider := PWSTR(this.ptr + 40)
            return this.__lpProvider
        }
    }
}
