#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables image sharing.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfimagesharingengine
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFImageSharingEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFImageSharingEngine
     * @type {Guid}
     */
    static IID => Guid("{cfa0ae8e-7e1c-44d2-ae68-fc4c148a6354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSource", "GetDevice", "Shutdown"]

    /**
     * 
     * @param {IUnknown} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengine-setsource
     */
    SetSource(pStream) {
        result := ComCall(3, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_INFO>} pDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengine-getdevice
     */
    GetDevice(pDevice) {
        result := ComCall(4, this, "ptr", pDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengine-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
