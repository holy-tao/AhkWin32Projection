#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device2.ahk
#Include .\ID2D1Factory2.ahk

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device2 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1factory3
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory3 extends ID2D1Factory2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory3
     * @type {Guid}
     */
    static IID => Guid("{0869759f-4f00-413f-b03e-2bda45404d0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {ID2D1Device2} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory3-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(28, this, "ptr", dxgiDevice, "ptr*", &d2dDevice2 := 0, "HRESULT")
        return ID2D1Device2(d2dDevice2)
    }
}
