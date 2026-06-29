#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the &quot;leaky bucket&quot; parameters on a video encoder.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecleakybucket
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMCodecLeakyBucket extends IUnknown {
    /**
     * The interface identifier for IWMCodecLeakyBucket
     * @type {Guid}
     */
    static IID := Guid("{a81ba647-6227-43b7-b231-c7b15135dd7d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMCodecLeakyBucket interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBufferSizeBits     : IntPtr
        GetBufferSizeBits     : IntPtr
        SetBufferFullnessBits : IntPtr
        GetBufferFullnessBits : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMCodecLeakyBucket.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the buffer size in bits.
     * @remarks
     * This method is not implemented on the audio encoder objects. If you call this method from the <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecleakybucket">IWMCodecLeakyBucket</a> interface it returns E_NOTIMPL.
     * 
     * The buffer size is equal to the bit rate of the stream multiplied by the buffer window. For example, a stream with a bit rate of 28 kilobits per second with a buffer window of 3 seconds would have a buffer of 28000 bits per second x 3 seconds = 84000 bits.
     * 
     * This method is an alternative to setting the MFPKEY_VIDEOWINDOW property. Using this method does not alter the bit rate of the stream, but does alter the buffer window. Using the stream with a bit rate of 28000 bits per second from the previous example, setting the buffer size to 84000 using this method would have exactly the same effect as setting <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-videowindowproperty">MFPKEY_VIDEOWINDOW</a> to 3000 milliseconds (3 seconds).
     * @param {Integer} ulBufferSize The buffer size, in bits.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-setbuffersizebits
     */
    SetBufferSizeBits(ulBufferSize) {
        result := ComCall(3, this, "uint", ulBufferSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the current size of the buffer in bits.
     * @remarks
     * The buffer size is equal to the bit rate of the stream multiplied by the buffer window. For example, a stream with a bit rate of 28 kilobits per second with a buffer window of 3 seconds would have a buffer of 28000 bits per second x 3 seconds = 84000 bits.
     * @param {Pointer<Integer>} pulBufferSize Pointer to a variable containing the buffer size, in bits.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-getbuffersizebits
     */
    GetBufferSizeBits(pulBufferSize) {
        pulBufferSizeMarshal := pulBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulBufferSizeMarshal, pulBufferSize, "HRESULT")
        return result
    }

    /**
     * Not implemented in this release. (IWMCodecLeakyBucket.SetBufferFullnessBits)
     * @param {Integer} ulBufferFullness 
     * @returns {HRESULT} This method always returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-setbufferfullnessbits
     */
    SetBufferFullnessBits(ulBufferFullness) {
        result := ComCall(5, this, "uint", ulBufferFullness, "HRESULT")
        return result
    }

    /**
     * Not implemented in this release. (IWMCodecLeakyBucket.GetBufferFullnessBits)
     * @param {Pointer<Integer>} pulBufferFullness 
     * @returns {HRESULT} This method always returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-getbufferfullnessbits
     */
    GetBufferFullnessBits(pulBufferFullness) {
        pulBufferFullnessMarshal := pulBufferFullness is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulBufferFullnessMarshal, pulBufferFullness, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMCodecLeakyBucket.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBufferSizeBits := CallbackCreate(GetMethod(implObj, "SetBufferSizeBits"), flags, 2)
        this.vtbl.GetBufferSizeBits := CallbackCreate(GetMethod(implObj, "GetBufferSizeBits"), flags, 2)
        this.vtbl.SetBufferFullnessBits := CallbackCreate(GetMethod(implObj, "SetBufferFullnessBits"), flags, 2)
        this.vtbl.GetBufferFullnessBits := CallbackCreate(GetMethod(implObj, "GetBufferFullnessBits"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBufferSizeBits)
        CallbackFree(this.vtbl.GetBufferSizeBits)
        CallbackFree(this.vtbl.SetBufferFullnessBits)
        CallbackFree(this.vtbl.GetBufferFullnessBits)
    }
}
