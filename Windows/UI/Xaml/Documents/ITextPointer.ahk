#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\FrameworkElement.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include .\TextPointer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextPointer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextPointer
     * @type {Guid}
     */
    static IID => Guid("{ac687aa1-6a41-43ff-851e-45348aa2cf7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Parent", "get_VisualParent", "get_LogicalDirection", "get_Offset", "GetCharacterRect", "GetPositionAtOffset"]

    /**
     * @type {DependencyObject} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {FrameworkElement} 
     */
    VisualParent {
        get => this.get_VisualParent()
    }

    /**
     * @type {Integer} 
     */
    LogicalDirection {
        get => this.get_LogicalDirection()
    }

    /**
     * @type {Integer} 
     */
    Offset {
        get => this.get_Offset()
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_Parent() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @returns {FrameworkElement} 
     */
    get_VisualParent() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameworkElement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LogicalDirection() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Offset() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} direction_ 
     * @returns {RECT} 
     */
    GetCharacterRect(direction_) {
        result_ := RECT()
        result := ComCall(10, this, "int", direction_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} direction_ 
     * @returns {TextPointer} 
     */
    GetPositionAtOffset(offset, direction_) {
        result := ComCall(11, this, "int", offset, "int", direction_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(result_)
    }
}
