#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext2.ahk
#Include ..\Dxgi\IDXGIDevice.ahk
#Include .\ID2D1Device1.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the existing ID2D1Device1 interface. It also enables the creation of ID2D1DeviceContext2 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1device2
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device2 extends ID2D1Device1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device2
     * @type {Guid}
     */
    static IID => Guid("{a44472e1-8dfb-4e60-8492-6e2861c9ca8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceContext", "FlushDeviceContexts", "GetDxgiDevice"]

    /**
     * Creates a new ID2D1DeviceContext2 from a Direct2D device.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1devicecontext2">ID2D1DeviceContext2</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new device context.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device2-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(12, this, "int", options, "ptr*", &deviceContext2 := 0, "HRESULT")
        return ID2D1DeviceContext2(deviceContext2)
    }

    /**
     * Flush all device contexts that reference a given bitmap.
     * @param {ID2D1Bitmap} bitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap, created on this device, for which all referencing device contexts will be flushed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device2-flushdevicecontexts
     */
    FlushDeviceContexts(bitmap) {
        ComCall(13, this, "ptr", bitmap)
    }

    /**
     * Returns the DXGI device associated with this Direct2D device.
     * @returns {IDXGIDevice} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>**</b>
     * 
     * The DXGI device associated with this Direct2D device.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device2-getdxgidevice
     */
    GetDxgiDevice() {
        result := ComCall(14, this, "ptr*", &dxgiDevice := 0, "HRESULT")
        return IDXGIDevice(dxgiDevice)
    }
}
