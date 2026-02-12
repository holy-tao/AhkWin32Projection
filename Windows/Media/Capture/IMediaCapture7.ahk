#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaCaptureRelativePanelWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture7
     * @type {Guid}
     */
    static IID => Guid("{9169f102-8888-541a-95bc-24e4d462542a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRelativePanelWatcher"]

    /**
     * 
     * @param {Integer} captureMode 
     * @param {DisplayRegion} displayRegion_ 
     * @returns {MediaCaptureRelativePanelWatcher} 
     */
    CreateRelativePanelWatcher(captureMode, displayRegion_) {
        result := ComCall(6, this, "int", captureMode, "ptr", displayRegion_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaCaptureRelativePanelWatcher(result_)
    }
}
