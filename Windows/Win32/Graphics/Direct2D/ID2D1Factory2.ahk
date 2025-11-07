#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device1.ahk
#Include .\ID2D1Factory1.ahk

/**
 * Creates Direct2D resources.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1factory2
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory2 extends ID2D1Factory1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory2
     * @type {Guid}
     */
    static IID => Guid("{94f81a73-9212-4376-9c58-b16a3a0d3992}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {ID2D1Device1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1factory2-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(27, this, "ptr", dxgiDevice, "ptr*", &d2dDevice1 := 0, "HRESULT")
        return ID2D1Device1(d2dDevice1)
    }
}
