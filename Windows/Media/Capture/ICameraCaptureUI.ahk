#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CameraCaptureUIPhotoCaptureSettings.ahk
#Include .\CameraCaptureUIVideoCaptureSettings.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICameraCaptureUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraCaptureUI
     * @type {Guid}
     */
    static IID => Guid("{48587540-6f93-4bb4-b8f3-e89e48948c91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PhotoSettings", "get_VideoSettings", "CaptureFileAsync"]

    /**
     * @type {CameraCaptureUIPhotoCaptureSettings} 
     */
    PhotoSettings {
        get => this.get_PhotoSettings()
    }

    /**
     * @type {CameraCaptureUIVideoCaptureSettings} 
     */
    VideoSettings {
        get => this.get_VideoSettings()
    }

    /**
     * 
     * @returns {CameraCaptureUIPhotoCaptureSettings} 
     */
    get_PhotoSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraCaptureUIPhotoCaptureSettings(value)
    }

    /**
     * 
     * @returns {CameraCaptureUIVideoCaptureSettings} 
     */
    get_VideoSettings() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraCaptureUIVideoCaptureSettings(value)
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CaptureFileAsync(mode_) {
        result := ComCall(8, this, "int", mode_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, asyncInfo)
    }
}
