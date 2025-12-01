#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information about a heap element.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-process_heap_entry
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class PROCESS_HEAP_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A pointer to the data portion of the heap element.
     * 
     * To initiate a <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> heap enumeration, set 
     *        <b>lpData</b> to <b>NULL</b>.
     * 
     * If <b>PROCESS_HEAP_REGION</b> is used in the <b>wFlags</b> member, 
     *        <b>lpData</b> points to the first virtual address used by the region.
     * 
     * If <b>PROCESS_HEAP_UNCOMMITTED_RANGE</b> is used in <b>wFlags</b>, 
     *        <b>lpData</b> points to the beginning of the range of uncommitted memory.
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the data portion of the heap element, in bytes.
     * 
     * If <b>PROCESS_HEAP_REGION</b> is used in <b>wFlags</b>, 
     *        <b>cbData</b> specifies the total size, in bytes, of the address space that is reserved for 
     *        this region.
     * 
     * If <b>PROCESS_HEAP_UNCOMMITTED_RANGE</b> is used in <b>wFlags</b>, 
     *        <b>cbData</b> specifies the size, in bytes, of the range of uncommitted memory.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the data used by the system to maintain information about the heap element, in bytes. These 
     *        overhead bytes are in addition to the <b>cbData</b> bytes of the data portion of the heap 
     *        element.
     * 
     * If <b>PROCESS_HEAP_REGION</b> is used in <b>wFlags</b>, 
     *        <b>cbOverhead</b> specifies the size, in bytes, of the heap control structures that 
     *        describe the region.
     * 
     * If <b>PROCESS_HEAP_UNCOMMITTED_RANGE</b> is used in <b>wFlags</b>, 
     *        <b>cbOverhead</b> specifies the size, in bytes, of the control structures that describe 
     *        this uncommitted range.
     * @type {Integer}
     */
    cbOverhead {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * A handle to the heap region that contains the heap element. A heap consists of one or more regions of virtual 
     *        memory, each with a unique region index.
     * 
     * In the first heap entry returned for most heap regions, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> uses the 
     *        <b>PROCESS_HEAP_REGION</b> in the <b>wFlags</b> member. When this value 
     *        is used, the members of the <b>Region</b> structure contain additional information 
     *        about the region.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function sometimes uses the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function to allocate large blocks from a 
     *        growable heap. The heap manager treats such a large block allocation as a separate region with a unique region 
     *        index. <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapwalk">HeapWalk</a> does not use 
     *        <b>PROCESS_HEAP_REGION</b> in the heap entry returned for a large block region, so the 
     *        members of the <b>Region</b> structure are not valid. You can use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualquery">VirtualQuery</a> function to get additional information 
     *        about a large block region.
     * @type {Integer}
     */
    iRegionIndex {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * The properties of the heap element. Some values affect the meaning of other members of this 
     *        <b>PROCESS_HEAP_ENTRY</b> data structure. The 
     *        following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_HEAP_ENTRY_BUSY"></a><a id="process_heap_entry_busy"></a><dl>
     * <dt><b>PROCESS_HEAP_ENTRY_BUSY</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The heap element is an allocated block.
     * 
     * If <b>PROCESS_HEAP_ENTRY_MOVEABLE</b> is also specified, the 
     *          <b>Block</b> structure becomes valid. The <b>hMem</b> member of 
     *          the <b>Block</b> structure contains a handle to the allocated, moveable memory 
     *          block.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_HEAP_ENTRY_DDESHARE"></a><a id="process_heap_entry_ddeshare"></a><dl>
     * <dt><b>PROCESS_HEAP_ENTRY_DDESHARE</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value must be used with <b>PROCESS_HEAP_ENTRY_BUSY</b>, indicating that the heap 
     *         element is an allocated block.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_HEAP_ENTRY_MOVEABLE"></a><a id="process_heap_entry_moveable"></a><dl>
     * <dt><b>PROCESS_HEAP_ENTRY_MOVEABLE</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value must be used with <b>PROCESS_HEAP_ENTRY_BUSY</b>, indicating that the heap 
     *          element is an allocated block.
     * 
     * The block was allocated with <b>LMEM_MOVEABLE</b> or 
     *          <b>GMEM_MOVEABLE</b>, and the <b>Block</b> structure becomes 
     *          valid. The <b>hMem</b> member of the <b>Block</b> structure 
     *          contains a handle to the allocated, moveable memory block.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_HEAP_REGION"></a><a id="process_heap_region"></a><dl>
     * <dt><b>PROCESS_HEAP_REGION</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The heap element is located at the beginning of a region of contiguous virtual memory in use by the heap.
     * 
     * The <b>lpData</b> member of the structure points to the first virtual address used by 
     *          the region; the <b>cbData</b> member specifies the total size, in bytes, of the address 
     *          space that is reserved for this region; and the <b>cbOverhead</b> member specifies the 
     *          size, in bytes, of the heap control structures that describe the region.
     * 
     * The <b>Region</b> structure becomes valid. The 
     *          <b>dwCommittedSize</b>, <b>dwUnCommittedSize</b>, 
     *          <b>lpFirstBlock</b>, and <b>lpLastBlock</b> members of the structure 
     *          contain additional information about the region.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_HEAP_UNCOMMITTED_RANGE"></a><a id="process_heap_uncommitted_range"></a><dl>
     * <dt><b>PROCESS_HEAP_UNCOMMITTED_RANGE</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The heap element is located in a range of uncommitted memory within the heap region.
     * 
     * The <b>lpData</b> member points to the beginning of the range of uncommitted memory; 
     *          the <b>cbData</b> member specifies the size, in bytes, of the range of uncommitted 
     *          memory; and the <b>cbOverhead</b> member specifies the size, in bytes, of the control 
     *          structures that describe this uncommitted range.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    class _Block extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        hMem{
            get {
                if(!this.HasProp("__hMem"))
                    this.__hMem := HANDLE(0, this)
                return this.__hMem
            }
        }
    
        /**
         * @type {Array<UInt32>}
         */
        dwReserved{
            get {
                if(!this.HasProp("__dwReservedProxyArray"))
                    this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "uint")
                return this.__dwReservedProxyArray
            }
        }
    
    }

    class _Region extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwCommittedSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwUnCommittedSize {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        lpFirstBlock {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        lpLastBlock {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {_Block}
     */
    Block{
        get {
            if(!this.HasProp("__Block"))
                this.__Block := %this.__Class%._Block(16, this)
            return this.__Block
        }
    }

    /**
     * @type {_Region}
     */
    Region{
        get {
            if(!this.HasProp("__Region"))
                this.__Region := %this.__Class%._Region(16, this)
            return this.__Region
        }
    }
}
