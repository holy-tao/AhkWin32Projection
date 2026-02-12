#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device1.ahk
#Include .\ID2D1Factory1.ahk

/**
 * Creates Direct2D resources. (ID2D1Factory2)
 * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_2/nn-d2d1_2-id2d1factory2
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
     * Creates an ID2D1Device1 object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> device defines a resource domain in which a set of Direct2D objects and Direct2D device contexts can be used together.  Each call to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-d2d1createdevice">CreateDevice</a> returns a unique <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a> object, even if you pass the same <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> multiple times.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> object used when creating  the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a>.
     * @returns {Pointer<ID2D1Device1>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a>**</b>
     * 
     * The requested <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_2/nf-d2d1_2-id2d1factory2-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(27, this, "ptr", dxgiDevice, "ptr*", &d2dDevice1 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return d2dDevice1
    }
}
