#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a single block of data, including its name, location, and length.
 * @remarks
 * An array of 
 * <b>StorageLayout</b> structures might appear as follows.
 * 
 * 
 * ```cpp
 * StorageLayout arrScript[]=
 *     // Read first 2k of "WordDocument" stream
 *     {STGTY_STREAM,L"WordDocument",{0,0},{0,2048}},
 *  
 *     //Test if "ObjectPool\88112233" storage exists
 *     {STGTY_STORAGE,L"ObjectPool\\88112233",{0,0},{0,0}},
 *  
 *     //Read 2k at offset 1048 of "WordDocument" stream
 *     {STGTY_STREAM,L"WordDocument",{0,10480},{0,2048}},
 *  
 *     //Interlace "Audio", "Video", and "Caption" streams
 *     {STGTY_REPEAT,NULL,0,STG_TOEND},
 *         {STGTY_STREAM,L"Audio", {0,0},{0,2048}},    // 2k of Audio
 *         {STGTY_STREAM,L"Video", {0,0},{0,65536}},   // 64k of Video
 *         {STGTY_STREAM,L"Caption", {0,0},{0,128}},   // 128b of text
 *     {STGTY_REPEAT,NULL, {0,0},{0,0}}
 * };
 * ```
 * 
 * 
 * <div class="alert"><b>Note</b>  The parameters <i>cOffset</i> and <i>cBytes</i> are <b>LARGE_INTEGER</b> structures, used to represent a 64-bit signed integer value as a union of two 32-bit members. The two 32-bit members must be represented as a <b>LARGE_INTEGER</b> structure with <b>DWORD</b> LowPart and <b>LONG</b> HighPart as the structure members. (LowPart specifies the low-order 32 bits and HighPart specifies the high-order 32 bits.) If your compiler has built-in support for 64-bit integers, use the <b>QuadPart</b> member of the <b>LARGE_INTEGER</b> structure to store the 64-bit integer.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-storagelayout
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class StorageLayout extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The type of element to be written. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-stgty">STGTY</a> enumeration. <b>STGTY_STREAM</b> means read the block of data named by <b>pwcsElementName</b>. <b>STGTY_STORAGE</b> means open the storage specified in <b>pwcsElementName</b>. <b>STGTY_REPEAT</b> is used in multimedia applications to interface audio, video, text, and other elements. An opening <b>STGTY_REPEAT</b> value means that the elements that follow are to be repeated a specified number of times. The closing <b>STGTY_REPEAT</b> value marks the end of those elements that are to be repeated. Nested <b>STGTY_REPEAT</b> value pairs are permitted.
     * @type {Integer}
     */
    LayoutType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The null-terminated Unicode string name of the storage or stream. If the element is a substorage or embedded object, the fully qualified storage path must be specified; for example,  "RootStorageName\SubStorageName\Substream".
     * @type {PWSTR}
     */
    pwcsElementName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Where the value of the <b>LayoutType</b> member is <b>STGTY_STREAM</b>, this flag specifies the beginning offset into the steam named in the <b>pwscElementName</b> member. 
     * 
     * 
     * 
     * 
     * Where <b>LayoutType</b> is <b>STGTY_STORAGE</b>, this flag should be set to zero.
     * 
     * Where <b>LayoutType</b> is <b>STGTY_REPEAT</b>, this flag should be set to zero.
     * @type {Integer}
     */
    cOffset {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Length, in bytes, of the data block named in <b>pwcsElementName</b>. 
     * 
     * 
     * 
     * 
     * Where <b>LayoutType</b> is <b>STGTY_STREAM</b>, <b>cBytes</b> specifies the number of bytes to read at <b>cOffset</b> from the stream named in <b>pwcsElementName</b>.
     * 
     * Where <b>LayoutType</b> is <b>STGTY_STORAGE</b>, this flag is ignored.
     * 
     * Where <b>LayoutType</b> is <b>STGTY_REPEAT</b>, a positive <b>cBytes</b> specifies the beginning of a repeat block. <b>STGTY_REPEAT</b> with zero <b>cBytes</b> marks the end of a repeat block.
     * 
     * A beginning block value of <b>STG_TOEND</b> specifies that elements in a following block are to be repeated after each stream has been completely read.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
