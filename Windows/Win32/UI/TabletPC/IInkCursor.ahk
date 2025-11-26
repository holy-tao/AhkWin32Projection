#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkTablet.ahk
#Include .\IInkCursorButtons.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents general information about the tablet cursor.
 * @remarks
 * 
 * An <b>IInkCursor</b> object represents the physical pen that the user holds. Physical pens may have multiple tips - such as normal and eraser ends - with each pen tip representing a different <b>IInkCursor</b> object. Some Tablet PCs allow multiple pens. Each cursor has an associated identifier that is unique on a system. For more information about how pens can be used with Tablet PC, see <a href="https://docs.microsoft.com/windows/desktop/tablet/pen-input--ink--and-recognition">Pen Input, Ink, and Recognition</a>.
 * 
 * A specific set of drawing attributes can be assigned to a known cursor, such as whether the pen color should be red or blue. A cursor also contains a collection of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbutton">IInkCursorButton</a> objects.
 * 
 * Cursors exist only within the scope of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control. When one of these objects encounters a new cursor, the object fires its <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-cursorinrange">CursorInRange</a> event with the <i>newCursor</i> parameter set to <b>TRUE</b>. This allows you to set up properties in the application, such as drawing attributes, when the cursor is first encountered. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_cursors">Cursors</a> property contains the collection of cursors that the object or control has encountered.
 * 
 * An <b>IInkCursor</b> cannot be constructed explicitly. Instead, you obtain an <b>IInkCursor</b> from either events or the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_cursors">Cursors</a> property of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcursor
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCursor extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCursor
     * @type {Guid}
     */
    static IID => Guid("{ad30c630-40c5-4350-8405-9c71012fc558}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Id", "get_Inverted", "get_DrawingAttributes", "putref_DrawingAttributes", "get_Tablet", "get_Buttons"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Inverted {
        get => this.get_Inverted()
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {IInkTablet} 
     */
    Tablet {
        get => this.get_Tablet()
    }

    /**
     * @type {IInkCursorButtons} 
     */
    Buttons {
        get => this.get_Buttons()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-get_name
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-get_id
     */
    get_Id() {
        result := ComCall(8, this, "int*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-get_inverted
     */
    get_Inverted() {
        result := ComCall(9, this, "short*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes
     */
    get_DrawingAttributes() {
        result := ComCall(10, this, "ptr*", &Attributes := 0, "HRESULT")
        return IInkDrawingAttributes(Attributes)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} Attributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-putref_drawingattributes
     */
    putref_DrawingAttributes(Attributes) {
        result := ComCall(11, this, "ptr", Attributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkTablet} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-get_tablet
     */
    get_Tablet() {
        result := ComCall(12, this, "ptr*", &Tablet := 0, "HRESULT")
        return IInkTablet(Tablet)
    }

    /**
     * 
     * @returns {IInkCursorButtons} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursor-get_buttons
     */
    get_Buttons() {
        result := ComCall(13, this, "ptr*", &Buttons := 0, "HRESULT")
        return IInkCursorButtons(Buttons)
    }
}
