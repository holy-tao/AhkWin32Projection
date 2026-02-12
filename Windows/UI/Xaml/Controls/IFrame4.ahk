#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFrame4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrame4
     * @type {Guid}
     */
    static IID => Guid("{9b17c21a-bd2b-4a00-99eb-946be9618084}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNavigationStateWithNavigationControl"]

    /**
     * 
     * @param {HSTRING} navigationState 
     * @param {Boolean} suppressNavigate 
     * @returns {HRESULT} 
     */
    SetNavigationStateWithNavigationControl(navigationState, suppressNavigate) {
        if(navigationState is String) {
            pin := HSTRING.Create(navigationState)
            navigationState := pin.Value
        }
        navigationState := navigationState is Win32Handle ? NumGet(navigationState, "ptr") : navigationState

        result := ComCall(6, this, "ptr", navigationState, "int", suppressNavigate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
