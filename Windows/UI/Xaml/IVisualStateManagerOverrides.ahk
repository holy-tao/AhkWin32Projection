#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IVisualStateManagerOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualStateManagerOverrides
     * @type {Guid}
     */
    static IID => Guid("{4a66910e-7979-43c8-8ff4-ec6122750006}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GoToStateCore"]

    /**
     * 
     * @param {Control} control_ 
     * @param {FrameworkElement} templateRoot 
     * @param {HSTRING} stateName 
     * @param {VisualStateGroup} group 
     * @param {VisualState} state 
     * @param {Boolean} useTransitions 
     * @returns {Boolean} 
     */
    GoToStateCore(control_, templateRoot, stateName, group, state, useTransitions) {
        if(stateName is String) {
            pin := HSTRING.Create(stateName)
            stateName := pin.Value
        }
        stateName := stateName is Win32Handle ? NumGet(stateName, "ptr") : stateName

        result := ComCall(6, this, "ptr", control_, "ptr", templateRoot, "ptr", stateName, "ptr", group, "ptr", state, "int", useTransitions, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
