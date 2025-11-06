#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterPostView interface manages advanced writing functionality related to the postviewing of samples.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterpostview
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPostView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterPostView
     * @type {Guid}
     */
    static IID => Guid("{81e20ce4-75ef-491a-8004-fc53c45bdc3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPostViewCallback", "SetReceivePostViewSamples", "GetReceivePostViewSamples", "GetPostViewProps", "SetPostViewProps", "GetPostViewFormatCount", "GetPostViewFormat", "SetAllocateForPostView", "GetAllocateForPostView"]

    /**
     * 
     * @param {IWMWriterPostViewCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewcallback
     */
    SetPostViewCallback(pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fReceivePostViewSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setreceivepostviewsamples
     */
    SetReceivePostViewSamples(wStreamNum, fReceivePostViewSamples) {
        result := ComCall(4, this, "ushort", wStreamNum, "int", fReceivePostViewSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getreceivepostviewsamples
     */
    GetReceivePostViewSamples(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "int*", &pfReceivePostViewSamples := 0, "HRESULT")
        return pfReceivePostViewSamples
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @returns {IWMMediaProps} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewprops
     */
    GetPostViewProps(wStreamNumber) {
        result := ComCall(6, this, "ushort", wStreamNumber, "ptr*", &ppOutput := 0, "HRESULT")
        return IWMMediaProps(ppOutput)
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {IWMMediaProps} pOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewprops
     */
    SetPostViewProps(wStreamNumber, pOutput) {
        result := ComCall(7, this, "ushort", wStreamNumber, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformatcount
     */
    GetPostViewFormatCount(wStreamNumber) {
        result := ComCall(8, this, "ushort", wStreamNumber, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Integer} dwFormatNumber 
     * @returns {IWMMediaProps} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformat
     */
    GetPostViewFormat(wStreamNumber, dwFormatNumber) {
        result := ComCall(9, this, "ushort", wStreamNumber, "uint", dwFormatNumber, "ptr*", &ppProps := 0, "HRESULT")
        return IWMMediaProps(ppProps)
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {BOOL} fAllocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setallocateforpostview
     */
    SetAllocateForPostView(wStreamNumber, fAllocate) {
        result := ComCall(10, this, "ushort", wStreamNumber, "int", fAllocate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getallocateforpostview
     */
    GetAllocateForPostView(wStreamNumber) {
        result := ComCall(11, this, "ushort", wStreamNumber, "int*", &pfAllocate := 0, "HRESULT")
        return pfAllocate
    }
}
