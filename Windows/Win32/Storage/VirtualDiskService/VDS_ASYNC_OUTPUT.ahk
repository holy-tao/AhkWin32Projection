#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_ASYNC_OUTPUT structure (vdshwprv.h) defines the output of an async object. Output elements vary depending on the operation type.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method returns this structure 
  *     and adds a reference to any contained object produced by each method. 
  *     Callers must release the reference to the contained object.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_async_output
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ASYNC_OUTPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Discriminant for the union enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_async_output_type">VDS_ASYNC_OUTPUT_TYPE</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_CREATEPARTITION"></a><a id="vds_asyncout_createpartition"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_CREATEPARTITION</b></b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>cp</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_CREATEVOLUME"></a><a id="vds_asyncout_createvolume"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_CREATEVOLUME</b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>cv</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_BREAKVOLUMEPLEX"></a><a id="vds_asyncout_breakvolumeplex"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_BREAKVOLUMEPLEX</b></b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>bvp</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_CREATELUN"></a><a id="vds_asyncout_createlun"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_CREATELUN</b></b></dt>
     * <dt>50</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>cl</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_CREATETARGET"></a><a id="vds_asyncout_createtarget"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_CREATETARGET</b></b></dt>
     * <dt>62</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>ct</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_CREATEPORTALGROUP"></a><a id="vds_asyncout_createportalgroup"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_CREATEPORTALGROUP</b></b></dt>
     * <dt>63</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>cpg</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_ASYNCOUT_CREATE_VDISK"></a><a id="vds_asyncout_create_vdisk"></a><dl>
     * <dt><b><b>VDS_ASYNCOUT_CREATE_VDISK</b></b></dt>
     * <dt>200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the following description of the <b>cvd</b> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ullOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pVolumeUnk {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    sv {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pLunUnk {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pTargetUnk {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pPortalGroupUnk {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pVDiskUnk {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
