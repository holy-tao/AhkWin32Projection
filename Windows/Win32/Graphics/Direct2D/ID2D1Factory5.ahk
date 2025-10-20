#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Factory4.ahk

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device4 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1factory5
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory5 extends ID2D1Factory4{
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
     * 
     * @param {Pointer<IDXGIDevice>} dxgiDevice 
     * @param {Pointer<ID2D1Device4>} d2dDevice4 
     * @returns {HRESULT} 
     */
    CreateDevice(dxgiDevice, d2dDevice4) {
        result := ComCall(30, this, "ptr", dxgiDevice, "ptr", d2dDevice4, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
