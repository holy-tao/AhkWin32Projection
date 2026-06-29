#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_ASYNC_OUTPUT_TYPE.ahk" { VDS_ASYNC_OUTPUT_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_ASYNC_OUTPUT structure (vdshwprv.h) defines the output of an async object. Output elements vary depending on the operation type.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method returns this structure 
 *     and adds a reference to any contained object produced by each method. 
 *     Callers must release the reference to the contained object.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_async_output
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ASYNC_OUTPUT {
    #StructPack 8


    struct _cp {
        ullOffset : Int64

        volumeId : Guid

    }

    struct _cv {
        pVolumeUnk : IUnknown

    }

    struct _bvp {
        pVolumeUnk : IUnknown

    }

    struct _sv {
        ullReclaimedBytes : Int64

    }

    struct _cl {
        pLunUnk : IUnknown

    }

    struct _ct {
        pTargetUnk : IUnknown

    }

    struct _cpg {
        pPortalGroupUnk : IUnknown

    }

    struct _cvd {
        pVDiskUnk : IUnknown

    }

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
     */
    type : VDS_ASYNC_OUTPUT_TYPE

    cp : VDS_ASYNC_OUTPUT._cp

    static __New() {
        DefineProp(this.Prototype, 'cv', { type: VDS_ASYNC_OUTPUT._cv, offset: 8 })
        DefineProp(this.Prototype, 'bvp', { type: VDS_ASYNC_OUTPUT._bvp, offset: 8 })
        DefineProp(this.Prototype, 'sv', { type: VDS_ASYNC_OUTPUT._sv, offset: 8 })
        DefineProp(this.Prototype, 'cl', { type: VDS_ASYNC_OUTPUT._cl, offset: 8 })
        DefineProp(this.Prototype, 'ct', { type: VDS_ASYNC_OUTPUT._ct, offset: 8 })
        DefineProp(this.Prototype, 'cpg', { type: VDS_ASYNC_OUTPUT._cpg, offset: 8 })
        DefineProp(this.Prototype, 'cvd', { type: VDS_ASYNC_OUTPUT._cvd, offset: 8 })
        this.DeleteProp("__New")
    }
}
