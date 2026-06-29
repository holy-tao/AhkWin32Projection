#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMDecoderCaps interface returns capabilities information from an MPEG decoder filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamdecodercaps
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMDecoderCaps extends IUnknown {
    /**
     * The interface identifier for IAMDecoderCaps
     * @type {Guid}
     */
    static IID := Guid("{c0dff467-d499-4986-972b-e1d9090fa941}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMDecoderCaps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDecoderCaps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMDecoderCaps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDecoderCaps method queries the decoder for its capabilities.
     * @remarks
     * The DVD Graph Builder uses this method when it builds a DVD graph. If the decoder does not support the Video Mixing Renderer filter, then the DVD Graph Builder uses the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter instead.
     * @param {Integer} dwCapIndex Specifies the capability being queried for.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *                 </th>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_VMR_SUPPORT</td>
     * <td>0x00000001</td>
     * <td>Video Mixing Renderer Filter 7 (VMR-7) support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_DXVA_1_SUPPORT</td>
     * <td>0x00000002</td>
     * <td>DirectX Video Acceleration support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_DVD_SUPPORT</td>
     * <td>0x00000003</td>
     * <td>DVD Video support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_ATSC_SD_SUPPORT</td>
     * <td>0x00000004</td>
     * <td>Standard-definition (SD) ATSC video support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_ATSC_HD_SUPPORT</td>
     * <td>0x00000005</td>
     * <td>High-definition (HD) ATSC video support</td>
     * </tr>
     * <tr>
     * <td>AM_GETDECODERCAP_QUERY_VMR9_SUPPORT</td>
     * <td>0x00000006</td>
     * <td>Video Mixing Renderer Filter 9 (VMR-9) support</td>
     * </tr>
     * <tr>
     * <td>AM_GETDECODERCAP_QUERY_EVR_SUPPORT</td>
     * <td>0x00000007</td>
     * <td>Enhanced Video Renderer (EVR) support.</td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdecodercaps-getdecodercaps
     */
    GetDecoderCaps(dwCapIndex) {
        result := ComCall(3, this, "uint", dwCapIndex, "uint*", &lpdwCap := 0, "HRESULT")
        return lpdwCap
    }

    Query(iid) {
        if (IAMDecoderCaps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDecoderCaps := CallbackCreate(GetMethod(implObj, "GetDecoderCaps"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDecoderCaps)
    }
}
