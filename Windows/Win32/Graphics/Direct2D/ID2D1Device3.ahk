#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext3.ahk
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
     * Creates a new ID2D1DeviceContext3 from this Direct2D device.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext3} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1devicecontext3">ID2D1DeviceContext3</a>**</b>
     * 
     * When this method returns, contains a pointer to the new device context.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device3-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(15, this, "int", options, "ptr*", &deviceContext3 := 0, "HRESULT")
        return ID2D1DeviceContext3(deviceContext3)
    }
}
