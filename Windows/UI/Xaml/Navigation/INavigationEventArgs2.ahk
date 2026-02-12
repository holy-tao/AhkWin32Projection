#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Animation\NavigationTransitionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class INavigationEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{dbff71d9-979a-4b2e-a49b-3bb17fdef574}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NavigationTransitionInfo"]

    /**
     * @type {NavigationTransitionInfo} 
     */
    NavigationTransitionInfo {
        get => this.get_NavigationTransitionInfo()
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_NavigationTransitionInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationTransitionInfo(value)
    }
}
