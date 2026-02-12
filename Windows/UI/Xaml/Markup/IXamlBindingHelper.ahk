#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlBindingHelper extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlBindingHelper
     * @type {Guid}
     */
    static IID => Guid("{faa6fb06-8ab9-4ef7-8ae7-fbd30bbfd06d}")

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
