#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device4.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the ID2D1Device4 interface. It also enables the creation of ID2D1DeviceContext5 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1device5
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device5 extends ID2D1Device4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device5
     * @type {Guid}
     */
    static IID => Guid("{d55ba0a4-6405-4694-aef5-08ee1a4358b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceContext"]

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext5>} deviceContext5 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device5-createdevicecontext
     */
    CreateDeviceContext(options, deviceContext5) {
        result := ComCall(19, this, "int", options, "ptr*", deviceContext5, "HRESULT")
        return result
    }
}
