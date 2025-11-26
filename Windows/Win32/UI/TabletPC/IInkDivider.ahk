#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkRecognizerContext.ahk
#Include .\IInkDivisionResult.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivider
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivider extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "putref_Strokes", "get_RecognizerContext", "putref_RecognizerContext", "get_LineHeight", "put_LineHeight", "Divide"]

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {IInkRecognizerContext} 
     */
    RecognizerContext {
        get => this.get_RecognizerContext()
    }

    /**
     * @type {Integer} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-putref_strokes
     */
    putref_Strokes(Strokes) {
        result := ComCall(8, this, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkRecognizerContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-get_recognizercontext
     */
    get_RecognizerContext() {
        result := ComCall(9, this, "ptr*", &RecognizerContext := 0, "HRESULT")
        return IInkRecognizerContext(RecognizerContext)
    }

    /**
     * 
     * @param {IInkRecognizerContext} RecognizerContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-putref_recognizercontext
     */
    putref_RecognizerContext(RecognizerContext) {
        result := ComCall(10, this, "ptr", RecognizerContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-get_lineheight
     */
    get_LineHeight() {
        result := ComCall(11, this, "int*", &LineHeight := 0, "HRESULT")
        return LineHeight
    }

    /**
     * 
     * @param {Integer} LineHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-put_lineheight
     */
    put_LineHeight(LineHeight) {
        result := ComCall(12, this, "int", LineHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDivisionResult} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-divide
     */
    Divide() {
        result := ComCall(13, this, "ptr*", &InkDivisionResult := 0, "HRESULT")
        return IInkDivisionResult(InkDivisionResult)
    }
}
