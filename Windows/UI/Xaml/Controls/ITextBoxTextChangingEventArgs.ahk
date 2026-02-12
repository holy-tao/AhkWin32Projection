#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBoxTextChangingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxTextChangingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4e6a4b75-43dd-4e33-acbe-2d8796a17927}")

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
