#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Output structure for the DeviceDsmAction_Allocation action of the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @remarks
 * 
 * Provisioning state information is returned when the <b>Action</b> member of the 
 *      <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_manage_data_set_attributes">DEVICE_MANAGE_DATA_SET_ATTRIBUTES</a> 
 *      structure is set to <b>DeviceDsmAction_Allocation</b>. The caller should include only one data 
 *      set range in the system buffer at <b>DataSetRangesOffset</b>.
 * 
 * On return, the system buffer contains a 
 *      <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_manage_data_set_attributes">DEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT</a> 
 *      structure followed by the 
 *      <b>DEVICE_DATA_SET_LB_PROVISIONING_STATE</b> 
 *      structure. The 
 *      <b>DEVICE_DATA_SET_LB_PROVISIONING_STATE</b> 
 *      structure begins at an offset from the beginning of the system buffer specified by 
 *      <b>OutputBlockOffset</b> in 
 *      <b>DEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT</b>.
 * 
 * Each bit in the allocation bitmap represents a slab mapping within the data set range requested. The bits 
 *      correspond directly to the slabs in the data set range. This means that bit 0 in the bitmap marks the first slab 
 *      in the range. A slab is mapped if the bit value = 1 and unmapped if the bit value = 0.
 * 
 * Space for <b>SlabAllocationBitMap</b> should be allocated based on the number of possible 
 *      slabs in the requested data set range. The <b>SlabAllocationBitMapLength</b> of the bitmap 
 *      returned is 
 *      <c>(number_of_slabs / 32) + ((number_of_slabs MOD 32) &gt; 0 ? 1 : 0)</c>.
 * 
 * Slab size is determined by the <b>OptimalUnmapGranularity</b> member of 
 *      the <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_lb_provisioning_descriptor">DEVICE_LB_PROVISIONING_DESCRIPTOR</a> 
 *      structure returned from an 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> 
 *      control code. The length of the data set range provided should be a multiple of 
 *      <b>OptimalUnmapGranularity</b>. When the range length is not a multiple of 
 *      <b>OptimalUnmapGranularity</b>, it is reduced to be a multiple.
 * 
 * If the starting offset in the data set range is not aligned on a slab boundary, a multiple of 
 *      <b>OptimalUnmapGranularity</b>, the offset will be adjusted to the next boundary. The 
 *      difference between the requested offset and the adjusted offset is returned in 
 *      <b>SlabOffsetDeltaInBytes</b>.
 * 
 * If the slab allocation total returned in <b>SlabAllocationBitMapBitCount</b> is not as 
 *      expected because of data set range alignment or length adjustments, an additional request may be submitted with a 
 *      data set range modified according to the values in both <b>SlabAllocationBitMapBitCount</b> 
 *      and <b>SlabOffsetDeltaInBytes</b>. The new range will properly select the slabs left out of 
 *      the bitmap returned by the previous request.
 * 
 * If the requested slab size is too large (for example if it is larger than the maximum transfer length of the 
 *     HBA) then the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_manage_data_set_attributes">IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES</a> 
 *     can fail with <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_data_set_lb_provisioning_state
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DATA_SET_LB_PROVISIONING_STATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of this structure, including the bitmap, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version of this structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of a slab, in bytes.
     * @type {Integer}
     */
    SlabSizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the range specified is not aligned to the <b>OptimalUnmapGranularity</b> as returned 
     *       in <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_lb_provisioning_descriptor">DEVICE_LB_PROVISIONING_DESCRIPTOR</a> 
     *       structure then the data represented in the <b>SlabAllocationBitMap</b> is offset from the 
     *       specified range by this amount.
     * @type {Integer}
     */
    SlabOffsetDeltaInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of relevant bits in the bitmap.
     * @type {Integer}
     */
    SlabAllocationBitMapBitCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of<b> DWORD</b>s in the bitmap array.
     * @type {Integer}
     */
    SlabAllocationBitMapLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The allocation bitmap containing one bit for each slab. If a bit is set then the corresponding slab is allocated. Otherwise, if a bit is clear, the corresponding slab is unallocated.
     * @type {Array<UInt32>}
     */
    SlabAllocationBitMap{
        get {
            if(!this.HasProp("__SlabAllocationBitMapProxyArray"))
                this.__SlabAllocationBitMapProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "uint")
            return this.__SlabAllocationBitMapProxyArray
        }
    }
}
