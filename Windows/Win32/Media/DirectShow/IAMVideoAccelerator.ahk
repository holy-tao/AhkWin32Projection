#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk
#Include .\AMVACompBufferInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoAccelerator interface enables a video decoder filter to access DirectX Video Acceleration (DXVA) 1.0 functionality.
 * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nn-videoacc-iamvideoaccelerator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoAccelerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoAccelerator
     * @type {Guid}
     */
    static IID => Guid("{256a6a22-fbad-11d1-82bf-00a0c9696c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoAcceleratorGUIDs", "GetUncompFormatsSupported", "GetInternalMemInfo", "GetCompBufferInfo", "GetInternalCompBufferInfo", "BeginFrame", "EndFrame", "GetBuffer", "ReleaseBuffer", "Execute", "QueryRenderStatus", "DisplayFrame"]

    /**
     * The GetVideoAcceleratorGUIDs method gets a list of DirectX Video Acceleration (DXVA) profiles supported by the display driver.
     * @remarks
     * Call this method twice. On the first call, set <i>pGuidsSupported</i> to <b>NULL</b>. The <i>pdwNumGuidsSupported</i> parameter receives the number of DXVA profile GUIDs. Allocate an array of GUIDs with the required size and call the method again. This time, set <i>pGuidsSupported</i> to the address of the array. The method fills the array with the list of DXVA profile GUIDs.
     * @param {Pointer<Integer>} pdwNumGuidsSupported On input, specifies the number of elements in the <i>pGuidsSupported</i> array.
     *             If <i>pGuidsSupported</i> is <b>NULL</b>, the value of <c>*pdwNumGuidsSupported</c> must be zero. 
     * 
     * On output, if <i>pGuidsSupported</i> is <b>NULL</b>, <i>pdwNumGuidsSupported</i> receives the number of restricted-mode DXVA profiles. Otherwise, <i>pdwNumGuidsSupported</i> receives the actual number of GUIDs copied to the <i>pGuidsSupported</i> array.
     * @returns {Guid} Address of an array of GUIDs, or <b>NULL</b>. If the value is non-<b>NULL</b>, the array receives a list of GUIDs that specify restricted-mode DXVA profiles. These GUIDs are defined in the header file dxva.h, and are documented in the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/directx-video-acceleration">DXVA 1.0 specification</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-getvideoacceleratorguids
     */
    GetVideoAcceleratorGUIDs(pdwNumGuidsSupported) {
        pdwNumGuidsSupportedMarshal := pdwNumGuidsSupported is VarRef ? "uint*" : "ptr"

        pGuidsSupported := Guid()
        result := ComCall(3, this, pdwNumGuidsSupportedMarshal, pdwNumGuidsSupported, "ptr", pGuidsSupported, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pGuidsSupported
    }

    /**
     * The GetUncompFormatsSupported method gets a list of uncompressed pixel formats that can be rendered using a specified DirectX Video Acceleration (DXVA) profile.
     * @remarks
     * Call this method twice. On the first call, set <i>pFormatsSupported</i> to <b>NULL</b>. The <i>pdwNumFormatsSupported</i> parameter receives the number of formats. Allocate an array of <b>DDPIXELFORMAT</b> structures with the required size, and call the method again. This time, set <i>pFormatsSupported</i> to the address of the array. The method fills the array with the list of pixel formats.
     * 
     * The driver should return the formats in decreasing order of preference, with the most preferred format listed first.
     * @param {Pointer<Guid>} pGuid Pointer to a GUID that specifies the DXVA profile. To get a list of supported profiles, call 
     *           <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getvideoacceleratorguids">IAMVideoAccelerator::GetVideoAcceleratorGUIDs</a>.
     * @param {Pointer<Integer>} pdwNumFormatsSupported On input, specifies the number of elements in the <i>pFormatsSupported</i> array.
     *             If <i>pFormatsSupported</i> is <b>NULL</b>, the value of <c>*pdwNumFormatsSupported</c> must be zero.
     * 
     * On output, if <i>pFormatsSupported</i> is <b>NULL</b>, <i>pdwNumFormatsSupported</i> receives the number of supported pixel formats. Otherwise, <i>pdwNumFormatsSupported</i> receives the actual number of pixel formats copied to the <i>pFormatsSupported</i> array.
     * @returns {DDPIXELFORMAT} Address of an array of <b>DDPIXELFORMAT</b> structures, or <b>NULL</b>. If the value is non-<b>NULL</b>, the array receives a list of pixel formats.
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-getuncompformatssupported
     */
    GetUncompFormatsSupported(pGuid, pdwNumFormatsSupported) {
        pdwNumFormatsSupportedMarshal := pdwNumFormatsSupported is VarRef ? "uint*" : "ptr"

        pFormatsSupported := DDPIXELFORMAT()
        result := ComCall(4, this, "ptr", pGuid, pdwNumFormatsSupportedMarshal, pdwNumFormatsSupported, "ptr", pFormatsSupported, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFormatsSupported
    }

    /**
     * The GetInternalMemInfo method queries for the amount of scratch memory the hardware abstraction layer (HAL) will allocate for its private use.
     * @param {Pointer<Guid>} pGuid Pointer to a GUID that specifies the DXVA profile in use.
     * @param {Pointer<AMVAUncompDataInfo>} pamvaUncompDataInfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvauncompdatainfo">AMVAUncompDataInfo</a> structure that specifies the size and pixel format of the uncompressed data.
     * @param {Pointer<AMVAInternalMemInfo>} pamvaInternalMemInfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvainternalmeminfo">AMVAInternalMemInfo</a> structure that receives the amount of scratch memory the HAL will allocate.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-getinternalmeminfo
     */
    GetInternalMemInfo(pGuid, pamvaUncompDataInfo, pamvaInternalMemInfo) {
        result := ComCall(5, this, "ptr", pGuid, "ptr", pamvaUncompDataInfo, "ptr", pamvaInternalMemInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCompBufferInfo method gets information about the compressed buffers used for DirectX Video Acceleration (DXVA) decoding.
     * @remarks
     * The decoder can use this method to get compressed buffer information during the pin connection 
     *       process. After the pins are connected, the decoder can call <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getinternalcompbufferinfo">IAMVideoAccelerator::GetInternalCompBufferInfo</a> to get this information.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvacompbufferinfo">AMVACompBufferInfo</a> structure contains information that is needed for the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer">IAMVideoAccelerator::GetBuffer</a> method.
     * @param {Pointer<Guid>} pGuid Pointer to a GUID that specifies the DXVA profile in use.
     * @param {Pointer<AMVAUncompDataInfo>} pamvaUncompDataInfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvauncompdatainfo">AMVAUncompDataInfo</a> structure that specifies the size and pixel format of the uncompressed data.
     * @param {Pointer<Integer>} pdwNumTypesCompBuffers On input, specifies the number of elements in the <i>pamvaCompBufferInfo</i> array.
     *             If <i>pamvaCompBufferInfo</i> is <b>NULL</b>, the value of <c>*pdwNumTypesCompBuffers</c> must be zero.
     * 
     * On output, if <i>pamvaCompBufferInfo</i> is <b>NULL</b>, <i>pdwNumTypesCompBuffers</i> receives the size of array to allocate. Otherwise, <i>pdwNumTypesCompBuffers</i> receives the actual number of elements copied to the <i>pamvaCompBufferInfo</i> array.
     * @returns {AMVACompBufferInfo} Address of an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvacompbufferinfo">AMVACompBufferInfo</a> structures, or <b>NULL</b>. If the value is non-<b>NULL</b>, the method copies a list of <b>AMVACompBufferInfo</b> structures to this array. Each structure corresponds to one type of compressed data buffer used by the video accelerator.
     * 
     * Set all of the array elements to zero before calling this method.
     * 
     * Each array index corresponds to one of the DXVA surface types defined in dxva.h. The video accelerator will return a list of up to <b>DXVA_NUM_TYPES_COMP_BUFFERS</b> array entries. For details, refer to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/directx-video-acceleration">DXVA 1.0 specification</a>, section 3.4, "Buffer Description List." If a particular buffer type is not used by the DXVA profile in question, the entry at that index contains zeroes for all values.
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-getcompbufferinfo
     */
    GetCompBufferInfo(pGuid, pamvaUncompDataInfo, pdwNumTypesCompBuffers) {
        pdwNumTypesCompBuffersMarshal := pdwNumTypesCompBuffers is VarRef ? "uint*" : "ptr"

        pamvaCompBufferInfo := AMVACompBufferInfo()
        result := ComCall(6, this, "ptr", pGuid, "ptr", pamvaUncompDataInfo, pdwNumTypesCompBuffersMarshal, pdwNumTypesCompBuffers, "ptr", pamvaCompBufferInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pamvaCompBufferInfo
    }

    /**
     * The GetInternalCompBufferInfo method gets information about the compressed buffers used for DirectX Video Acceleration (DXVA) decoding.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvacompbufferinfo">AMVACompBufferInfo</a> structure contains information that is needed for the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer">IAMVideoAccelerator::GetBuffer</a> method.
     * @param {Pointer<Integer>} pdwNumTypesCompBuffers On input, specifies the number of elements in the <i>pamvaCompBufferInfo</i> array.
     *             If <i>pamvaCompBufferInfo</i> is <b>NULL</b>, the value of <c>*pdwNumTypesCompBuffers</c> must be zero.
     * 
     * On output, if <i>pamvaCompBufferInfo</i> is <b>NULL</b>, <i>pdwNumTypesCompBuffers</i> receives the size of array to allocate. Otherwise, <i>pdwNumTypesCompBuffers</i> receives the actual number of elements copied to the <i>pamvaCompBufferInfo</i> array.
     * @returns {AMVACompBufferInfo} Address of an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvacompbufferinfo">AMVACompBufferInfo</a> structures, or <b>NULL</b>. If the value is non-<b>NULL</b>, the method copies a list of <b>AMVACompBufferInfo</b> structures to this array. Each structure corresponds to one type of compressed data buffer used by the video accelerator.
     * 
     * Set all of the array elements to zero before calling this method.
     * 
     * Each array index corresponds to one of the DXVA surface types defined in dxva.h. The video accelerator will return a list of up to <b>DXVA_NUM_TYPES_COMP_BUFFERS</b> array entries. For details, refer to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/directx-video-acceleration">DXVA 1.0 specification</a>, section 3.4, "Buffer Description List." If a particular buffer type is not used by the DXVA profile in question, the entry at that index contains zeroes for all values.
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-getinternalcompbufferinfo
     */
    GetInternalCompBufferInfo(pdwNumTypesCompBuffers) {
        pdwNumTypesCompBuffersMarshal := pdwNumTypesCompBuffers is VarRef ? "uint*" : "ptr"

        pamvaCompBufferInfo := AMVACompBufferInfo()
        result := ComCall(7, this, pdwNumTypesCompBuffersMarshal, pdwNumTypesCompBuffers, "ptr", pamvaCompBufferInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pamvaCompBufferInfo
    }

    /**
     * The BeginFrame method begins the processing to create a decoded picture.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * 
     * This method might block if no frame buffer is available.
     * 
     * For each call to <b>BeginFrame</b>, the decoder must make a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-endframe">IAMVideoAccelerator::EndFrame</a>.
     * @param {Pointer<AMVABeginFrameInfo>} amvaBeginFrameInfo_ Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvabeginframeinfo">AMVABeginFrameInfo</a> structure that contains information needed to begin processing the frame.
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
     * <dt><b>E_PENDING </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The uncompressed surface is not yet available for use. For example, it is being read for display.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-beginframe
     */
    BeginFrame(amvaBeginFrameInfo_) {
        result := ComCall(8, this, "ptr", amvaBeginFrameInfo_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EndFrame method ends frame processing.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * 
     * For more information about this method, see the remarks for  <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe">IAMVideoAccelerator::BeginFrame</a>.
     * @param {Pointer<AMVAEndFrameInfo>} pEndFrameInfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvaendframeinfo">AMVAEndFrameInfo</a> structure.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-endframe
     */
    EndFrame(pEndFrameInfo) {
        result := ComCall(9, this, "ptr", pEndFrameInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetBuffer method gets a pointer to a compressed or uncompressed surface that was allocated for DirectX Video Acceleration (DXVA) decoding.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * 
     * This method locks and obtains access to a single buffer. Buffers are identified by type and by index within that type. The <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getinternalcompbufferinfo">IAMVideoAccelerator::GetInternalCompBufferInfo</a> method returns the number of surface types in its <i>pdwNumTypesCompBuffers</i> parameter. This number defines the valid range for <i>dwTypeIndex</i>. For each type, the <b>dwNumCompBuffers</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvacompbufferinfo">AMVACompBufferInfo</a> structure gives the number of buffers, which defines the valid range for <i>dwBufferIndex</i>. 
     *       
     * 
     * To release the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-releasebuffer">IAMVideoAccelerator::ReleaseBuffer</a>.
     * 
     * Until all compressed buffers are released, it is possible that the calling thread will hold the Win16 lock or the DirectDraw lock.
     * @param {Integer} dwTypeIndex Specifies the surface type:
     * 
     * <ul>
     * <li>To get a pointer to  a compressed surface, specify one of the DXVA surface types defined in dxva.h. </li>
     * <li>To get a pointer to an uncompressed output surface, set this parameter to 0xFFFFFFFF. </li>
     * </ul>
     * The value 0xFFFFFFFF is valid only between calls to <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe">IAMVideoAccelerator::BeginFrame</a> and <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-endframe">IAMVideoAccelerator::EndFrame</a>.
     * @param {Integer} dwBufferIndex The zero-based index of the surface, within the pool of surfaces that were allocated  for the specified surface type.
     * 
     * <ul>
     * <li>Compressed surfaces: To get the number of allocated surfaces for each surface type, call <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getinternalcompbufferinfo">IAMVideoAccelerator::GetInternalCompBufferInfo</a>.</li>
     * <li>Uncompressed surfaces: The buffer index must equal the <b>dwDestSurfaceIndex</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvabeginframeinfo">AMVABeginFrameInfo</a> structure that was passed to the most recent <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe">IAMVideoAccelerator::BeginFrame</a> call.</li>
     * </ul>
     * @param {BOOL} bReadOnly Specifies whether the decoder will write to the surface memory. For read-only access, specify <b>TRUE</b>. This might allow faster access to reference frames that are currently in use.
     * @param {Pointer<Pointer<Void>>} ppBuffer Receives a pointer to the surface memory. To get the size of the buffer in bytes, call the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getinternalcompbufferinfo">IAMVideoAccelerator::GetInternalCompBufferInfo</a> method. The size is given in the <b>dwBytesToAllocate</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvacompbufferinfo">AMVACompBufferInfo</a> structure that corresponds to <i>dwTypeIndex</i>.
     * @param {Pointer<Integer>} lpStride Receives the surface stride, in bytes.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer
     */
    GetBuffer(dwTypeIndex, dwBufferIndex, bReadOnly, ppBuffer, lpStride) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        lpStrideMarshal := lpStride is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "int", bReadOnly, ppBufferMarshal, ppBuffer, lpStrideMarshal, lpStride, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReleaseBuffer method releases a buffer that was locked by a previous call to IAMVideoAccelerator::GetBuffer.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * 
     * This method unlocks a single buffer. The video decoder calls this method when the buffer is no longer required, after any calls to <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-execute">IAMVideoAccelerator::Execute</a> have been made using that buffer.
     * 
     * The buffer pointer obtained from <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer">GetBuffer</a> is no longer valid after this call.
     * @param {Integer} dwTypeIndex The surface type of the buffer. Use the same value that was passed to the <i>dwTypeIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer">GetBuffer</a> method.
     * @param {Integer} dwBufferIndex The zero-based index of the buffer. Use the same value that was passed to the <i>dwBufferIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer">GetBuffer</a> method.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-releasebuffer
     */
    ReleaseBuffer(dwTypeIndex, dwBufferIndex) {
        result := ComCall(11, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Execute method performs a DirectX Video Acceleration (DXVA) decoding operation.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * 
     * The associated buffer list is passed along with a function number (defaulting to zero) and any necessary private data describing the decompression operation. For example, decompressed reference frame information is passed in the buffer list. The buffer list order is important and is defined by the particular decompression operation being performed.
     *       
     * 
     * Private data can be passed to and from a driver.
     * @param {Integer} dwFunction Contains one or more 
     *             DXVA function numbers.
     * @param {Pointer<Void>} lpPrivateInputData Pointer to input data for the decoding operation. The meaning of this data depends on the surface type and function number. For details, refer to the DXVA 1.0 specification.
     * @param {Integer} cbPrivateInputData Size of the input data, in bytes.
     * @param {Pointer<Void>} lpPrivateOutputDat Pointer to a buffer where the video accelerator will write output data.
     * @param {Integer} cbPrivateOutputData Size of the <i>lpPrivateOutputData</i> buffer, in bytes.
     * @param {Integer} dwNumBuffers Number of elements in the <i>pamvaBufferInfo</i> array.
     * @param {Pointer<AMVABUFFERINFO>} pamvaBufferInfo Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amva/ns-amva-amvabufferinfo">AMVABUFFERINFO</a> structures.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-execute
     */
    Execute(dwFunction, lpPrivateInputData, cbPrivateInputData, lpPrivateOutputDat, cbPrivateOutputData, dwNumBuffers, pamvaBufferInfo) {
        lpPrivateInputDataMarshal := lpPrivateInputData is VarRef ? "ptr" : "ptr"
        lpPrivateOutputDatMarshal := lpPrivateOutputDat is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "uint", dwFunction, lpPrivateInputDataMarshal, lpPrivateInputData, "uint", cbPrivateInputData, lpPrivateOutputDatMarshal, lpPrivateOutputDat, "uint", cbPrivateOutputData, "uint", dwNumBuffers, "ptr", pamvaBufferInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The QueryRenderStatus method queries the read/write status of a DirectX Video Acceleration (DXVA) decoding surface.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * @param {Integer} dwTypeIndex Specifies the type of surface to query: 
     * 
     * <ul>
     * <li>For a compressed surface, specify one of the DXVA surface types defined in dxva.h. </li>
     * <li>For an uncompressed output surface, set this parameter to 0xFFFFFFFF. </li>
     * </ul>
     * @param {Integer} dwBufferIndex The zero-based index of the surface, within the pool of surfaces that were allocated  for the specified surface type.
     * @param {Integer} dwFlags Specifies the type of query to perform.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Zero"></a><a id="zero"></a><a id="ZERO"></a><dl>
     * <dt><b>Zero</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test whether the surface is safe to use for writing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AMVA_QUERYRENDERSTATUSF_READ"></a><a id="amva_queryrenderstatusf_read"></a><dl>
     * <dt><b><b>AMVA_QUERYRENDERSTATUSF_READ</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test whether the surface is safe to use for reading.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is still in progress.
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
     * The operation is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-queryrenderstatus
     */
    QueryRenderStatus(dwTypeIndex, dwBufferIndex, dwFlags) {
        result := ComCall(13, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DisplayFrame method causes the video renderer to display a decoded frame.
     * @remarks
     * If the filter's pins are not connected, the method returns <b>VFW_E_NOT_CONNECTED</b>.
     * 
     * The method blocks until the video renderer finishes displaying the video frame.
     *       
     * 
     * The video decoder calls this method after calling <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-endframe">IAMVideoAccelerator::EndFrame</a> for the surface whose index is given in <i>dwFlipToIndex</i>. The index value must match the value of <b>AMVABeginFrameInfo.dwDestSurfaceIndex</b> in a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe">IAMVideoAccelerator::BeginFrame</a>.
     * @param {Integer} dwFlipToIndex The surface index of the decoded frame to display.
     * @param {IMediaSample} pMediaSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface of a media sample. This sample does not contain a video frame, but is used to specify the time stamp and any sample flags. (For more information about sample flags, see <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-am_sample2_properties">AM_SAMPLE2_PROPERTIES</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDSUBTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder did not use a DXVA decoding type when it connected to the video renderer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins on the decoder and video renderer filters are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/videoacc/nf-videoacc-iamvideoaccelerator-displayframe
     */
    DisplayFrame(dwFlipToIndex, pMediaSample) {
        result := ComCall(14, this, "uint", dwFlipToIndex, "ptr", pMediaSample, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
