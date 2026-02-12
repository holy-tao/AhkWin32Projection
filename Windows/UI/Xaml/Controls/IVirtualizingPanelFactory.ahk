#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IVirtualizingPanelFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizingPanelFactory
     * @type {Guid}
     */
    static IID => Guid("{be19f839-cbd0-43e9-a5d0-0bdba0ffbd38}")

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
