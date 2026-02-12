#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IFlashControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlashControl2
     * @type {Guid}
     */
    static IID => Guid("{7d29cc9e-75e1-4af7-bd7d-4e38e1c06cd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AssistantLightSupported", "get_AssistantLightEnabled", "put_AssistantLightEnabled"]

    /**
     * @type {Boolean} 
     */
    AssistantLightSupported {
        get => this.get_AssistantLightSupported()
    }

    /**
     * @type {Boolean} 
     */
    AssistantLightEnabled {
        get => this.get_AssistantLightEnabled()
        set => this.put_AssistantLightEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AssistantLightSupported() {
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
    get_AssistantLightEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AssistantLightEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
