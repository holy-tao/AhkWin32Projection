#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Animation\NavigationTransitionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class INavigatingCancelEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigatingCancelEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{5407b704-8147-4343-838f-dd1ee908c137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Parameter", "get_NavigationTransitionInfo"]

    /**
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * @type {NavigationTransitionInfo} 
     */
    NavigationTransitionInfo {
        get => this.get_NavigationTransitionInfo()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_NavigationTransitionInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationTransitionInfo(value)
    }
}
