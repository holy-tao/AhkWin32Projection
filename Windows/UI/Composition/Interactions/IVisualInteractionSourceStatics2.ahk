#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VisualInteractionSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IVisualInteractionSourceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualInteractionSourceStatics2
     * @type {Guid}
     */
    static IID => Guid("{a979c032-5764-55e0-bc1f-0778786dcfde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromIVisualElement"]

    /**
     * 
     * @param {IVisualElement} source 
     * @returns {VisualInteractionSource} 
     */
    CreateFromIVisualElement(source) {
        result := ComCall(6, this, "ptr", source, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualInteractionSource(result_)
    }
}
