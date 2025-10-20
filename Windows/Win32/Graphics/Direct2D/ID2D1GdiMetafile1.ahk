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
     * 
     * @param {Pointer<Single>} dpiX 
     * @param {Pointer<Single>} dpiY 
     * @returns {HRESULT} 
     */
    GetDpi(dpiX, dpiY) {
        result := ComCall(6, this, "float*", dpiX, "float*", dpiY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     */
    GetSourceBounds(bounds) {
        result := ComCall(7, this, "ptr", bounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
