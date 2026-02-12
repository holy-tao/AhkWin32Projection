#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerVector2InertiaModifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerVector2InertiaModifier
     * @type {Guid}
     */
    static IID => Guid("{87e08ab0-3086-4853-a4b7-77882ad5d7e3}")

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
