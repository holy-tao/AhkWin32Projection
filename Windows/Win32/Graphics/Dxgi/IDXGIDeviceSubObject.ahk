#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIObject.ahk

/**
 * Inherited from objects that are tied to the device so that they can retrieve a pointer to it.
 * @remarks
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgidevicesubobject
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDeviceSubObject extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDeviceSubObject
     * @type {Guid}
     */
    static IID => Guid("{3d3e0379-f9de-4d58-bb6c-18d62992f1a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevicesubobject-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &ppDevice := 0, "HRESULT")
        return ppDevice
    }
}
