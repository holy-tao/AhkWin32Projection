#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext1.ahk
#Include .\ID2D1Device.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1device1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device1 extends ID2D1Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device1
     * @type {Guid}
     */
    static IID => Guid("{d21768e1-23a4-4823-a14b-7c3eba85d658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRenderingPriority", "SetRenderingPriority", "CreateDeviceContext"]

    /**
     * Retrieves the current rendering priority of the device.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_2/ne-d2d1_2-d2d1_rendering_priority">D2D1_RENDERING_PRIORITY</a></b>
     * 
     * The current rendering priority of the device.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nf-d2d1_2-id2d1device1-getrenderingpriority
     */
    GetRenderingPriority() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Sets the priority of Direct2D rendering operations performed on any device context associated with the device.
     * @param {Integer} renderingPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/ne-d2d1_2-d2d1_rendering_priority">D2D1_RENDERING_PRIORITY</a></b>
     * 
     * The desired rendering priority for the device and associated contexts.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nf-d2d1_2-id2d1device1-setrenderingpriority
     */
    SetRenderingPriority(renderingPriority) {
        ComCall(10, this, "int", renderingPriority)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {ID2D1DeviceContext1} 
     */
    CreateDeviceContext(options) {
        result := ComCall(11, this, "int", options, "ptr*", &deviceContext1 := 0, "HRESULT")
        return ID2D1DeviceContext1(deviceContext1)
    }
}
