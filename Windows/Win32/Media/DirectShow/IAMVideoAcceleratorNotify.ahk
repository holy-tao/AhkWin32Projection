#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoAcceleratorNotify interface is a callback interface used in conjunction with the IAMVideoAccelerator interface.
 * @see https://docs.microsoft.com/windows/win32/api//videoacc/nn-videoacc-iamvideoacceleratornotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoAcceleratorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoAcceleratorNotify
     * @type {Guid}
     */
    static IID => Guid("{256a6a21-fbad-11d1-82bf-00a0c9696c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUncompSurfacesInfo", "SetUncompSurfacesInfo", "GetCreateVideoAcceleratorData"]

    /**
     * The GetUncompSurfacesInfo method queries the decoder for the number of uncompressed surfaces to allocate and the pixel format.
     * @param {Pointer<Guid>} pGuid Pointer to a GUID that specifies the DXVA profile in use.
     * @param {Pointer<AMVAUncompBufferInfo>} pUncompBufferInfo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvauncompbufferinfo">AMVAUncompBufferInfo</a> structure. The decoder fills in this structure with the decoder's requirements for the minimum and maximum number of surfaces and the pixel format.
     * 
     * To get the list of supported pixel formats, the decoder should call <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getuncompformatssupported">IAMVideoAccelerator::GetUncompFormatsSupported</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface. <b>HRESULT</b> can include one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//videoacc/nf-videoacc-iamvideoacceleratornotify-getuncompsurfacesinfo
     */
    GetUncompSurfacesInfo(pGuid, pUncompBufferInfo) {
        result := ComCall(3, this, "ptr", pGuid, "ptr", pUncompBufferInfo, "HRESULT")
        return result
    }

    /**
     * The SetUncompSurfacesInfo method notifies the decoder of how many uncompressed surfaces were created.
     * @param {Integer} dwActualUncompSurfacesAllocated The number of surfaces allocated.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface. <b>HRESULT</b> can include one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//videoacc/nf-videoacc-iamvideoacceleratornotify-setuncompsurfacesinfo
     */
    SetUncompSurfacesInfo(dwActualUncompSurfacesAllocated) {
        result := ComCall(4, this, "uint", dwActualUncompSurfacesAllocated, "HRESULT")
        return result
    }

    /**
     * The GetCreateVideoAcceleratorData method gets information needed to create a video accelerator object.
     * @param {Pointer<Guid>} pGuid Pointer to a GUID that specifies the DXVA profile in use.
     * @param {Pointer<Integer>} pdwSizeMiscData Receives the size of the data returned in <i>ppMiscData</i>, in bytes.
     * @param {Pointer<Pointer<Void>>} ppMiscData Receives a pointer to a buffer that contains a <b>DXVA_ConnectMode</b>structure. The decoder must call <b>CoTaskMemAlloc</b> to allocate the memory for the structure. The caller must free the memory by calling <b>CoTaskMemFree</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface. <b>HRESULT</b> can include one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//videoacc/nf-videoacc-iamvideoacceleratornotify-getcreatevideoacceleratordata
     */
    GetCreateVideoAcceleratorData(pGuid, pdwSizeMiscData, ppMiscData) {
        pdwSizeMiscDataMarshal := pdwSizeMiscData is VarRef ? "uint*" : "ptr"
        ppMiscDataMarshal := ppMiscData is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pGuid, pdwSizeMiscDataMarshal, pdwSizeMiscData, ppMiscDataMarshal, ppMiscData, "HRESULT")
        return result
    }
}
