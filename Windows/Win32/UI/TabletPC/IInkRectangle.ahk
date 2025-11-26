#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrectangle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRectangle extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRectangle
     * @type {Guid}
     */
    static IID => Guid("{9794ff82-6071-4717-8a8b-6ac7c64a686e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Top", "put_Top", "get_Left", "put_Left", "get_Bottom", "put_Bottom", "get_Right", "put_Right", "get_Data", "put_Data", "GetRectangle", "SetRectangle"]

    /**
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Integer} 
     */
    Bottom {
        get => this.get_Bottom()
        set => this.put_Bottom(value)
    }

    /**
     * @type {Integer} 
     */
    Right {
        get => this.get_Right()
        set => this.put_Right(value)
    }

    /**
     * @type {RECT} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets or sets the top position of the InkRectangle object.
     * @remarks
     * 
     * Note: A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle Class</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left Property</a> or <b>Top Property</b> side or is within all four sides. A point on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_right">Right Property</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom Property</a> side is considered outside the rectangle.
     * 
     * The default value of this property is 0.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-get_top
     */
    get_Top() {
        result := ComCall(7, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the top position of the InkRectangle object.
     * @remarks
     * 
     * Note: A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle Class</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left Property</a> or <b>Top Property</b> side or is within all four sides. A point on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_right">Right Property</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom Property</a> side is considered outside the rectangle.
     * 
     * The default value of this property is 0.
     * 
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-put_top
     */
    put_Top(Units) {
        result := ComCall(8, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the left position of the InkRectangle object.
     * @remarks
     * 
     * The default value of this property is 0.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-get_left
     */
    get_Left() {
        result := ComCall(9, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the left position of the InkRectangle object.
     * @remarks
     * 
     * The default value of this property is 0.
     * 
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-put_left
     */
    put_Left(Units) {
        result := ComCall(10, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the bottom position of the InkRectangle object.
     * @remarks
     * 
     * The default value of this property is 0.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-get_bottom
     */
    get_Bottom() {
        result := ComCall(11, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the bottom position of the InkRectangle object.
     * @remarks
     * 
     * The default value of this property is 0.
     * 
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-put_bottom
     */
    put_Bottom(Units) {
        result := ComCall(12, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the right position of the InkRectangle object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_top">Top</a> side or is within all four sides. A point on the <b>Right</b> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom</a> side is considered outside the rectangle.</div>
     * <div> </div>
     * The default value of this property is 0.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-get_right
     */
    get_Right() {
        result := ComCall(13, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the right position of the InkRectangle object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_top">Top</a> side or is within all four sides. A point on the <b>Right</b> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom</a> side is considered outside the rectangle.</div>
     * <div> </div>
     * The default value of this property is 0.
     * 
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-put_right
     */
    put_Right(Units) {
        result := ComCall(14, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets access to the rectangle structure (C++ only).
     * @returns {RECT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-get_data
     */
    get_Data() {
        Rect := RECT()
        result := ComCall(15, this, "ptr", Rect, "HRESULT")
        return Rect
    }

    /**
     * Gets or sets access to the rectangle structure (C++ only).
     * @param {RECT} Rect 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-put_data
     */
    put_Data(Rect) {
        result := ComCall(16, this, "ptr", Rect, "HRESULT")
        return result
    }

    /**
     * Gets the elements of the InkRectangle object in a single call.
     * @param {Pointer<Integer>} Top The top of the rectangle.
     * @param {Pointer<Integer>} Left The left edge of the rectangle.
     * @param {Pointer<Integer>} Bottom The bottom of the rectangle.
     * @param {Pointer<Integer>} Right The right edge of the rectangle.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-getrectangle
     */
    GetRectangle(Top, Left, Bottom, Right) {
        TopMarshal := Top is VarRef ? "int*" : "ptr"
        LeftMarshal := Left is VarRef ? "int*" : "ptr"
        BottomMarshal := Bottom is VarRef ? "int*" : "ptr"
        RightMarshal := Right is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, TopMarshal, Top, LeftMarshal, Left, BottomMarshal, Bottom, RightMarshal, Right, "HRESULT")
        return result
    }

    /**
     * Sets the elements of the InkRectangle object in a single call.
     * @param {Integer} Top The top of the rectangle.
     * @param {Integer} Left The left of the rectangle.
     * @param {Integer} Bottom The bottom of the rectangle.
     * @param {Integer} Right The right of the rectangle.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrectangle-setrectangle
     */
    SetRectangle(Top, Left, Bottom, Right) {
        result := ComCall(18, this, "int", Top, "int", Left, "int", Bottom, "int", Right, "HRESULT")
        return result
    }
}
