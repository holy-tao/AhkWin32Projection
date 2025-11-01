#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides initialization settings for advanced media capture.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediacapture/nn-mfmediacapture-iadvancedmediacaptureinitializationsettings
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IAdvancedMediaCaptureInitializationSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedMediaCaptureInitializationSettings
     * @type {Guid}
     */
    static IID => Guid("{3de21209-8ba6-4f2a-a577-2819b56ff14d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDirectxDeviceManager"]

    /**
     * 
     * @param {IMFDXGIDeviceManager} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nf-mfmediacapture-iadvancedmediacaptureinitializationsettings-setdirectxdevicemanager
     */
    SetDirectxDeviceManager(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }
}
