#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextElementStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextElementStatics4
     * @type {Guid}
     */
    static IID => Guid("{fd8f641e-6b12-40d5-b6ef-d1bd12ac9066}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextDecorationsProperty", "get_IsAccessKeyScopeProperty", "get_AccessKeyScopeOwnerProperty", "get_KeyTipPlacementModeProperty", "get_KeyTipHorizontalOffsetProperty", "get_KeyTipVerticalOffsetProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TextDecorationsProperty {
        get => this.get_TextDecorationsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsAccessKeyScopeProperty {
        get => this.get_IsAccessKeyScopeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AccessKeyScopeOwnerProperty {
        get => this.get_AccessKeyScopeOwnerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipPlacementModeProperty {
        get => this.get_KeyTipPlacementModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipHorizontalOffsetProperty {
        get => this.get_KeyTipHorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipVerticalOffsetProperty {
        get => this.get_KeyTipVerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextDecorationsProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsAccessKeyScopeProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AccessKeyScopeOwnerProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyTipPlacementModeProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyTipHorizontalOffsetProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyTipVerticalOffsetProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
