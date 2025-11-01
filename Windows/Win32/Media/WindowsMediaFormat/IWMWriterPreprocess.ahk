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
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pdwMaxNumPasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-getmaxpreprocessingpasses
     */
    GetMaxPreprocessingPasses(dwInputNum, dwFlags, pdwMaxNumPasses) {
        result := ComCall(3, this, "uint", dwInputNum, "uint", dwFlags, "uint*", pdwMaxNumPasses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} dwFlags 
     * @param {Integer} dwNumPasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-setnumpreprocessingpasses
     */
    SetNumPreprocessingPasses(dwInputNum, dwFlags, dwNumPasses) {
        result := ComCall(4, this, "uint", dwInputNum, "uint", dwFlags, "uint", dwNumPasses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-beginpreprocessingpass
     */
    BeginPreprocessingPass(dwInputNum, dwFlags) {
        result := ComCall(5, this, "uint", dwInputNum, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} dwFlags 
     * @param {INSSBuffer} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-preprocesssample
     */
    PreprocessSample(dwInputNum, cnsSampleTime, dwFlags, pSample) {
        result := ComCall(6, this, "uint", dwInputNum, "uint", cnsSampleTime, "uint", dwFlags, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpreprocess-endpreprocessingpass
     */
    EndPreprocessingPass(dwInputNum, dwFlags) {
        result := ComCall(7, this, "uint", dwInputNum, "uint", dwFlags, "HRESULT")
        return result
    }
}
