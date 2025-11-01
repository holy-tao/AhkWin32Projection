#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
        result := ComCall(3, this, "ptr", pCallback, "ptr", pvContext, "HRESULT")
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
     * @param {Pointer<BOOL>} pfReceivePostViewSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getreceivepostviewsamples
     */
    GetReceivePostViewSamples(wStreamNum, pfReceivePostViewSamples) {
        result := ComCall(5, this, "ushort", wStreamNum, "ptr", pfReceivePostViewSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IWMMediaProps>} ppOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewprops
     */
    GetPostViewProps(wStreamNumber, ppOutput) {
        result := ComCall(6, this, "ushort", wStreamNumber, "ptr*", ppOutput, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pcFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformatcount
     */
    GetPostViewFormatCount(wStreamNumber, pcFormats) {
        result := ComCall(8, this, "ushort", wStreamNumber, "uint*", pcFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Integer} dwFormatNumber 
     * @param {Pointer<IWMMediaProps>} ppProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformat
     */
    GetPostViewFormat(wStreamNumber, dwFormatNumber, ppProps) {
        result := ComCall(9, this, "ushort", wStreamNumber, "uint", dwFormatNumber, "ptr*", ppProps, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pfAllocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getallocateforpostview
     */
    GetAllocateForPostView(wStreamNumber, pfAllocate) {
        result := ComCall(11, this, "ushort", wStreamNumber, "ptr", pfAllocate, "HRESULT")
        return result
    }
}
