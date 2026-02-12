#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\AutomationAnnotation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics3
     * @type {Guid}
     */
    static IID => Guid("{7b75d735-5cb1-42ad-9b57-5faba8c1867f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PositionInSetProperty", "GetPositionInSet", "SetPositionInSet", "get_SizeOfSetProperty", "GetSizeOfSet", "SetSizeOfSet", "get_LevelProperty", "GetLevel", "SetLevel", "get_AnnotationsProperty", "GetAnnotations"]

    /**
     * @type {DependencyProperty} 
     */
    PositionInSetProperty {
        get => this.get_PositionInSetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SizeOfSetProperty {
        get => this.get_SizeOfSetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LevelProperty {
        get => this.get_LevelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AnnotationsProperty {
        get => this.get_AnnotationsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PositionInSetProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetPositionInSet(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPositionInSet(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SizeOfSetProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetSizeOfSet(element) {
        result := ComCall(10, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetSizeOfSet(element, value) {
        result := ComCall(11, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LevelProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * GetLevel (Database Engine)
     * @remarks
     * Used to determine the level of one or more nodes or to filter the nodes to members of a specified level. The root of the hierarchy is level 0.
     *   
     * GetLevel is useful for breadth-first search indexes. For more information, see [Hierarchical Data &#40;SQL Server&#41;](../../relational-databases/hierarchical-data-sql-server.md).
     * @param {DependencyObject} element 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/data-types/getlevel-database-engine
     */
    GetLevel(element) {
        result := ComCall(13, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetLevel(element, value) {
        result := ComCall(14, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AnnotationsProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IVector<AutomationAnnotation>} 
     */
    GetAnnotations(element) {
        result := ComCall(16, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AutomationAnnotation, result_)
    }
}
