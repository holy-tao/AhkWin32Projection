#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionBrush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a property for working with a [CompositionBrush](compositionbrush.md) as a system backdrop. A [SpriteVisual](spritevisual.md) with the given [CompositionBrush](compositionbrush.md) will be placed at the back of the implementing object's subtree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionsupportssystembackdrop
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionSupportsSystemBackdrop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionSupportsSystemBackdrop
     * @type {Guid}
     */
    static IID => Guid("{397dafe4-b6c2-5bb9-951d-f5707de8b7bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SystemBackdrop", "put_SystemBackdrop"]

    /**
     * Gets or sets the [CompositionBrush](compositionbrush.md) to be used as the system backdrop.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionsupportssystembackdrop.systembackdrop
     * @type {CompositionBrush} 
     */
    SystemBackdrop {
        get => this.get_SystemBackdrop()
        set => this.put_SystemBackdrop(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_SystemBackdrop() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBrush(value)
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_SystemBackdrop(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
