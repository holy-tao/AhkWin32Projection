#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\D2D_RECT_F.ahk
#Include .\ID2D1Resource.ahk

/**
 * A Direct2D resource that wraps a WMF, EMF, or EMF+ metafile.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1gdimetafile
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GdiMetafile extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GdiMetafile
     * @type {Guid}
     */
    static IID => Guid("{2f543dc3-cfc1-4211-864f-cfd91c6f3395}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stream", "GetBounds"]

    /**
     * 
     * @param {ID2D1GdiMetafileSink} sink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gdimetafile-stream
     */
    Stream(sink) {
        result := ComCall(4, this, "ptr", sink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D2D_RECT_F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gdimetafile-getbounds
     */
    GetBounds() {
        bounds := D2D_RECT_F()
        result := ComCall(5, this, "ptr", bounds, "HRESULT")
        return bounds
    }
}
