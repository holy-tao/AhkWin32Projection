#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IOrientedVirtualizingPanelFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOrientedVirtualizingPanelFactory
     * @type {Guid}
     */
    static IID => Guid("{7b8eaeaf-f92f-439d-9ebf-e9919f56c94d}")

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
