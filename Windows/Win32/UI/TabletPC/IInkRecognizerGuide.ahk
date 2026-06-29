#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\InkRecoGuide.ahk" { InkRecoGuide }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInkRectangle.ahk" { IInkRectangle }

/**
 * . (IInkRecognizerGuide)
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkrecognizerguide
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkRecognizerGuide extends IDispatch {
    /**
     * The interface identifier for IInkRecognizerGuide
     * @type {Guid}
     */
    static IID := Guid("{d934be07-7b84-4208-9136-83c20994e905}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkRecognizerGuide interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_WritingBox : IntPtr
        put_WritingBox : IntPtr
        get_DrawnBox   : IntPtr
        put_DrawnBox   : IntPtr
        get_Rows       : IntPtr
        put_Rows       : IntPtr
        get_Columns    : IntPtr
        put_Columns    : IntPtr
        get_Midline    : IntPtr
        put_Midline    : IntPtr
        get_GuideData  : IntPtr
        put_GuideData  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkRecognizerGuide.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IInkRectangle} 
     */
    WritingBox {
        get => this.get_WritingBox()
        set => this.put_WritingBox(value)
    }

    /**
     * @type {IInkRectangle} 
     */
    DrawnBox {
        get => this.get_DrawnBox()
        set => this.put_DrawnBox(value)
    }

    /**
     * @type {Integer} 
     */
    Rows {
        get => this.get_Rows()
        set => this.put_Rows(value)
    }

    /**
     * @type {Integer} 
     */
    Columns {
        get => this.get_Columns()
        set => this.put_Columns(value)
    }

    /**
     * @type {Integer} 
     */
    Midline {
        get => this.get_Midline()
        set => this.put_Midline(value)
    }

    /**
     * @type {InkRecoGuide} 
     */
    GuideData {
        get => this.get_GuideData()
        set => this.put_GuideData(value)
    }

    /**
     * Gets or sets the invisible writing area of the recognition guide in which writing can actually take place. (Get)
     * @remarks
     * The writing box provides a margin of error to users who write outside the drawn box-the lines that are physically drawn on the tablet screen within which users write. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox">DrawnBox</a> property to set the drawn box.
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_writingbox
     */
    get_WritingBox() {
        result := ComCall(7, this, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Gets or sets the invisible writing area of the recognition guide in which writing can actually take place. (Put)
     * @remarks
     * The writing box provides a margin of error to users who write outside the drawn box-the lines that are physically drawn on the tablet screen within which users write. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox">DrawnBox</a> property to set the drawn box.
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_writingbox
     */
    put_WritingBox(Rectangle) {
        result := ComCall(8, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Gets or sets the box that is physically drawn on the tablet's screen and in which writing takes place. (Get)
     * @remarks
     * The lines of the drawn box are visual cues that specify where writing can take place. The user normally writes within the boundaries of the lines.
     * 
     * Another box, the writing box, is the invisible box in which writing can actually take place. It is larger than the drawn box and provides a margin of error to users if they draw ink outside the lines of the drawn box. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_writingbox">WritingBox</a> property to set the writing box.
     * 
     * The writing box specifies the boundaries of the ink to the recognizer.The drawn box is drawn using ink space  units, relative to the top left of the writing box.
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox
     */
    get_DrawnBox() {
        result := ComCall(9, this, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Gets or sets the box that is physically drawn on the tablet's screen and in which writing takes place. (Put)
     * @remarks
     * The lines of the drawn box are visual cues that specify where writing can take place. The user normally writes within the boundaries of the lines.
     * 
     * Another box, the writing box, is the invisible box in which writing can actually take place. It is larger than the drawn box and provides a margin of error to users if they draw ink outside the lines of the drawn box. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_writingbox">WritingBox</a> property to set the writing box.
     * 
     * The writing box specifies the boundaries of the ink to the recognizer.The drawn box is drawn using ink space  units, relative to the top left of the writing box.
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_drawnbox
     */
    put_DrawnBox(Rectangle) {
        result := ComCall(10, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Gets or sets the number of rows in the recognition guide. (Get)
     * @remarks
     * Row height is determined by the size of the drawn box. To get or set the drawn box, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox">DrawnBox</a> property.
     * 
     * Use the values of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns">Columns</a> and <b>Rows</b> properties to control the kind of recognition input that you use. When the <b>Columns</b> and <b>Rows</b> properties are both greater than zero, boxed input is used. The following table lists potential input modes and which values to set the <b>Columns</b> and <b>Rows</b> properties for each mode.
     * 
     * <table>
     * <tr>
     * <th>For this type of input</th>
     * <th>Set Rows equal to</th>
     * <th>Set Columns equal to</th>
     * </tr>
     * <tr>
     * <td>
     * Free input
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with 1 line
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with n lines
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with 1 line
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with n lines
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input with 1 box
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a horizontal line with n boxes
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a grid of boxes x rows by y columns
     * 
     * </td>
     * <td>
     * x
     * 
     * </td>
     * <td>
     * z
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows
     */
    get_Rows() {
        result := ComCall(11, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the number of rows in the recognition guide. (Put)
     * @remarks
     * Row height is determined by the size of the drawn box. To get or set the drawn box, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox">DrawnBox</a> property.
     * 
     * Use the values of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns">Columns</a> and <b>Rows</b> properties to control the kind of recognition input that you use. When the <b>Columns</b> and <b>Rows</b> properties are both greater than zero, boxed input is used. The following table lists potential input modes and which values to set the <b>Columns</b> and <b>Rows</b> properties for each mode.
     * 
     * <table>
     * <tr>
     * <th>For this type of input</th>
     * <th>Set Rows equal to</th>
     * <th>Set Columns equal to</th>
     * </tr>
     * <tr>
     * <td>
     * Free input
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with 1 line
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with n lines
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with 1 line
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with n lines
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input with 1 box
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a horizontal line with n boxes
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a grid of boxes x rows by y columns
     * 
     * </td>
     * <td>
     * x
     * 
     * </td>
     * <td>
     * z
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_rows
     */
    put_Rows(Units) {
        result := ComCall(12, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the number of columns in the recognition guide box. (Get)
     * @remarks
     * Column width is determined by the size of the drawn box. To get or set the drawn box, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox">DrawnBox</a> property.
     * 
     * Use the values of <b>Columns</b> and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> to control the kind of recognition input that you use. When <b>Columns</b> and <b>Rows</b> are both greater than zero, boxed input is used. The following table lists potential input modes and which values to set the <b>Columns</b> and <b>Rows</b> properties for each mode.
     * 
     * <table>
     * <tr>
     * <th>For this type of input</th>
     * <th>Set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> property to</th>
     * <th>And set the <b>Columns</b> property to</th>
     * </tr>
     * <tr>
     * <td>
     * Free input
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with 1 line
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with n lines
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with 1 line
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with n lines
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input with 1 box
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a horizontal line with n boxes
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a grid of boxes x rows by z columns
     * 
     * </td>
     * <td>
     * x
     * 
     * </td>
     * <td>
     * z
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns
     */
    get_Columns() {
        result := ComCall(13, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the number of columns in the recognition guide box. (Put)
     * @remarks
     * Column width is determined by the size of the drawn box. To get or set the drawn box, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox">DrawnBox</a> property.
     * 
     * Use the values of <b>Columns</b> and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> to control the kind of recognition input that you use. When <b>Columns</b> and <b>Rows</b> are both greater than zero, boxed input is used. The following table lists potential input modes and which values to set the <b>Columns</b> and <b>Rows</b> properties for each mode.
     * 
     * <table>
     * <tr>
     * <th>For this type of input</th>
     * <th>Set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> property to</th>
     * <th>And set the <b>Columns</b> property to</th>
     * </tr>
     * <tr>
     * <td>
     * Free input
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with 1 line
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Vertical Lined input with n lines
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with 1 line
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Horizontal Lined input with n lines
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input with 1 box
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a horizontal line with n boxes
     * 
     * </td>
     * <td>
     * n
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Boxed input in a grid of boxes x rows by z columns
     * 
     * </td>
     * <td>
     * x
     * 
     * </td>
     * <td>
     * z
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_columns
     */
    put_Columns(Units) {
        result := ComCall(14, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the midline height. The midline height is distance from the baseline to the midline, of the drawn box. (Get)
     * @remarks
     * The value is 0 if the midline is not present.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_midline
     */
    get_Midline() {
        result := ComCall(15, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * Gets or sets the midline height. The midline height is distance from the baseline to the midline, of the drawn box. (Put)
     * @remarks
     * The value is 0 if the midline is not present.
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_midline
     */
    put_Midline(Units) {
        result := ComCall(16, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkRecoGuide structure that represents the boundaries of the ink to the recognizer. (Get)
     * @returns {InkRecoGuide} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_guidedata
     */
    get_GuideData() {
        pRecoGuide := InkRecoGuide()
        result := ComCall(17, this, InkRecoGuide.Ptr, pRecoGuide, "HRESULT")
        return pRecoGuide
    }

    /**
     * Gets or sets the InkRecoGuide structure that represents the boundaries of the ink to the recognizer. (Put)
     * @param {InkRecoGuide} recoGuide 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_guidedata
     */
    put_GuideData(recoGuide) {
        result := ComCall(18, this, InkRecoGuide, recoGuide, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkRecognizerGuide.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WritingBox := CallbackCreate(GetMethod(implObj, "get_WritingBox"), flags, 2)
        this.vtbl.put_WritingBox := CallbackCreate(GetMethod(implObj, "put_WritingBox"), flags, 2)
        this.vtbl.get_DrawnBox := CallbackCreate(GetMethod(implObj, "get_DrawnBox"), flags, 2)
        this.vtbl.put_DrawnBox := CallbackCreate(GetMethod(implObj, "put_DrawnBox"), flags, 2)
        this.vtbl.get_Rows := CallbackCreate(GetMethod(implObj, "get_Rows"), flags, 2)
        this.vtbl.put_Rows := CallbackCreate(GetMethod(implObj, "put_Rows"), flags, 2)
        this.vtbl.get_Columns := CallbackCreate(GetMethod(implObj, "get_Columns"), flags, 2)
        this.vtbl.put_Columns := CallbackCreate(GetMethod(implObj, "put_Columns"), flags, 2)
        this.vtbl.get_Midline := CallbackCreate(GetMethod(implObj, "get_Midline"), flags, 2)
        this.vtbl.put_Midline := CallbackCreate(GetMethod(implObj, "put_Midline"), flags, 2)
        this.vtbl.get_GuideData := CallbackCreate(GetMethod(implObj, "get_GuideData"), flags, 2)
        this.vtbl.put_GuideData := CallbackCreate(GetMethod(implObj, "put_GuideData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WritingBox)
        CallbackFree(this.vtbl.put_WritingBox)
        CallbackFree(this.vtbl.get_DrawnBox)
        CallbackFree(this.vtbl.put_DrawnBox)
        CallbackFree(this.vtbl.get_Rows)
        CallbackFree(this.vtbl.put_Rows)
        CallbackFree(this.vtbl.get_Columns)
        CallbackFree(this.vtbl.put_Columns)
        CallbackFree(this.vtbl.get_Midline)
        CallbackFree(this.vtbl.put_Midline)
        CallbackFree(this.vtbl.get_GuideData)
        CallbackFree(this.vtbl.put_GuideData)
    }
}
