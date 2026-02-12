#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The **IPrintDocumentSource** describes the source of the print document.
 * @remarks
 * This interface is implemented by the **[Windows.UI.Xaml.Printing.PrintDocument](/uwp/api/windows.ui.xaml.printing.printdocument)** class. Its implementation must be carried through to the print system by the [SetSource](printtasksourcerequestedargs_setsource_1925283600.md) method in [PrintTaskSourceRequestedArgs](printtasksourcerequestedargs.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprintdocumentsource
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintDocumentSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintDocumentSource
     * @type {Guid}
     */
    static IID => Guid("{dedc0c30-f1eb-47df-aae6-ed5427511f01}")

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
