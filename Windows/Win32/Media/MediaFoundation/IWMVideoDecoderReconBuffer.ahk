#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\DxMediaObjects\IMediaBuffer.ahk" { IMediaBuffer }

/**
 * Note  This interface is obsolete and should not be used. Manages reconstructed video frames.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmvideodecoderreconbuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMVideoDecoderReconBuffer extends IUnknown {
    /**
     * The interface identifier for IWMVideoDecoderReconBuffer
     * @type {Guid}
     */
    static IID := Guid("{45bda2ac-88e2-4923-98ba-3949080711a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMVideoDecoderReconBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetReconstructedVideoFrameSize : IntPtr
        GetReconstructedVideoFrame     : IntPtr
        SetReconstructedVideoFrame     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMVideoDecoderReconBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This method is obsolete and should not be used. Retrieves the size of the current reconstructed video frame.
     * @param {Pointer<Integer>} pdwSize Address of a variable that receives the frame size in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderreconbuffer-getreconstructedvideoframesize
     */
    GetReconstructedVideoFrameSize(pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * Note  This method is obsolete and should not be used. Retrieves the current reconstructed video frame.
     * @param {IMediaBuffer} pBuf Address of a media buffer that receives the reconstructed video frame.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderreconbuffer-getreconstructedvideoframe
     */
    GetReconstructedVideoFrame(pBuf) {
        result := ComCall(4, this, "ptr", pBuf, "HRESULT")
        return result
    }

    /**
     * Note  This method is obsolete and should not be used. Restores the current reconstructed video frame.
     * @param {IMediaBuffer} pBuf Address of an IMediaBuffer interface containing the reconstructed frame to restore.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderreconbuffer-setreconstructedvideoframe
     */
    SetReconstructedVideoFrame(pBuf) {
        result := ComCall(5, this, "ptr", pBuf, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMVideoDecoderReconBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetReconstructedVideoFrameSize := CallbackCreate(GetMethod(implObj, "GetReconstructedVideoFrameSize"), flags, 2)
        this.vtbl.GetReconstructedVideoFrame := CallbackCreate(GetMethod(implObj, "GetReconstructedVideoFrame"), flags, 2)
        this.vtbl.SetReconstructedVideoFrame := CallbackCreate(GetMethod(implObj, "SetReconstructedVideoFrame"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetReconstructedVideoFrameSize)
        CallbackFree(this.vtbl.GetReconstructedVideoFrame)
        CallbackFree(this.vtbl.SetReconstructedVideoFrame)
    }
}
