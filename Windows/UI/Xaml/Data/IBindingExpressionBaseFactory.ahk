#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IBindingExpressionBaseFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindingExpressionBaseFactory
     * @type {Guid}
     */
    static IID => Guid("{ea7116a7-c2d9-4375-b471-66b9c48c7930}")

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
