#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\UIElement.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IContinuumNavigationTransitionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContinuumNavigationTransitionInfo
     * @type {Guid}
     */
    static IID => Guid("{4be1dbad-8ba6-4004-8438-8a9017978543}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExitElement", "put_ExitElement"]

    /**
     * @type {UIElement} 
     */
    ExitElement {
        get => this.get_ExitElement()
        set => this.put_ExitElement(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ExitElement() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_ExitElement(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
