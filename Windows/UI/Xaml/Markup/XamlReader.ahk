#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlReader.ahk
#Include .\IXamlReaderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a XAML processor engine for parsing XAML and creating corresponding object trees.
 * @remarks
 * XamlReader  is a utility class with methods that create objects based on an input of XAML markup in string form. XamlReader provides object construction behavior that parallels how XAML is parsed by the Windows Runtime XAML parser and the use of XAML for defining the UI of a UWP app.
 * 
 * Parsing the XAML input with [XamlReader.Load](xamlreader_load_1077941801.md) generates run-time object trees of Windows Runtime objects. The object tree provides a way to program against those objects at run time, by walking through parts of the complete tree.
 * 
 * There are several concepts that are important to understand, when you create objects from XAML with the [XamlReader.Load](xamlreader_load_1077941801.md) method:
 * 
 * 
 * + The XAML content string must define a single root element.
 * + The XAML content string must be well-formed XML, as well as being valid XAML.
 * + The XAML content must define a default xmlns. Typically this is the Windows Runtime XAML vocabulary, as identified by `http://schemas.microsoft.com/winfx/2006/xaml/presentation`.
 * + Any custom assemblies referenced in a XAML namespace mapping must already be available to the application.
 * + The XAML should not attempt to specify [x:Class attribute](/windows/uwp/xaml-platform/x-class-attribute), or include any XAML-defined attributes for event handlers.
 * + You can't use [FindName](../windows.ui.xaml/frameworkelement_findname_634111277.md) in the general XAML namescope to find a runtime object added, but you can search within the specific XAML namescope of the object created. For more info, see [XAML namescopes](/windows/uwp/xaml-platform/xaml-namescopes).
 * + Object creation logic cannot integrate the loaded XAML with code-behind classes at run time. If you want to add event handlers, you must do so in code by referencing objects obtained from within the object tree structure of the [Load](xamlreader_load_1077941801.md) result, and using language-specific syntax for attaching handlers (such as `+=`).
 * + There must be existing XAML content; you cannot replace the entire tree of content. You must at the very least preserve the original root element so that the app model implications of a loaded XAML page remain active.
 * + The object that is created from [Load](xamlreader_load_1077941801.md) can be assigned to only one location in the primary object tree. If you want to add objects created from identical XAML to different areas of the application's primary object tree, you must parse the XAML multiple times using the same input string, using different destinations for the return value.
 * + The primary object tree remaining must support an appropriate property to set.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xamlreader
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class XamlReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlReader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Parses a well-formed XAML fragment and creates a corresponding object tree, and returns the root of the object tree.
     * @remarks
     * [XamlReader](xamlreader.md) provides object construction behavior that parallels how XAML is parsed by the Windows Runtime XAML parser and the use of XAML for defining the UI of a UWP app. Parsing the XAML input with XamlReader.Load generates run-time object trees of Windows Runtime objects. The object tree provides a way to program against those objects at run time, by walking through parts of the complete tree.
     * 
     * There are several concepts that are important to understand, when you create objects from XAML with the XamlReader.Load method:
     * 
     * 
     * + The XAML content string must define a single root element.
     * + The XAML content string must be well-formed XML, as well as being valid XAML.
     * + The XAML content must define a default xmlns. Typically this is the Windows Runtime XAML vocabulary, as identified by `http://schemas.microsoft.com/winfx/2006/xaml/presentation`.
     * + Any custom assemblies referenced in a XAML namespace mapping must already be available to the application.
     * + The XAML should not attempt to specify [x:Class attribute](/windows/uwp/xaml-platform/x-class-attribute), or include any XAML-defined attributes for event handlers.
     * + You can't use [FindName](../windows.ui.xaml/frameworkelement_findname_634111277.md) in the general XAML namescope to find a runtime object added, but you can search within the specific XAML namescope of the object created. For more info, see [XAML namescopes](/windows/uwp/xaml-platform/xaml-namescopes).
     * + Object creation logic cannot integrate the loaded XAML with code-behind classes at run time. If you want to add event handlers, you must do so in code by referencing objects obtained from within the object tree structure of the Load result, and using language-specific syntax for attaching handlers (such as `+=`).
     * + There must be existing XAML content; you cannot replace the entire tree of content. You must at the very least preserve the original root element so that the app model implications of a loaded XAML page remain active.
     * + The object that is created from Load can be assigned to only one location in the primary object tree. If you want to add objects created from identical XAML to different areas of the application's primary object tree, you must parse the XAML multiple times using the same input string, using different destinations for the return value.
     * + The primary object tree remaining must support an appropriate property to set.
     * @param {HSTRING} xaml A string that contains a valid XAML fragment.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xamlreader.load
     */
    static Load(xaml) {
        if (!XamlReader.HasProp("__IXamlReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Markup.XamlReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlReaderStatics.IID)
            XamlReader.__IXamlReaderStatics := IXamlReaderStatics(factoryPtr)
        }

        return XamlReader.__IXamlReaderStatics.Load(xaml)
    }

    /**
     * Parses a well-formed XAML fragment creates a corresponding object tree, and returns the root of the object tree. Also performs load-time validation of any linked templates.
     * @remarks
     * Usage for LoadWithInitialTemplateValidation is generally the same as for [XamlReader.Load](xamlreader_load_1077941801.md). For more info, see "Remarks" section of [XamlReader.Load](xamlreader_load_1077941801.md). Most apps won't need the template validation feature; that aspect is more intended for design tools that are actively changing and reloading XAML, and perhaps enabling real-time XAML template editing.
     * @param {HSTRING} xaml A string that contains a valid XAML fragment.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xamlreader.loadwithinitialtemplatevalidation
     */
    static LoadWithInitialTemplateValidation(xaml) {
        if (!XamlReader.HasProp("__IXamlReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Markup.XamlReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlReaderStatics.IID)
            XamlReader.__IXamlReaderStatics := IXamlReaderStatics(factoryPtr)
        }

        return XamlReader.__IXamlReaderStatics.LoadWithInitialTemplateValidation(xaml)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
