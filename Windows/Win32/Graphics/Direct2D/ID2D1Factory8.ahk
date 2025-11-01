#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Factory7.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory8 extends ID2D1Factory7{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory8
     * @type {Guid}
     */
    static IID => Guid("{677c9311-f36d-4b1f-ae86-86d1223ffd3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @param {Pointer<ID2D1Device7>} d2dDevice6 
     * @returns {HRESULT} 
     */
    CreateDevice(dxgiDevice, d2dDevice6) {
        result := ComCall(33, this, "ptr", dxgiDevice, "ptr*", d2dDevice6, "HRESULT")
        return result
    }
}
