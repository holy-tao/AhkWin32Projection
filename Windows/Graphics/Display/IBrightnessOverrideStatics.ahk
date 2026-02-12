#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BrightnessOverride.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IBrightnessOverrideStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrightnessOverrideStatics
     * @type {Guid}
     */
    static IID => Guid("{03a7b9ed-e1f1-4a68-a11f-946ad8ce5393}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultForSystem", "GetForCurrentView", "SaveForSystemAsync"]

    /**
     * 
     * @returns {BrightnessOverride} 
     */
    GetDefaultForSystem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrightnessOverride(value)
    }

    /**
     * 
     * @returns {BrightnessOverride} 
     */
    GetForCurrentView() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrightnessOverride(value)
    }

    /**
     * 
     * @param {BrightnessOverride} value 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SaveForSystemAsync(value) {
        result := ComCall(8, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
