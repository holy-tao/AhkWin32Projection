#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayEnhancementOverrideCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayEnhancementOverrideCapabilities
     * @type {Guid}
     */
    static IID => Guid("{457060de-ee5a-47b7-9918-1e51e812ccc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBrightnessControlSupported", "get_IsBrightnessNitsControlSupported", "GetSupportedNitRanges"]

    /**
     * @type {Boolean} 
     */
    IsBrightnessControlSupported {
        get => this.get_IsBrightnessControlSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsBrightnessNitsControlSupported {
        get => this.get_IsBrightnessNitsControlSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBrightnessControlSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBrightnessNitsControlSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<NitRange>} 
     */
    GetSupportedNitRanges() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetNitRange(), result_)
    }
}
