#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ISceneModeControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneModeControl
     * @type {Guid}
     */
    static IID => Guid("{d48e5af7-8d59-4854-8c62-12c70ba89b7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedModes", "get_Value", "SetValueAsync"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} sceneMode 
     * @returns {IAsyncAction} 
     */
    SetValueAsync(sceneMode) {
        result := ComCall(8, this, "int", sceneMode, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
