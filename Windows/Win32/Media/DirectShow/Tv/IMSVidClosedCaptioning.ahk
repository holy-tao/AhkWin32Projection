#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFeature.ahk

/**
 * The IMSVidClosedCaptioning interface enables or disables closed captions.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidClosedCaptioning)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidclosedcaptioning
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidClosedCaptioning extends IMSVidFeature{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidClosedCaptioning
     * @type {Guid}
     */
    static IID => Guid("{99652ea1-c1f7-414f-bb7b-1c967de75983}")

    /**
     * The class identifier for MSVidClosedCaptioning
     * @type {Guid}
     */
    static CLSID => Guid("{7f9cb14d-48e4-43b6-9346-1aebc39c64d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enable", "put_Enable"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning-get_enable
     */
    get_Enable() {
        result := ComCall(16, this, "short*", &On := 0, "HRESULT")
        return On
    }

    /**
     * 
     * @param {VARIANT_BOOL} On 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning-put_enable
     */
    put_Enable(On) {
        result := ComCall(17, this, "short", On, "HRESULT")
        return result
    }
}
