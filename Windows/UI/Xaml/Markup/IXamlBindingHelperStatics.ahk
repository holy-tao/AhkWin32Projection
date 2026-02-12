#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include .\IDataTemplateComponent.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlBindingHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlBindingHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{f65cfb71-c80c-4ffa-86ee-558754ee336d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataTemplateComponentProperty", "GetDataTemplateComponent", "SetDataTemplateComponent", "SuspendRendering", "ResumeRendering", "ConvertValue", "SetPropertyFromString", "SetPropertyFromBoolean", "SetPropertyFromChar16", "SetPropertyFromDateTime", "SetPropertyFromDouble", "SetPropertyFromInt32", "SetPropertyFromUInt32", "SetPropertyFromInt64", "SetPropertyFromUInt64", "SetPropertyFromSingle", "SetPropertyFromPoint", "SetPropertyFromRect", "SetPropertyFromSize", "SetPropertyFromTimeSpan", "SetPropertyFromByte", "SetPropertyFromUri", "SetPropertyFromObject"]

    /**
     * @type {DependencyProperty} 
     */
    DataTemplateComponentProperty {
        get => this.get_DataTemplateComponentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DataTemplateComponentProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IDataTemplateComponent} 
     */
    GetDataTemplateComponent(element) {
        result := ComCall(7, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDataTemplateComponent(result_)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {IDataTemplateComponent} value 
     * @returns {HRESULT} 
     */
    SetDataTemplateComponent(element, value) {
        result := ComCall(8, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} target 
     * @returns {HRESULT} 
     */
    SuspendRendering(target) {
        result := ComCall(9, this, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} target 
     * @returns {HRESULT} 
     */
    ResumeRendering(target) {
        result := ComCall(10, this, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypeName} type 
     * @param {IInspectable} value 
     * @returns {IInspectable} 
     */
    ConvertValue(type, value) {
        result := ComCall(11, this, "ptr", type, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromString(dependencyObject_, propertyToSet, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromBoolean(dependencyObject_, propertyToSet, value) {
        result := ComCall(13, this, "ptr", dependencyObject_, "ptr", propertyToSet, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromChar16(dependencyObject_, propertyToSet, value) {
        result := ComCall(14, this, "ptr", dependencyObject_, "ptr", propertyToSet, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromDateTime(dependencyObject_, propertyToSet, value) {
        result := ComCall(15, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromDouble(dependencyObject_, propertyToSet, value) {
        result := ComCall(16, this, "ptr", dependencyObject_, "ptr", propertyToSet, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromInt32(dependencyObject_, propertyToSet, value) {
        result := ComCall(17, this, "ptr", dependencyObject_, "ptr", propertyToSet, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromUInt32(dependencyObject_, propertyToSet, value) {
        result := ComCall(18, this, "ptr", dependencyObject_, "ptr", propertyToSet, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromInt64(dependencyObject_, propertyToSet, value) {
        result := ComCall(19, this, "ptr", dependencyObject_, "ptr", propertyToSet, "int64", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromUInt64(dependencyObject_, propertyToSet, value) {
        result := ComCall(20, this, "ptr", dependencyObject_, "ptr", propertyToSet, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromSingle(dependencyObject_, propertyToSet, value) {
        result := ComCall(21, this, "ptr", dependencyObject_, "ptr", propertyToSet, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromPoint(dependencyObject_, propertyToSet, value) {
        result := ComCall(22, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromRect(dependencyObject_, propertyToSet, value) {
        result := ComCall(23, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromSize(dependencyObject_, propertyToSet, value) {
        result := ComCall(24, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromTimeSpan(dependencyObject_, propertyToSet, value) {
        result := ComCall(25, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromByte(dependencyObject_, propertyToSet, value) {
        result := ComCall(26, this, "ptr", dependencyObject_, "ptr", propertyToSet, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromUri(dependencyObject_, propertyToSet, value) {
        result := ComCall(27, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} dependencyObject_ 
     * @param {DependencyProperty} propertyToSet 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetPropertyFromObject(dependencyObject_, propertyToSet, value) {
        result := ComCall(28, this, "ptr", dependencyObject_, "ptr", propertyToSet, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
