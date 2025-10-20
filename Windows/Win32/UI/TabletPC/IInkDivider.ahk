#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivider
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivider extends IDispatch{
    /**
     * The interface identifier for IInkDivider
     * @type {Guid}
     */
    static IID => Guid("{5de00405-f9a4-4651-b0c5-c317defd58b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    get_Strokes(Strokes) {
        result := ComCall(7, this, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    putref_Strokes(Strokes) {
        result := ComCall(8, this, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerContext>} RecognizerContext 
     * @returns {HRESULT} 
     */
    get_RecognizerContext(RecognizerContext) {
        result := ComCall(9, this, "ptr", RecognizerContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerContext>} RecognizerContext 
     * @returns {HRESULT} 
     */
    putref_RecognizerContext(RecognizerContext) {
        result := ComCall(10, this, "ptr", RecognizerContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LineHeight 
     * @returns {HRESULT} 
     */
    get_LineHeight(LineHeight) {
        result := ComCall(11, this, "int*", LineHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LineHeight 
     * @returns {HRESULT} 
     */
    put_LineHeight(LineHeight) {
        result := ComCall(12, this, "int", LineHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDivisionResult>} InkDivisionResult 
     * @returns {HRESULT} 
     */
    Divide(InkDivisionResult) {
        result := ComCall(13, this, "ptr", InkDivisionResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
