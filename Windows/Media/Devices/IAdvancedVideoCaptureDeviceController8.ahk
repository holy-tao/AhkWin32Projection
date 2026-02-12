#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PanelBasedOptimizationControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController8
     * @type {Guid}
     */
    static IID => Guid("{d843f010-e7fb-595b-9a78-0e54c4532b43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PanelBasedOptimizationControl"]

    /**
     * @type {PanelBasedOptimizationControl} 
     */
    PanelBasedOptimizationControl {
        get => this.get_PanelBasedOptimizationControl()
    }

    /**
     * 
     * @returns {PanelBasedOptimizationControl} 
     */
    get_PanelBasedOptimizationControl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PanelBasedOptimizationControl(value)
    }
}
