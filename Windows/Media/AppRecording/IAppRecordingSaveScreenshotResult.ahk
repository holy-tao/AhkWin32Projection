#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppRecordingSavedScreenshotInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class IAppRecordingSaveScreenshotResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppRecordingSaveScreenshotResult
     * @type {Guid}
     */
    static IID => Guid("{9c5b8d0a-0abb-4457-aaee-24f9c12ec778}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Succeeded", "get_ExtendedError", "get_SavedScreenshotInfos"]

    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * @type {IVectorView<AppRecordingSavedScreenshotInfo>} 
     */
    SavedScreenshotInfos {
        get => this.get_SavedScreenshotInfos()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<AppRecordingSavedScreenshotInfo>} 
     */
    get_SavedScreenshotInfos() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppRecordingSavedScreenshotInfo, value)
    }
}
