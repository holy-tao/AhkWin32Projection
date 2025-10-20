#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device5.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the ID2D1Device5 interface, plus it enables the creation of ID2D1DeviceContext6 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1device6
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device6 extends ID2D1Device5{
    /**
     * The interface identifier for ID2D1Device6
     * @type {Guid}
     */
    static IID => Guid("{7bfef914-2d75-4bad-be87-e18ddb077b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext6>} deviceContext6 
     * @returns {HRESULT} 
     */
    CreateDeviceContext(options, deviceContext6) {
        result := ComCall(20, this, "int", options, "ptr", deviceContext6, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
