#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an AVI 2.0 super index (index of indexes).
 * @remarks
 * 
  * For more information, see the <i>OpenDML AVI File Format Extensions</i>, published by the OpenDML AVI M-JPEG File Format Subcommittee. (This resource may not be available in some languages 
  * 
  * and countries.)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//aviriff/ns-aviriff-avisuperindex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVISUPERINDEX extends Win32Struct
{
    static sizeof => 8208

    static packingSize => 8

    class _avisuperindex_entry extends Win32Struct {
        static sizeof => 8208
        static packingSize => 8

        /**
         * @type {Integer}
         */
        qwOffset {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwDuration {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    /**
     * A <b>FOURCC</b> code. The value must be 'indx'.
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
     * The size of each index entry, in 4-byte units. The value must be 4.
     * @type {Integer}
     */
    wLongsPerEntry {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The index subtype. The value must be zero or <b>AVI_INDEX_SUB_2FIELD</b>.
     * @type {Integer}
     */
    bIndexSubType {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * The index type. The value must be <b>AVI_INDEX_OF_INDEXES</b>.
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
     * A <b>FOURCC</b> that identifies the object that is indexed.
     * @type {Integer}
     */
    dwChunkId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. Set the array elements to zero.
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
     * An array of structures that contain the following members. The number of elements in the array is calculated from the value of <b>cb</b>.
     * @type {Array<_avisuperindex_entry>}
     */
    aIndex{
        get {
            if(!this.HasProp("__aIndexProxyArray"))
                this.__aIndexProxyArray := Win32FixedArray(this.ptr + 32, 1022, %this.__Class%._avisuperindex_entry, "")
            return this.__aIndexProxyArray
        }
    }
}
