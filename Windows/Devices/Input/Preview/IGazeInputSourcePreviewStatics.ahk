#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GazeInputSourcePreview.ahk
#Include .\GazeDeviceWatcherPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGazeInputSourcePreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGazeInputSourcePreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{e79e7ee6-b389-11e7-b201-c8d3ffb75721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView", "CreateWatcher"]

    /**
     * 
     * @returns {GazeInputSourcePreview} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GazeInputSourcePreview(result_)
    }

    /**
     * 
     * @returns {GazeDeviceWatcherPreview} 
     */
    CreateWatcher() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GazeDeviceWatcherPreview(result_)
    }
}
