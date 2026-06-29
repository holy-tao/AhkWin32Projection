#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * . (IInkRectangle)
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkrectangle
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkRectangle extends IDispatch {
    /**
     * The interface identifier for IInkRectangle
     * @type {Guid}
     */
    static IID := Guid("{9794ff82-6071-4717-8a8b-6ac7c64a686e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkRectangle interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Top      : IntPtr
        put_Top      : IntPtr
        get_Left     : IntPtr
        put_Left     : IntPtr
        get_Bottom   : IntPtr
        put_Bottom   : IntPtr
        get_Right    : IntPtr
        put_Right    : IntPtr
        get_Data     : IntPtr
        put_Data     : IntPtr
        GetRectangle : IntPtr
        SetRectangle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkRectangle.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Gets or sets the top position of the InkRectangle object. (Get)
     * @remarks
     * Note: A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle Class</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left Property</a> or <b>Top Property</b> side or is within all four sides. A point on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_right">Right Property</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom Property</a> side is considered outside the rectangle.
     * 
     * The default value of this property is 0.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_top
     */
    get_Top() {
        result := ComCall(7, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the top position of the InkRectangle object. (Put)
     * @remarks
     * Note: A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle Class</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left Property</a> or <b>Top Property</b> side or is within all four sides. A point on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_right">Right Property</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom Property</a> side is considered outside the rectangle.
     * 
     * The default value of this property is 0.
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_top
     */
    put_Top(Units) {
        result := ComCall(8, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the left position of the InkRectangle object. (Get)
     * @remarks
     * The default value of this property is 0.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_left
     */
    get_Left() {
        result := ComCall(9, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the left position of the InkRectangle object. (Put)
     * @remarks
     * The default value of this property is 0.
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_left
     */
    put_Left(Units) {
        result := ComCall(10, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the bottom position of the InkRectangle object. (Get)
     * @remarks
     * The default value of this property is 0.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom
     */
    get_Bottom() {
        result := ComCall(11, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the bottom position of the InkRectangle object. (Put)
     * @remarks
     * The default value of this property is 0.
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_bottom
     */
    put_Bottom(Units) {
        result := ComCall(12, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the right position of the InkRectangle object. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_top">Top</a> side or is within all four sides. A point on the <b>Right</b> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom</a> side is considered outside the rectangle.</div>
     * <div> </div>
     * The default value of this property is 0.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_right
     */
    get_Right() {
        result := ComCall(13, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the right position of the InkRectangle object. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  A point is within an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> if it lies on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left">Left</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_top">Top</a> side or is within all four sides. A point on the <b>Right</b> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom">Bottom</a> side is considered outside the rectangle.</div>
     * <div> </div>
     * The default value of this property is 0.
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_right
     */
    put_Right(Units) {
        result := ComCall(14, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets access to the rectangle structure (C++ only). (Get)
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_data
     */
    get_Data() {
        _Rect := RECT()
        result := ComCall(15, this, RECT.Ptr, _Rect, "HRESULT")
        return _Rect
    }

    /**
     * Gets or sets access to the rectangle structure (C++ only). (Put)
     * @param {RECT} _Rect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_data
     */
    put_Data(_Rect) {
        result := ComCall(16, this, RECT, _Rect, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-getrectangle
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
     * @remarks
     * <div class="alert"><b>Note</b>  The order of the parameters in this method (<i>Top</i>, <i>Left</i>, <i>Bottom</i>, and <i>Right</i>) is different from the expected order (<i>Left</i>, <i>Top</i>, <i>Right</i>, and <i>Bottom</i>).</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-setrectangle
     */
    SetRectangle(Top, Left, Bottom, Right) {
        result := ComCall(18, this, "int", Top, "int", Left, "int", Bottom, "int", Right, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkRectangle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Top := CallbackCreate(GetMethod(implObj, "get_Top"), flags, 2)
        this.vtbl.put_Top := CallbackCreate(GetMethod(implObj, "put_Top"), flags, 2)
        this.vtbl.get_Left := CallbackCreate(GetMethod(implObj, "get_Left"), flags, 2)
        this.vtbl.put_Left := CallbackCreate(GetMethod(implObj, "put_Left"), flags, 2)
        this.vtbl.get_Bottom := CallbackCreate(GetMethod(implObj, "get_Bottom"), flags, 2)
        this.vtbl.put_Bottom := CallbackCreate(GetMethod(implObj, "put_Bottom"), flags, 2)
        this.vtbl.get_Right := CallbackCreate(GetMethod(implObj, "get_Right"), flags, 2)
        this.vtbl.put_Right := CallbackCreate(GetMethod(implObj, "put_Right"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
        this.vtbl.GetRectangle := CallbackCreate(GetMethod(implObj, "GetRectangle"), flags, 5)
        this.vtbl.SetRectangle := CallbackCreate(GetMethod(implObj, "SetRectangle"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Top)
        CallbackFree(this.vtbl.put_Top)
        CallbackFree(this.vtbl.get_Left)
        CallbackFree(this.vtbl.put_Left)
        CallbackFree(this.vtbl.get_Bottom)
        CallbackFree(this.vtbl.put_Bottom)
        CallbackFree(this.vtbl.get_Right)
        CallbackFree(this.vtbl.put_Right)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
        CallbackFree(this.vtbl.GetRectangle)
        CallbackFree(this.vtbl.SetRectangle)
    }
}
