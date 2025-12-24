#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device6.ahk
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
     * Creates a new Direct2D device from the given IDXGIDevice.
     * @param {IDXGIDevice} dxgiDevice Type: <b>IDXGIDevice*</b>
     * 
     * The IDXGIDevice from which to create the Direct2D device.
     * @returns {ID2D1Device6} Type: <b>ID2D1Device6**</b>
     * 
     * The created device.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1factory7-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(32, this, "ptr", dxgiDevice, "ptr*", &d2dDevice6 := 0, "HRESULT")
        return ID2D1Device6(d2dDevice6)
    }
}
