#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains metadata used to conduct virtual list view (VLV) searches.
 * @remarks
 * 
  * To set the VLV by <b>dwContentCount</b> and <b>dwOffset</b>, you must also set the <b>pszTarget</b> to a <b>NULL</b> value. If <b>pszTarget</b> contains a non-<b>NULL</b> value, then it is used as the offset, otherwise, <b>lOffset</b> is used as the offset. It is recommended that you initialize the structure to zero.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_vlv
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_VLV extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Indicates the number of entries, before the target entry, that the client requests from the server.
     * @type {Integer}
     */
    dwBeforeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the number of entries, after the target entry, that the client requests from the server.
     * @type {Integer}
     */
    dwAfterCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * On input, indicates the target entry's requested offset within the list. If the client specifies an offset which equals the client's assumed content count, then the target is the last entry in the list. On output, indicates the server's best estimate as to the actual offset of the returned target entry's position in the list.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The input value represents the client's estimated value for the content count. The output value is the server's estimate of the content count. If the client sends a content count of zero, this means that the server must use its estimate of the content count in place of the client's.
     * @type {Integer}
     */
    dwContentCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Optional. Null-terminated Unicode string that indicates the desired target entry requested by the client. If this parameter contains a non-<b>NULL</b> value, the server ignores the value specified in <b>dwOffset</b> and search for the first target entry whose value for the primary sort key is  greater than or equal to the specified string, based on the sort order of the list.
     * @type {PWSTR}
     */
    pszTarget {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional. Parameter that indicates the length of the context identifier. On input, if passing a context identifier in <b>lpContextID</b>, this must be set to the size of the identifier in bytes. Otherwise, it  must be set equal to zero. On output, if <b>lpContextID</b> contains a  non-<b>NULL</b> value, this indicates the length, in bytes, of the context ID returned by the server.
     * @type {Integer}
     */
    dwContextIDLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Optional. Indicates the server-generated context identifier. This parameter may be sent to clients. If a client receives this parameter, it should return it unchanged in a subsequent request which relates to the same list. This interaction may enhance the performance and effectiveness of the servers. If not passing a context identifier to the server, this member must be set to <b>NULL</b> value. On output, if this member contains a non-<b>NULL</b> value, this points to the context ID returned by the server.
     * @type {Pointer<Integer>}
     */
    lpContextID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
