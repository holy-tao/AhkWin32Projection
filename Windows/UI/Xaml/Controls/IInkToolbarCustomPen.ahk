#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Input\Inking\InkDrawingAttributes.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarCustomPen extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarCustomPen
     * @type {Guid}
     */
    static IID => Guid("{4082207b-2f3d-4e6a-8c27-fe61ef7e70eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInkDrawingAttributes"]

    /**
     * 
     * @param {Brush} brush_ 
     * @param {Float} strokeWidth 
     * @returns {InkDrawingAttributes} 
     */
    CreateInkDrawingAttributes(brush_, strokeWidth) {
        result := ComCall(6, this, "ptr", brush_, "double", strokeWidth, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributes(result_)
    }
}
