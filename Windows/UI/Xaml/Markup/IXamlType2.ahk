#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXamlType.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the means to report XAML-type system specifics about XAML types. Using this interface contract, XAML parsers can load any custom types and members thereof that are defined in your app and are referenced in XAML files.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype2
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlType2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlType2
     * @type {Guid}
     */
    static IID => Guid("{9f0c6e3b-433b-56ad-8f69-78a4dd3e64f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BoxedType"]

    /**
     * Gets the [IXamlType](ixamltype.md) for the boxed type of the XAML type. Determination of this value is based on the underlying type for core types.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype2.boxedtype
     * @type {IXamlType} 
     */
    BoxedType {
        get => this.get_BoxedType()
    }

    /**
     * 
     * @returns {IXamlType} 
     */
    get_BoxedType() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(value)
    }
}
