#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IInputPaneVisibilityEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPaneVisibilityEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d243e016-d907-4fcc-bb8d-f77baa5028f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OccludedRect", "put_EnsuredFocusedElementInView", "get_EnsuredFocusedElementInView"]

    /**
     * @type {RECT} 
     */
    OccludedRect {
        get => this.get_OccludedRect()
    }

    /**
     * @type {Boolean} 
     */
    EnsuredFocusedElementInView {
        get => this.get_EnsuredFocusedElementInView()
        set => this.put_EnsuredFocusedElementInView(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludedRect() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_EnsuredFocusedElementInView(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnsuredFocusedElementInView() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
