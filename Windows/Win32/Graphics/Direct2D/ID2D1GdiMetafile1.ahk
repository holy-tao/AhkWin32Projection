#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1GdiMetafile.ahk

/**
 * This interface performs all the same functions as the existing ID2D1GdiMetafile interface. It also enables accessing the metafile DPI and bounds.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1gdimetafile1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GdiMetafile1 extends ID2D1GdiMetafile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GdiMetafile1
     * @type {Guid}
     */
    static IID => Guid("{2e69f9e8-dd3f-4bf9-95ba-c04f49d788df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDpi", "GetSourceBounds"]

    /**
     * 
     * @param {Pointer<Float>} dpiX 
     * @param {Pointer<Float>} dpiY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getdpi
     */
    GetDpi(dpiX, dpiY) {
        result := ComCall(6, this, "float*", dpiX, "float*", dpiY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getsourcebounds
     */
    GetSourceBounds(bounds) {
        result := ComCall(7, this, "ptr", bounds, "HRESULT")
        return result
    }
}
