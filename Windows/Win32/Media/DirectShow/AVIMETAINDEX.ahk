#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The base structure for an AVI 2.0 index ('indx' format).
 * @remarks
 * 
 * For more information, see the <i>OpenDML AVI File Format Extensions</i>, published by the OpenDML AVI M-JPEG File Format Subcommittee. (This resource may not be available in some languages 
 * 
 * and countries.)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//aviriff/ns-aviriff-avimetaindex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVIMETAINDEX extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * A <b>FOURCC</b> code. The value is either  'indx' or '<i>nn</i>ix', where <i>nn</i> is the stream number.
     * @type {Integer}
     */
    fcc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the structure, not including the initial 8 bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of each index entry, in 4-byte units.
     * @type {Integer}
     */
    wLongsPerEntry {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The index subtype. The meaning depends on the value of <b>bIndexType</b>.
     * @type {Integer}
     */
    bIndexSubType {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * The index type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVI_INDEX_OF_INDEXES"></a><a id="avi_index_of_indexes"></a><dl>
     * <dt><b>AVI_INDEX_OF_INDEXES</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Each index entry points to another index. Treat the <b>AVIMETAINDEX</b> structure as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avisuperindex">AVISUPERINDEX</a> structure. The value of <b>bIndexSubType</b> must be zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVI_INDEX_OF_CHUNKS"></a><a id="avi_index_of_chunks"></a><dl>
     * <dt><b>AVI_INDEX_OF_CHUNKS</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Each index entry points to a data chunk in the file. 
     * 
     * <ul>
     * <li>If <b>bIndexSubType</b> is 0,  treat the <b>AVIMETAINDEX</b> structure as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avistdindex">AVISTDINDEX</a> structure. Each index entry is an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avistdindex_entry">AVISTDINDEX_ENTRY</a> structure.</li>
     * <li>If <b>bIndexSubType</b> is <b>AVI_INDEX_SUB_2FIELD</b>, the index is a field index chunk.<div class="alert"><b>Note</b>  DirectShow does not support field indexes.</div>
     * <div> </div>
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVI_INDEX_IS_DATA"></a><a id="avi_index_is_data"></a><dl>
     * <dt><b>AVI_INDEX_IS_DATA</b></dt>
     * <dt>0x80</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>adwIndex</b> array contains a table of data, not a list of index entries.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    bIndexType {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * The number of valid entries in the <b>adwIndex</b> array.
     * @type {Integer}
     */
    nEntriesInUse {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A <b>FOURCC</b> that identifies the object that is indexed. If the indexed object is a stream, this member has the same meaning as the <b>dwChunkId</b>  member of the <a href="https://docs.microsoft.com/previous-versions/ms779634(v=vs.85)">AVIOLDINDEX</a> structure.
     * @type {Integer}
     */
    dwChunkId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The meaning of this member depends on the index type.
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 20, 3, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * An array of index entries. The format of this data depends on the index type.
     * @type {Array<UInt32>}
     */
    adwIndex{
        get {
            if(!this.HasProp("__adwIndexProxyArray"))
                this.__adwIndexProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "uint")
            return this.__adwIndexProxyArray
        }
    }
}
