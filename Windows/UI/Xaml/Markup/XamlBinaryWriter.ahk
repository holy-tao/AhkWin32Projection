#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlBinaryWriter.ahk
#Include .\IXamlBinaryWriterStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Produces a pre-parsed binary representation of a XAML production.
 * @remarks
 * The binary representation of XAML uses an XBF file extension. The binary representation enables performance advantages versus loading and parsing a XAML file as text. Loading the binary representation is most useful when loading XAML files that define large resources, such as the generic.xaml files that define templates.
 * 
 * XamlBinaryWriter is not intended for use by typical app code. It is intended for use by tools and processes that are directly involved in producing an app package on a developer's machine.
 * 
 * The XBF format is intended to be write-once. Anyone compiling into the XBF format should always maintain that same XAML in its text representation, so that tools or processes can edit the XAML, and so that the source XAML remains human-readable.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xamlbinarywriter
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class XamlBinaryWriter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlBinaryWriter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlBinaryWriter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Produces a binary representation of XAML. Input streams are produced in text representation, and output streams are populated with XAML in binary (XBF) representation.
     * 
     * > [!IMPORTANT]
     * > [XamlBinaryWriter](xamlbinarywriter.md) is not intended for use by typical app code. It is intended for use by tools and processes that are directly involved in producing an app package on a developer's machine.
     * @remarks
     * Any input stream that generated error information is skipped and won't write anything into the corresponding output stream.
     * @param {IVector<IRandomAccessStream>} inputStreams The set of input streams. These are expected to access the text representation of the XAML to write into XBF format.
     * @param {IVector<IRandomAccessStream>} outputStreams The set of output streams. When the method returns each output stream provides access to the XBF binary representation. You'd typically use this stream to create a file.
     * @param {IXamlMetadataProvider} xamlMetadataProvider A helper object that maps types for XAML productions.
     * @returns {XamlBinaryWriterErrorInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xamlbinarywriter.write
     */
    static Write(inputStreams, outputStreams, xamlMetadataProvider) {
        if (!XamlBinaryWriter.HasProp("__IXamlBinaryWriterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Markup.XamlBinaryWriter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlBinaryWriterStatics.IID)
            XamlBinaryWriter.__IXamlBinaryWriterStatics := IXamlBinaryWriterStatics(factoryPtr)
        }

        return XamlBinaryWriter.__IXamlBinaryWriterStatics.Write(inputStreams, outputStreams, xamlMetadataProvider)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
