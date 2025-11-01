#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory4.ahk

/**
 * This interface enables a single method to support variable refresh rate displays.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nn-dxgi1_5-idxgifactory5
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory5 extends IDXGIFactory4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory5
     * @type {Guid}
     */
    static IID => Guid("{7632e1f5-ee65-4dca-87fd-84cd75f8838d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckFeatureSupport"]

    /**
     * 
     * @param {Integer} Feature 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgifactory5-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(28, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }
}
