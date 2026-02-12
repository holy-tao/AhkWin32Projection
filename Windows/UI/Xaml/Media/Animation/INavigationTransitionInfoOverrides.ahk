#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class INavigationTransitionInfoOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationTransitionInfoOverrides
     * @type {Guid}
     */
    static IID => Guid("{d9517e6a-a9d0-4bf7-9db0-4633a69daff2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNavigationStateCore", "SetNavigationStateCore"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetNavigationStateCore() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} navigationState 
     * @returns {HRESULT} 
     */
    SetNavigationStateCore(navigationState) {
        if(navigationState is String) {
            pin := HSTRING.Create(navigationState)
            navigationState := pin.Value
        }
        navigationState := navigationState is Win32Handle ? NumGet(navigationState, "ptr") : navigationState

        result := ComCall(7, this, "ptr", navigationState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
