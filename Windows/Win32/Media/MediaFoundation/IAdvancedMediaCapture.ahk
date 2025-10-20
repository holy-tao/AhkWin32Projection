#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables advanced media capture.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediacapture/nn-mfmediacapture-iadvancedmediacapture
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IAdvancedMediaCapture extends IUnknown{
    /**
     * The interface identifier for IAdvancedMediaCapture
     * @type {Guid}
     */
    static IID => Guid("{d0751585-d216-4344-b5bf-463b68f977bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAdvancedMediaCaptureSettings>} value 
     * @returns {HRESULT} 
     */
    GetAdvancedMediaCaptureSettings(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
