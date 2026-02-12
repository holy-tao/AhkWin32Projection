#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GazeDevicePreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGazeDeviceWatcherUpdatedPreviewEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGazeDeviceWatcherUpdatedPreviewEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7fe830ef-7f08-4737-88e1-4a83ae4e4885}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Device"]

    /**
     * @type {GazeDevicePreview} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * 
     * @returns {GazeDevicePreview} 
     */
    get_Device() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GazeDevicePreview(value)
    }
}
