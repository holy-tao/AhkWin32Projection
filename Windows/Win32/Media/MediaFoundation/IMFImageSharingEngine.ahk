#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DEVICE_INFO.ahk
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
     * Sets the source stream.
     * @param {IUnknown} pStream The source stream.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nf-mfsharingengine-imfimagesharingengine-setsource
     */
    SetSource(pStream) {
        result := ComCall(3, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * Gets information about the image sharing device.
     * @returns {DEVICE_INFO} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ns-mfsharingengine-device_info">DEVICE_INFO</a> structure. The method fills in this structure with the device information.
     * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nf-mfsharingengine-imfimagesharingengine-getdevice
     */
    GetDevice() {
        pDevice := DEVICE_INFO()
        result := ComCall(4, this, "ptr", pDevice, "HRESULT")
        return pDevice
    }

    /**
     * Shuts down the image sharing engine.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nf-mfsharingengine-imfimagesharingengine-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
