#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\InkRecognitionResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkManager
     * @type {Guid}
     */
    static IID => Guid("{4744737d-671b-4163-9c95-4e8d7a035fe1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mode", "put_Mode", "ProcessPointerDown", "ProcessPointerUpdate", "ProcessPointerUp", "SetDefaultDrawingAttributes", "RecognizeAsync2"]

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {HRESULT} 
     */
    ProcessPointerDown(pointerPoint_) {
        result := ComCall(8, this, "ptr", pointerPoint_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {IInspectable} 
     */
    ProcessPointerUpdate(pointerPoint_) {
        result := ComCall(9, this, "ptr", pointerPoint_, "ptr*", &updateInformation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(updateInformation)
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {RECT} 
     */
    ProcessPointerUp(pointerPoint_) {
        updateRectangle := RECT()
        result := ComCall(10, this, "ptr", pointerPoint_, "ptr", updateRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return updateRectangle
    }

    /**
     * 
     * @param {InkDrawingAttributes} drawingAttributes 
     * @returns {HRESULT} 
     */
    SetDefaultDrawingAttributes(drawingAttributes) {
        result := ComCall(11, this, "ptr", drawingAttributes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} recognitionTarget 
     * @returns {IAsyncOperation<IVectorView<InkRecognitionResult>>} 
     */
    RecognizeAsync2(recognitionTarget) {
        result := ComCall(12, this, "int", recognitionTarget, "ptr*", &recognitionResults := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, InkRecognitionResult), recognitionResults)
    }
}
