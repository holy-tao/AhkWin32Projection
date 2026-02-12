#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PointerPoint.ahk
#Include .\InkStroke.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokeBuilder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeBuilder
     * @type {Guid}
     */
    static IID => Guid("{82bbd1dc-1c63-41dc-9e07-4b4a70ced801}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginStroke", "AppendToStroke", "EndStroke", "CreateStroke", "SetDefaultDrawingAttributes"]

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {HRESULT} 
     */
    BeginStroke(pointerPoint_) {
        result := ComCall(6, this, "ptr", pointerPoint_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {PointerPoint} 
     */
    AppendToStroke(pointerPoint_) {
        result := ComCall(7, this, "ptr", pointerPoint_, "ptr*", &previousPointerPoint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerPoint(previousPointerPoint)
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {InkStroke} 
     */
    EndStroke(pointerPoint_) {
        result := ComCall(8, this, "ptr", pointerPoint_, "ptr*", &stroke := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStroke(stroke)
    }

    /**
     * 
     * @param {IIterable<POINT>} points_ 
     * @returns {InkStroke} 
     */
    CreateStroke(points_) {
        result := ComCall(9, this, "ptr", points_, "ptr*", &stroke := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStroke(stroke)
    }

    /**
     * 
     * @param {InkDrawingAttributes} drawingAttributes 
     * @returns {HRESULT} 
     */
    SetDefaultDrawingAttributes(drawingAttributes) {
        result := ComCall(10, this, "ptr", drawingAttributes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
