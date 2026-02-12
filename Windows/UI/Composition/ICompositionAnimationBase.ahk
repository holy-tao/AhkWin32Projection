#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Base class for composition animations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionanimationbase
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionAnimationBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionAnimationBase
     * @type {Guid}
     */
    static IID => Guid("{1c2c2999-e818-48d3-a6dd-d78c82f8ace9}")

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
