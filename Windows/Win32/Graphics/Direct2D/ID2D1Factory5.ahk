#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device4.ahk
#Include .\ID2D1Factory4.ahk

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device4 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1factory5
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory5 extends ID2D1Factory4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory5
     * @type {Guid}
     */
    static IID => Guid("{c4349994-838e-4b0f-8cab-44997d9eeacc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * Creates an ID2D1Device4 object.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The IDXGIDevice object used when creating the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1device4">ID2D1Device4</a>.
     * @returns {ID2D1Device4} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1device4">ID2D1Device4</a>**</b>
     * 
     * The requested <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1device4">ID2D1Device4</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1factory5-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(30, this, "ptr", dxgiDevice, "ptr*", &d2dDevice4 := 0, "HRESULT")
        return ID2D1Device4(d2dDevice4)
    }
}
