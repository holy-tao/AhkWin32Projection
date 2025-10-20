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
     * 
     * @param {Pointer<ID2D1DrawInfo>} drawInfo 
     * @returns {HRESULT} 
     */
    SetDrawInfo(drawInfo) {
        result := ComCall(7, this, "ptr", drawInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
