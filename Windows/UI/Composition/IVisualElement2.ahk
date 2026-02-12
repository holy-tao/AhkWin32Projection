#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a method that retrieves an object's underlying [Visual](visual.md).
 * @remarks
 * When an object, like `UIElement`, implements this interface, the composition engine can call `GetVisualInternal` to get its underlying [Visual](visual.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ivisualelement2
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisualElement2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualElement2
     * @type {Guid}
     */
    static IID => Guid("{993ae8a0-6057-5e40-918c-e06e0b7e7c64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisualInternal"]

    /**
     * Retrieves the `Visual` that the element resolves to.
     * @returns {Visual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ivisualelement2.getvisualinternal
     */
    GetVisualInternal() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(result_)
    }
}
