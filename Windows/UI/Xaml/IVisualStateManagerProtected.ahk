#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IVisualStateManagerProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualStateManagerProtected
     * @type {Guid}
     */
    static IID => Guid("{4b3b8640-b0b7-404c-9ef4-d949640e245d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RaiseCurrentStateChanging", "RaiseCurrentStateChanged"]

    /**
     * 
     * @param {VisualStateGroup} stateGroup 
     * @param {VisualState} oldState 
     * @param {VisualState} newState 
     * @param {Control} control_ 
     * @returns {HRESULT} 
     */
    RaiseCurrentStateChanging(stateGroup, oldState, newState, control_) {
        result := ComCall(6, this, "ptr", stateGroup, "ptr", oldState, "ptr", newState, "ptr", control_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VisualStateGroup} stateGroup 
     * @param {VisualState} oldState 
     * @param {VisualState} newState 
     * @param {Control} control_ 
     * @returns {HRESULT} 
     */
    RaiseCurrentStateChanged(stateGroup, oldState, newState, control_) {
        result := ComCall(7, this, "ptr", stateGroup, "ptr", oldState, "ptr", newState, "ptr", control_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
