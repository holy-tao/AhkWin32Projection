#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides settings for advanced media capture.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediacapture/nn-mfmediacapture-iadvancedmediacapturesettings
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IAdvancedMediaCaptureSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedMediaCaptureSettings
     * @type {Guid}
     */
    static IID => Guid("{24e0485f-a33e-4aa1-b564-6019b1d14f65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectxDeviceManager"]

    /**
     * 
     * @param {Pointer<IMFDXGIDeviceManager>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nf-mfmediacapture-iadvancedmediacapturesettings-getdirectxdevicemanager
     */
    GetDirectxDeviceManager(value) {
        result := ComCall(3, this, "ptr*", value, "HRESULT")
        return result
    }
}
