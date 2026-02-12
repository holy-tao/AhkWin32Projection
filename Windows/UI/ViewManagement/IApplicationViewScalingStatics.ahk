#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewScalingStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewScalingStatics
     * @type {Guid}
     */
    static IID => Guid("{b08fecf0-b946-45c8-a5e3-71f5aa78f861}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisableLayoutScaling", "TrySetDisableLayoutScaling"]

    /**
     * @type {Boolean} 
     */
    DisableLayoutScaling {
        get => this.get_DisableLayoutScaling()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisableLayoutScaling() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} disableLayoutScaling 
     * @returns {Boolean} 
     */
    TrySetDisableLayoutScaling(disableLayoutScaling) {
        result := ComCall(7, this, "int", disableLayoutScaling, "int*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }
}
