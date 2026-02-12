#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods that allow the data to be modified as it passes through the binding engine.
 * @remarks
 * You can create a class that allows you to convert the format of your data between the source and the target by inheriting from IValueConverter. For example, you might want to have a list of colors that you store as **RGBA** values, but display them with color names in the UI. By implementing [Convert](ivalueconverter_convert_101701969.md) and [ConvertBack](ivalueconverter_convertback_2106225504.md), you can change the format of the data values as they are passed between the target and source by the binding engine.
 * You should always implement [Convert](ivalueconverter_convert_101701969.md) with a functional implementation, but it's fairly common to implement [ConvertBack](ivalueconverter_convertback_2106225504.md) so that it reports a not-implemented exception. You only need a [ConvertBack](ivalueconverter_convertback_2106225504.md) method in your converter if you are using the converter for two-way bindings, or using XAML for serialization.
 * 
 * [UnsetValue](../windows.ui.xaml/dependencyproperty_unsetvalue.md) should be returned from an IValueConverter implementation that provides conversion in a data binding to a dependency property, in any case where the converter is unable to convert a source value. Converters shouldn't throw exceptions for that case in [Convert](ivalueconverter_convert_101701969.md); these will surface as run-time exceptions that you'd need to add handling for in [UnhandledException](../windows.ui.xaml/application_unhandledexception.md) or worse yet appear to users as actual run-time exceptions. Converter implementations should follow the general binding pattern that any failed binding does nothing and does not provide a value, and [UnsetValue](../windows.ui.xaml/dependencyproperty_unsetvalue.md) rather than **null** is the sentinel value for that case that the binding engine understands. For more info, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * 
 * 
 * > [!NOTE]
 * > To data-bind to a custom value converter that is written in Visual C++ component extensions (C++/CX), the header file in which the IValueConverter implementation class is defined must be included, directly or indirectly, in one of the code-behind files. For more info, see [Create your first  using C++](/previous-versions/windows/hh465045(v=win.10)).
 * 
 * > [!TIP]
 * > Some of the default project templates for a UWP app include a helper class, BooleanToVisibilityConverter. This class is an IValueConverter implementation that handles a common custom-control scenario where you use Boolean values from your control logic class to set the [Visibility](../windows.ui.xaml/uielement_visibility.md) value in XAML control templates.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.ivalueconverter
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IValueConverter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValueConverter
     * @type {Guid}
     */
    static IID => Guid("{e6f2fef0-0712-487f-b313-f300b8d79aa1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Convert", "ConvertBack"]

    /**
     * Modifies the source data before passing it to the target for display in the UI.
     * @remarks
     * The *targetType* parameter of the Convert method uses different techniques of reporting the type system info, depending on whether you're programming with Microsoft .NET or C++.
     * + For Microsoft .NET, this parameter passes an instance of the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) type.
     * + For C++/CX and C++/WinRT, this parameter passes a [TypeName](../windows.ui.xaml.interop/typename.md) structure value. `TypeName::Kind` contains the simple string name of the type, similar to Microsoft .NET's `Type.Name`.
     * When the converter is invoked by the binding engine, the *targetType* value is passed by looking up the property type of the target dependency property. You might use this value in your Convert implementation for one of two reasons:
     * + Your converter has the expectation that it's always going to return objects of a specific type, and you want to verify that the binding that the converter is called for is using the converter correctly. If not, you might return a fallback value, or throw an exception (but see "Exceptions from converters" below).
     * + Your converter can return more than one type, and you want the usage to inform your converter which type it should return. For example, you could implement an object-to-object conversion and an object-to-string conversion within the same converter code.
     * 
     * 
     * *language* comes from the [ConverterLanguage](binding_converterlanguage.md) value of a specific binding, not system values, so you should expect that it might be an empty string.
     * 
     * *parameter* comes from the [ConverterParameter](binding_converterparameter.md) value of a specific binding, and is **null** by default. If your converter uses parameters to modify what it returns, this usually requires some convention for validating what is passed by the binding and handled by the converter. A common convention is to pass strings that name modes for your converter that result in different return values. For example you might have "Simple" and "Verbose" modes that return different length strings that are each appropriate for display in different UI control types and layouts.
     * @param {IInspectable} value The source data being passed to the target.
     * @param {TypeName} targetType The type of the target property, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for C++/CX and C++/WinRT).
     * @param {IInspectable} parameter An optional parameter to be used in the converter logic.
     * @param {HSTRING} language_ The language of the conversion.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.ivalueconverter.convert
     */
    Convert(value, targetType, parameter, language_) {
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(6, this, "ptr", value, "ptr", targetType, "ptr", parameter, "ptr", language_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Modifies the target data before passing it to the source object. This method is called only in **TwoWay** bindings.
     * @remarks
     * If you don't use a converter for **TwoWay** bindings it's acceptable to leave ConvertBack unimplemented (uses the template default from Visual Studio where it returns a **NotImplementedException**).
     * @param {IInspectable} value The target data being passed to the source.
     * @param {TypeName} targetType The type of the target property, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {IInspectable} parameter An optional parameter to be used in the converter logic.
     * @param {HSTRING} language_ The language of the conversion.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.ivalueconverter.convertback
     */
    ConvertBack(value, targetType, parameter, language_) {
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(7, this, "ptr", value, "ptr", targetType, "ptr", parameter, "ptr", language_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
