#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk
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
     * The OnPostViewSample method is called when new postview data is available. The application implements this method.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @param {Integer} cnsSampleTime Sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration Sample duration, in 100-nanosecond units. This will usually be 10000 (1 millisecond).
     * @param {Integer} dwFlags <b>DWORD</b> containing none, one, or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>No flag set</td>
     * <td>None of the conditions for the other flags applies. For example, a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">delta frame</a> in most cases would not have any flags set for it.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_CLEANPOINT</td>
     * <td>This is basically the same as a key frame. It indicates a good point to go to during a seek, for example.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>The data stream has a gap in it, which could be due to a seek, a network loss, or some other reason. This can be useful extra information for an application such as a codec or renderer. The flag is set on the first piece of data following the gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with this flag set.</td>
     * </tr>
     * </table>
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object that contains the sample.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} This method is implemented by the application. It should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpostviewcallback-onpostviewsample
     */
    OnPostViewSample(wStreamNumber, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ushort", wStreamNumber, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The AllocateForPostView method allocates a buffer for use in postviewing operations. The application implements this method.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} cbBuffer Size of <i>ppBuffer</i>, in bytes.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {INSSBuffer} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpostviewcallback-allocateforpostview
     */
    AllocateForPostView(wStreamNum, cbBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }
}
