#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the primary object type that participates in the [XamlDirect](xamldirect.md) set of APIs.
 * @remarks
 * The [XamlDirect](xamldirect.md) APIs allows middleware authors to access most of Xaml at a more primitive level, achieving better CPU and working set performance.  
 * IXamlDirectObject is the minimal handle to Xaml's internal object instances. It is used only by [XamlDirect](xamldirect.md) APIs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.ixamldirectobject
 * @namespace Windows.UI.Xaml.Core.Direct
 * @version WindowsRuntime 1.4
 */
class IXamlDirectObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlDirectObject
     * @type {Guid}
     */
    static IID => Guid("{10614a82-cee4-4645-ba25-d071ce778355}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
