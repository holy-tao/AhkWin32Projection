#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAnchorRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnchorRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5175f55d-4785-5a72-b462-eb11e9bdf897}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Anchor", "put_Anchor", "get_AnchorCandidates"]

    /**
     * @type {UIElement} 
     */
    Anchor {
        get => this.get_Anchor()
        set => this.put_Anchor(value)
    }

    /**
     * @type {IVector<UIElement>} 
     */
    AnchorCandidates {
        get => this.get_AnchorCandidates()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Anchor() {
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
    put_Anchor(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<UIElement>} 
     */
    get_AnchorCandidates() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(UIElement, value)
    }
}
