#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXamlType.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Implements XAML type resolution and provides the mapping between types used in markup and the corresponding classes implemented in an application or component.
 * @remarks
 * The XAML compiler generates implementations of the interface within each component (application, library, or WinRT component) that uses XAML. In applications, the implementation is generated on the application object itself. For libraries and WinRT components, the implementation is generated on an anonymous class created by the XAML compiler. Each IXamlMetadataProvider implementation provides type information for the controls defined in the component it's generated in.
 * 
 * For more info on IXamlMetadataProvider, [IXamlType](ixamltype.md) and [IXamlMember](ixamlmember.md) and how these are used for XAML custom types, see "Remarks" section of [IXamlType](ixamltype.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmetadataprovider
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlMetadataProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlMetadataProvider
     * @type {Guid}
     */
    static IID => Guid("{b3765d69-68a5-4b32-8861-fdb90c1f5836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXamlType", "GetXamlTypeByFullName", "GetXmlnsDefinitions"]

    /**
     * Implements XAML schema context access to underlying type mapping, based on specifying a full type name.
     * @param {TypeName} type 
     * @returns {IXamlType} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmetadataprovider.getxamltype
     */
    GetXamlType(type) {
        result := ComCall(6, this, "ptr", type, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(result_)
    }

    /**
     * Implements XAML schema context access to underlying type mapping, based on specifying a full type name.
     * @param {HSTRING} fullName The name of the class for which to return a XAML type mapping.
     * @returns {IXamlType} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmetadataprovider.getxamltype
     */
    GetXamlTypeByFullName(fullName) {
        if(fullName is String) {
            pin := HSTRING.Create(fullName)
            fullName := pin.Value
        }
        fullName := fullName is Win32Handle ? NumGet(fullName, "ptr") : fullName

        result := ComCall(7, this, "ptr", fullName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(result_)
    }

    /**
     * Gets the set of XMLNS (XAML namespace) definitions that apply to the context.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} The set of XMLNS (XAML namespace) definitions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmetadataprovider.getxmlnsdefinitions
     */
    GetXmlnsDefinitions(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
