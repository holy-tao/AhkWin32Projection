#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppCaptureSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{7d9e3ea7-6282-4735-8d4e-aa45f90f6723}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentSettings", "ApplySettings"]

    /**
     * 
     * @returns {AppCaptureSettings} 
     */
    GetCurrentSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCaptureSettings(value)
    }

    /**
     * 
     * @param {AppCaptureSettings} appCaptureSettings_ 
     * @returns {HRESULT} 
     */
    ApplySettings(appCaptureSettings_) {
        result := ComCall(7, this, "ptr", appCaptureSettings_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
