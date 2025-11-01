#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStatusCallback.ahk

/**
 * The IWMWriterPostViewCallback interface manages the receiving of uncompressed samples from the writer. Postview can be used only for video streams.This interface must be implemented by the application and passed to IWMWriterPostView::SetPostViewCallback.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterpostviewcallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPostViewCallback extends IWMStatusCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterPostViewCallback
     * @type {Guid}
     */
    static IID => Guid("{d9d6549d-a193-4f24-b308-03123d9b7f8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPostViewSample", "AllocateForPostView"]

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {INSSBuffer} pSample 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostviewcallback-onpostviewsample
     */
    OnPostViewSample(wStreamNumber, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ushort", wStreamNumber, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostviewcallback-allocateforpostview
     */
    AllocateForPostView(wStreamNum, cbBuffer, ppBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", ppBuffer, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}
