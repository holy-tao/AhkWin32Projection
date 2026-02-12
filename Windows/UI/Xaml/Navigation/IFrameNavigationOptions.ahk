#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Animation\NavigationTransitionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class IFrameNavigationOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameNavigationOptions
     * @type {Guid}
     */
    static IID => Guid("{b539ad2a-9fb7-520a-8f41-57a50c59cf92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsNavigationStackEnabled", "put_IsNavigationStackEnabled", "get_TransitionInfoOverride", "put_TransitionInfoOverride"]

    /**
     * @type {Boolean} 
     */
    IsNavigationStackEnabled {
        get => this.get_IsNavigationStackEnabled()
        set => this.put_IsNavigationStackEnabled(value)
    }

    /**
     * @type {NavigationTransitionInfo} 
     */
    TransitionInfoOverride {
        get => this.get_TransitionInfoOverride()
        set => this.put_TransitionInfoOverride(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigationStackEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsNavigationStackEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_TransitionInfoOverride() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_TransitionInfoOverride(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
