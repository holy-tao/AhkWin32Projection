#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AVISTDINDEX_ENTRY.ahk

/**
 * Contains an AVI 2.0 standard index.
 * @remarks
 * 
  * For more information, see the <i>OpenDML AVI File Format Extensions</i>, published by the OpenDML AVI M-JPEG File Format Subcommittee. (This resource may not be available in some languages 
  * 
  * and countries.)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//aviriff/ns-aviriff-avistdindex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVISTDINDEX extends Win32Struct
{
    static sizeof => 16392

    static packingSize => 8

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
     * The size of each index entry, in 4-byte units. The value must be 2.
     * @type {Integer}
     */
    wLongsPerEntry {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The index subtype. The value must be zero.
     * @type {Integer}
     */
    bIndexSubType {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * The index type. The value must be <b>AVI_INDEX_OF_CHUNKS</b>.
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
     * A <b>FOURCC</b> that identifies the object that is indexed. This member has the same meaning as the <b>dwChunkId</b>  member of the <a href="https://docs.microsoft.com/previous-versions/ms779634(v=vs.85)">AVIOLDINDEX</a> structure.
     * @type {Integer}
     */
    dwChunkId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The base offset for the index entries. For each index entry, <b>qwBaseOffset</b> + <b>AVISTDINDEX_ENTRY.dwOffset</b> gives the offset from the start of the file to the data.
     * @type {Integer}
     */
    qwBaseOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    dwReserved_3 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avistdindex_entry">AVISTDINDEX_ENTRY</a> structures. The number of elements in the array is calculated from the value of <b>cb</b>.
     * @type {Array<AVISTDINDEX_ENTRY>}
     */
    aIndex{
        get {
            if(!this.HasProp("__aIndexProxyArray"))
                this.__aIndexProxyArray := Win32FixedArray(this.ptr + 40, 2044, AVISTDINDEX_ENTRY, "")
            return this.__aIndexProxyArray
        }
    }
}
