#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Input\Inking\InkDrawingAttributes.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarCustomPenOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarCustomPenOverrides
     * @type {Guid}
     */
    static IID => Guid("{9d22eb6c-1255-4256-b6bd-82c2fd273488}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInkDrawingAttributesCore"]

    /**
     * 
     * @param {Brush} brush_ 
     * @param {Float} strokeWidth 
     * @returns {InkDrawingAttributes} 
     */
    CreateInkDrawingAttributesCore(brush_, strokeWidth) {
        result := ComCall(6, this, "ptr", brush_, "double", strokeWidth, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributes(result_)
    }
}
