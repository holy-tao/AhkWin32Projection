#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\D2D_RECT_F.ahk
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
     * Gets the DPI reported by the metafile.
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * Receives the horizontal DPI reported by the metafile.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * Receives the vertical DPI reported by the metafile.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY, "HRESULT")
        return result
    }

    /**
     * Gets the bounds of the metafile in source space in DIPs. This corresponds to the frame rect in an EMF/EMF+.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The bounds, in DIPs, of the metafile.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getsourcebounds
     */
    GetSourceBounds() {
        bounds := D2D_RECT_F()
        result := ComCall(7, this, "ptr", bounds, "HRESULT")
        return bounds
    }
}
