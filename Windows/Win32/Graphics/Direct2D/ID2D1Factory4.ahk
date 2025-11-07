#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device3.ahk
#Include .\ID2D1Factory3.ahk

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device3 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1factory4
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory4 extends ID2D1Factory3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory4
     * @type {Guid}
     */
    static IID => Guid("{bd4ec2d2-0662-4bee-ba8e-6f29f032e096}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {ID2D1Device3} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory4-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(29, this, "ptr", dxgiDevice, "ptr*", &d2dDevice3 := 0, "HRESULT")
        return ID2D1Device3(d2dDevice3)
    }
}
