#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Transform.ahk

/**
 * A specialized implementation of the Shantzis calculations to a transform implemented on the GPU.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1drawtransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DrawTransform extends ID2D1Transform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DrawTransform
     * @type {Guid}
     */
    static IID => Guid("{36bfdcb6-9739-435d-a30d-a653beff6a6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDrawInfo"]

    /**
     * Provides the GPU render info interface to the transform implementation.
     * @param {ID2D1DrawInfo} drawInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1drawinfo">ID2D1DrawInfo</a>*</b>
     * 
     * The interface supplied back to the calling method to allow it to specify the GPU based transform pass.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any HRESULT value can be returned when implementing this method. A failure will be returned from the corresponding <a href="/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1DeviceContext::EndDraw</a> call.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1drawtransform-setdrawinfo
     */
    SetDrawInfo(drawInfo) {
        result := ComCall(7, this, "ptr", drawInfo, "HRESULT")
        return result
    }
}
