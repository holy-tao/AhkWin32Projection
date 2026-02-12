#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAnnotationPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnnotationPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{e0e3a35d-d167-46dc-95ab-330af61aebb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnnotationTypeIdProperty", "get_AnnotationTypeNameProperty", "get_AuthorProperty", "get_DateTimeProperty", "get_TargetProperty"]

    /**
     * @type {AutomationProperty} 
     */
    AnnotationTypeIdProperty {
        get => this.get_AnnotationTypeIdProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    AnnotationTypeNameProperty {
        get => this.get_AnnotationTypeNameProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    AuthorProperty {
        get => this.get_AuthorProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    DateTimeProperty {
        get => this.get_DateTimeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    TargetProperty {
        get => this.get_TargetProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AnnotationTypeIdProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AnnotationTypeNameProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AuthorProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_DateTimeProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_TargetProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
