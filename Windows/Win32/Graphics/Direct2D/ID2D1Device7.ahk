#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext7.ahk
#Include .\ID2D1Device6.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device7 extends ID2D1Device6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device7
     * @type {Guid}
     */
    static IID => Guid("{f07c8968-dd4e-4ba6-9cbd-eb6d3752dcbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceContext"]

    /**
     * 
     * @param {Integer} options 
     * @returns {ID2D1DeviceContext7} 
     */
    CreateDeviceContext(options) {
        result := ComCall(21, this, "int", options, "ptr*", &deviceContext := 0, "HRESULT")
        return ID2D1DeviceContext7(deviceContext)
    }
}
