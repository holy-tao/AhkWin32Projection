#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEngine.ahk

/**
 * Enables media sharing.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfmediasharingengine
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSharingEngine extends IMFMediaEngine{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSharingEngine
     * @type {Guid}
     */
    static IID => Guid("{8d3ce1bf-2367-40e0-9eee-40d377cc1b46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice"]

    /**
     * 
     * @param {Pointer<DEVICE_INFO>} pDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfmediasharingengine-getdevice
     */
    GetDevice(pDevice) {
        result := ComCall(45, this, "ptr", pDevice, "HRESULT")
        return result
    }
}
