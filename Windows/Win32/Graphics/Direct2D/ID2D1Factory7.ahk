#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Factory6.ahk

/**
 * Creates Direct2D resources. This interface performs all the same functions as the ID2D1Factory6 interface, plus it enables the creation of ID2D1Device6 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1factory7
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory7 extends ID2D1Factory6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory7
     * @type {Guid}
     */
    static IID => Guid("{bdc2bdd3-b96c-4de6-bdf7-99d4745454de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @param {Pointer<ID2D1Device6>} d2dDevice6 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory7-createdevice
     */
    CreateDevice(dxgiDevice, d2dDevice6) {
        result := ComCall(32, this, "ptr", dxgiDevice, "ptr*", d2dDevice6, "HRESULT")
        return result
    }
}
