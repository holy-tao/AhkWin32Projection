#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterPreprocess interface handles multi-pass encoding.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterpreprocess
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPreprocess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterPreprocess
     * @type {Guid}
     */
    static IID => Guid("{fc54a285-38c4-45b5-aa23-85b9f7cb424b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxPreprocessingPasses", "SetNumPreprocessingPasses", "BeginPreprocessingPass", "PreprocessSample", "EndPreprocessingPass"]

    /**
     * The GetMaxPreprocessingPasses method retrieves the maximum number of preprocessing passes for a specified input stream.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number for which you want to get the maximum number of preprocessing passes.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {Integer} Pointer to a <b>DWORD</b> that will receive the maximum number of preprocessing passes. If the codec supports two-pass encoding, this value is 1, as the final pass is not counted.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-getmaxpreprocessingpasses
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses
     */
    SetNumPreprocessingPasses(dwInputNum, dwFlags, dwNumPasses) {
        result := ComCall(4, this, "uint", dwInputNum, "uint", dwFlags, "uint", dwNumPasses, "HRESULT")
        return result
    }

    /**
     * The BeginPreprocessingPass method prepares the writer to begin preprocessing samples for the specified input stream.
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
     * The preprocessor has already made as many passes as specified by <a href="/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses">SetNumPreprocessingPasses</a>.
     * 
     * OR
     * 
     * The input specified is not supported for preprocessing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-beginpreprocessingpass
     */
    BeginPreprocessingPass(dwInputNum, dwFlags) {
        result := ComCall(5, this, "uint", dwInputNum, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The PreprocessSample method delivers a sample to the writer for preprocessing.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number of the sample.
     * @param {Integer} cnsSampleTime Specifies the presentation time of the sample in 100-nanosecond units.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object that contains the sample.
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
     * The preprocessor has already made as many passes as specified by <a href="/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses">SetNumPreprocessingPasses</a>.
     * 
     * OR
     * 
     * The input specified is not supported for preprocessing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-preprocesssample
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-endpreprocessingpass
     */
    EndPreprocessingPass(dwInputNum, dwFlags) {
        result := ComCall(7, this, "uint", dwInputNum, "uint", dwFlags, "HRESULT")
        return result
    }
}
