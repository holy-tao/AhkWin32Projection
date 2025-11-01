#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device2.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the ID2D1Device2 interface. It also enables the creation of ID2D1DeviceContext3 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1device3
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device3 extends ID2D1Device2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device3
     * @type {Guid}
     */
    static IID => Guid("{852f2087-802c-4037-ab60-ff2e7ee6fc01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceContext"]

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext3>} deviceContext3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device3-createdevicecontext
     */
    CreateDeviceContext(options, deviceContext3) {
        result := ComCall(15, this, "int", options, "ptr*", deviceContext3, "HRESULT")
        return result
    }
}
