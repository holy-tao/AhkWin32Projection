#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext2>} deviceContext2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device2-createdevicecontext
     */
    CreateDeviceContext(options, deviceContext2) {
        result := ComCall(12, this, "int", options, "ptr*", deviceContext2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device2-flushdevicecontexts
     */
    FlushDeviceContexts(bitmap) {
        ComCall(13, this, "ptr", bitmap)
    }

    /**
     * 
     * @param {Pointer<IDXGIDevice>} dxgiDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device2-getdxgidevice
     */
    GetDxgiDevice(dxgiDevice) {
        result := ComCall(14, this, "ptr*", dxgiDevice, "HRESULT")
        return result
    }
}
