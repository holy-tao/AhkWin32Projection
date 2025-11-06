#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device5.ahk
#Include .\ID2D1Factory5.ahk

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device5 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1factory6
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory6 extends ID2D1Factory5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory6
     * @type {Guid}
     */
    static IID => Guid("{f9976f46-f642-44c1-97ca-da32ea2a2635}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {ID2D1Device5} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory6-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(31, this, "ptr", dxgiDevice, "ptr*", &d2dDevice5 := 0, "HRESULT")
        return ID2D1Device5(d2dDevice5)
    }
}
