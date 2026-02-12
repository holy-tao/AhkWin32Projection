#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\NavigationTransitionInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class INavigationThemeTransition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationThemeTransition
     * @type {Guid}
     */
    static IID => Guid("{8833848c-4eb7-41f2-8799-9eef0a213b73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultNavigationTransitionInfo", "put_DefaultNavigationTransitionInfo"]

    /**
     * @type {NavigationTransitionInfo} 
     */
    DefaultNavigationTransitionInfo {
        get => this.get_DefaultNavigationTransitionInfo()
        set => this.put_DefaultNavigationTransitionInfo(value)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_DefaultNavigationTransitionInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationTransitionInfo(value)
    }

    /**
     * 
     * @param {NavigationTransitionInfo} value 
     * @returns {HRESULT} 
     */
    put_DefaultNavigationTransitionInfo(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
