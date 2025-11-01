#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk

/**
 * With this interface, the application can specify additional video-specific parameters not available on the IWMMediaProps interface.To get access to the methods of this interface, call QueryInterface on a stream configuration object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmvideomediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMVideoMediaProps extends IWMMediaProps{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMVideoMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bcf-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxKeyFrameSpacing", "SetMaxKeyFrameSpacing", "GetQuality", "SetQuality"]

    /**
     * 
     * @param {Pointer<Integer>} pllTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-getmaxkeyframespacing
     */
    GetMaxKeyFrameSpacing(pllTime) {
        pllTimeMarshal := pllTime is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, pllTimeMarshal, pllTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-setmaxkeyframespacing
     */
    SetMaxKeyFrameSpacing(llTime) {
        result := ComCall(7, this, "int64", llTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-getquality
     */
    GetQuality(pdwQuality) {
        pdwQualityMarshal := pdwQuality is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwQualityMarshal, pdwQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmvideomediaprops-setquality
     */
    SetQuality(dwQuality) {
        result := ComCall(9, this, "uint", dwQuality, "HRESULT")
        return result
    }
}
