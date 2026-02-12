#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An object that is being tracked for interactions in the compositor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.icompositioninteractionsource
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class ICompositionInteractionSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionInteractionSource
     * @type {Guid}
     */
    static IID => Guid("{043b2431-06e3-495a-ba54-409f0017fac0}")

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
