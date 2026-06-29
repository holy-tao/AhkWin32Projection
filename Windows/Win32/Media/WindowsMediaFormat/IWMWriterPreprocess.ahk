#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMWriterPreprocess interface handles multi-pass encoding.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriterpreprocess
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterPreprocess extends IUnknown {
    /**
     * The interface identifier for IWMWriterPreprocess
     * @type {Guid}
     */
    static IID := Guid("{fc54a285-38c4-45b5-aa23-85b9f7cb424b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterPreprocess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMaxPreprocessingPasses : IntPtr
        SetNumPreprocessingPasses : IntPtr
        BeginPreprocessingPass    : IntPtr
        PreprocessSample          : IntPtr
        EndPreprocessingPass      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterPreprocess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMaxPreprocessingPasses method retrieves the maximum number of preprocessing passes for a specified input stream.
     * @remarks
     * If no preprocessing is supported for the specified input, <i>pdwMaxNumPasses</i> contains zero upon return.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number for which you want to get the maximum number of preprocessing passes.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {Integer} Pointer to a <b>DWORD</b> that will receive the maximum number of preprocessing passes. If the codec supports two-pass encoding, this value is 1, as the final pass is not counted.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-getmaxpreprocessingpasses
     */
    GetMaxPreprocessingPasses(dwInputNum, dwFlags) {
        result := ComCall(3, this, "uint", dwInputNum, "uint", dwFlags, "uint*", &pdwMaxNumPasses := 0, "HRESULT")
        return pdwMaxNumPasses
    }

    /**
     * The SetNumPreprocessingPasses method sets the number of passes to perform on an input.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number for which you want to set the number of passes.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @param {Integer} dwNumPasses <b>DWORD</b> containing the number of preprocessing passes.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwNumPasses</i> is zero.
     * 
     * OR
     * 
     * <i>dwInputNum</i> specifies an invalid input stream.
     * 
     * OR
     * 
     * <i>dwNumPasses</i> is greater than the maximum number of passes allowed for the specified input.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not running.
     * 
     * OR
     * 
     * The preprocessor has already been configured.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses
     */
    SetNumPreprocessingPasses(dwInputNum, dwFlags, dwNumPasses) {
        result := ComCall(4, this, "uint", dwInputNum, "uint", dwFlags, "uint", dwNumPasses, "HRESULT")
        return result
    }

    /**
     * The BeginPreprocessingPass method prepares the writer to begin preprocessing samples for the specified input stream.
     * @remarks
     * To successfully call <b>BeginPreprocessingPass</b>, the preprocessor must be set to make at least one preprocessing pass with a call to <b>SetNumPreprocessingPasses</b>.
     * 
     * The writer must be activated by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a> before you can call this method.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number that you want to preprocess.
     * @param {Integer} dwFlags Reserved. Set to zero.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwInputNum</i> specifies an invalid input number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not running.
     * 
     * OR
     * 
     * The preprocessor is neither waiting to be run nor stopped in the middle of a pass.
     * 
     * OR
     * 
     * The preprocessor has already made as many passes as specified by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses">SetNumPreprocessingPasses</a>.
     * 
     * OR
     * 
     * The input specified is not supported for preprocessing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-beginpreprocessingpass
     */
    BeginPreprocessingPass(dwInputNum, dwFlags) {
        result := ComCall(5, this, "uint", dwInputNum, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The PreprocessSample method delivers a sample to the writer for preprocessing.
     * @remarks
     * When performing preprocessing, you should pass the samples for the stream to this method one at a time.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number of the sample.
     * @param {Integer} cnsSampleTime Specifies the presentation time of the sample in 100-nanosecond units.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object that contains the sample.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwInputNum</i> specifies an invalid input stream.
     * 
     * OR
     * 
     * <i>pSample</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not running.
     * 
     * OR
     * 
     * The preprocessor is neither waiting to be run nor stopped in the middle of a pass.
     * 
     * OR
     * 
     * The preprocessor has already made as many passes as specified by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses">SetNumPreprocessingPasses</a>.
     * 
     * OR
     * 
     * The input specified is not supported for preprocessing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-preprocesssample
     */
    PreprocessSample(dwInputNum, cnsSampleTime, dwFlags, pSample) {
        result := ComCall(6, this, "uint", dwInputNum, "uint", cnsSampleTime, "uint", dwFlags, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * The EndPreprocessingPass method ends a preprocessing pass started with a call to IWMWriterPreprocess::BeginPreprocessingPass.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number for which you want to halt preprocessing.
     * @param {Integer} dwFlags Reserved. Set to zero.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwInputNum</i> specifies an invalid input number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not running.
     * 
     * OR
     * 
     * The preprocessor is not started for the specified stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error ending the preprocessing path.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-endpreprocessingpass
     */
    EndPreprocessingPass(dwInputNum, dwFlags) {
        result := ComCall(7, this, "uint", dwInputNum, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMWriterPreprocess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaxPreprocessingPasses := CallbackCreate(GetMethod(implObj, "GetMaxPreprocessingPasses"), flags, 4)
        this.vtbl.SetNumPreprocessingPasses := CallbackCreate(GetMethod(implObj, "SetNumPreprocessingPasses"), flags, 4)
        this.vtbl.BeginPreprocessingPass := CallbackCreate(GetMethod(implObj, "BeginPreprocessingPass"), flags, 3)
        this.vtbl.PreprocessSample := CallbackCreate(GetMethod(implObj, "PreprocessSample"), flags, 5)
        this.vtbl.EndPreprocessingPass := CallbackCreate(GetMethod(implObj, "EndPreprocessingPass"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaxPreprocessingPasses)
        CallbackFree(this.vtbl.SetNumPreprocessingPasses)
        CallbackFree(this.vtbl.BeginPreprocessingPass)
        CallbackFree(this.vtbl.PreprocessSample)
        CallbackFree(this.vtbl.EndPreprocessingPass)
    }
}
