#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkRecognizer.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Ole\OLE_HANDLE.ahk
#Include ..\..\System\Ole\IFontDisp.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//inked/nn-inked-iinkedit
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkEdit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkEdit
     * @type {Guid}
     */
    static IID => Guid("{f2127a19-fbfb-4aed-8464-3f36d78cfefb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_UseMouseForInput", "put_UseMouseForInput", "get_InkMode", "put_InkMode", "get_InkInsertMode", "put_InkInsertMode", "get_DrawingAttributes", "putref_DrawingAttributes", "get_RecognitionTimeout", "put_RecognitionTimeout", "get_Recognizer", "putref_Recognizer", "get_Factoid", "put_Factoid", "get_SelInks", "put_SelInks", "get_SelInksDisplayMode", "put_SelInksDisplayMode", "Recognize", "GetGestureStatus", "SetGestureStatus", "put_BackColor", "get_BackColor", "get_Appearance", "put_Appearance", "get_BorderStyle", "put_BorderStyle", "get_Hwnd", "get_Font", "putref_Font", "get_Text", "put_Text", "get_MouseIcon", "put_MouseIcon", "putref_MouseIcon", "get_MousePointer", "put_MousePointer", "get_Locked", "put_Locked", "get_Enabled", "put_Enabled", "get_MaxLength", "put_MaxLength", "get_MultiLine", "put_MultiLine", "get_ScrollBars", "put_ScrollBars", "get_DisableNoScroll", "put_DisableNoScroll", "get_SelAlignment", "put_SelAlignment", "get_SelBold", "put_SelBold", "get_SelItalic", "put_SelItalic", "get_SelUnderline", "put_SelUnderline", "get_SelColor", "put_SelColor", "get_SelFontName", "put_SelFontName", "get_SelFontSize", "put_SelFontSize", "get_SelCharOffset", "put_SelCharOffset", "get_TextRTF", "put_TextRTF", "get_SelStart", "put_SelStart", "get_SelLength", "put_SelLength", "get_SelText", "put_SelText", "get_SelRTF", "put_SelRTF", "Refresh"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseMouseForInput {
        get => this.get_UseMouseForInput()
        set => this.put_UseMouseForInput(value)
    }

    /**
     * @type {Integer} 
     */
    InkMode {
        get => this.get_InkMode()
        set => this.put_InkMode(value)
    }

    /**
     * @type {Integer} 
     */
    InkInsertMode {
        get => this.get_InkInsertMode()
        set => this.put_InkInsertMode(value)
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {Integer} 
     */
    RecognitionTimeout {
        get => this.get_RecognitionTimeout()
        set => this.put_RecognitionTimeout(value)
    }

    /**
     * @type {IInkRecognizer} 
     */
    Recognizer {
        get => this.get_Recognizer()
    }

    /**
     * @type {BSTR} 
     */
    Factoid {
        get => this.get_Factoid()
        set => this.put_Factoid(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelInks {
        get => this.get_SelInks()
        set => this.put_SelInks(value)
    }

    /**
     * @type {Integer} 
     */
    SelInksDisplayMode {
        get => this.get_SelInksDisplayMode()
        set => this.put_SelInksDisplayMode(value)
    }

    /**
     * @type {Integer} 
     */
    BackColor {
        get => this.get_BackColor()
        set => this.put_BackColor(value)
    }

    /**
     * @type {Integer} 
     */
    Appearance {
        get => this.get_Appearance()
        set => this.put_Appearance(value)
    }

    /**
     * @type {Integer} 
     */
    BorderStyle {
        get => this.get_BorderStyle()
        set => this.put_BorderStyle(value)
    }

    /**
     * @type {OLE_HANDLE} 
     */
    Hwnd {
        get => this.get_Hwnd()
    }

    /**
     * @type {IFontDisp} 
     */
    Font {
        get => this.get_Font()
    }

    /**
     * @type {BSTR} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * @type {IPictureDisp} 
     */
    MouseIcon {
        get => this.get_MouseIcon()
        set => this.put_MouseIcon(value)
    }

    /**
     * @type {Integer} 
     */
    MousePointer {
        get => this.get_MousePointer()
        set => this.put_MousePointer(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Locked {
        get => this.get_Locked()
        set => this.put_Locked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MultiLine {
        get => this.get_MultiLine()
        set => this.put_MultiLine(value)
    }

    /**
     * @type {Integer} 
     */
    ScrollBars {
        get => this.get_ScrollBars()
        set => this.put_ScrollBars(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisableNoScroll {
        get => this.get_DisableNoScroll()
        set => this.put_DisableNoScroll(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelAlignment {
        get => this.get_SelAlignment()
        set => this.put_SelAlignment(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelBold {
        get => this.get_SelBold()
        set => this.put_SelBold(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelItalic {
        get => this.get_SelItalic()
        set => this.put_SelItalic(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelUnderline {
        get => this.get_SelUnderline()
        set => this.put_SelUnderline(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelColor {
        get => this.get_SelColor()
        set => this.put_SelColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelFontName {
        get => this.get_SelFontName()
        set => this.put_SelFontName(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelFontSize {
        get => this.get_SelFontSize()
        set => this.put_SelFontSize(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelCharOffset {
        get => this.get_SelCharOffset()
        set => this.put_SelCharOffset(value)
    }

    /**
     * @type {BSTR} 
     */
    TextRTF {
        get => this.get_TextRTF()
        set => this.put_TextRTF(value)
    }

    /**
     * @type {Integer} 
     */
    SelStart {
        get => this.get_SelStart()
        set => this.put_SelStart(value)
    }

    /**
     * @type {Integer} 
     */
    SelLength {
        get => this.get_SelLength()
        set => this.put_SelLength(value)
    }

    /**
     * @type {BSTR} 
     */
    SelText {
        get => this.get_SelText()
        set => this.put_SelText(value)
    }

    /**
     * @type {BSTR} 
     */
    SelRTF {
        get => this.get_SelRTF()
        set => this.put_SelRTF(value)
    }

    /**
     * Gets a value that specifies whether the InkEdit control is idle, collecting ink, or recognizing ink.
     * @remarks
     * 
     * This property is available at run time only.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_status
     */
    get_Status() {
        result := ComCall(7, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Gets or sets a value that indicates whether the mouse can be used as an input device.
     * @remarks
     * 
     * This property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_usemouseforinput
     */
    get_UseMouseForInput() {
        result := ComCall(8, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that indicates whether the mouse can be used as an input device.
     * @remarks
     * 
     * This property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_usemouseforinput
     */
    put_UseMouseForInput(newVal) {
        result := ComCall(9, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether ink collection is disabled, ink is collected, or ink and gestures are collected.
     * @remarks
     * 
     * The value of this property is always Disabled if it is used on a system that has Microsoft Windows XP Tablet PC Edition installed but no recognizers are present. If used on a system with Windows Vista or Windows XP Tablet PC Edition installed, the value can be set to any of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/inked/ne-inked-inkmode">InkMode</a> enumeration type.
     * 
     * This property should be changed only if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_inkmode
     */
    get_InkMode() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that specifies whether ink collection is disabled, ink is collected, or ink and gestures are collected.
     * @remarks
     * 
     * The value of this property is always Disabled if it is used on a system that has Microsoft Windows XP Tablet PC Edition installed but no recognizers are present. If used on a system with Windows Vista or Windows XP Tablet PC Edition installed, the value can be set to any of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/inked/ne-inked-inkmode">InkMode</a> enumeration type.
     * 
     * This property should be changed only if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_inkmode
     */
    put_InkMode(newVal) {
        result := ComCall(11, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies how ink is inserted onto the InkEdit control, either as text or as ink.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_inkinsertmode
     */
    get_InkInsertMode() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that specifies how ink is inserted onto the InkEdit control, either as text or as ink.
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_inkinsertmode
     */
    put_InkInsertMode(newVal) {
        result := ComCall(13, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the drawing attributes for ink that is yet to be drawn on the InkEdit control.
     * @remarks
     * 
     * The <b>DrawingAttributes</b> property specifies the appearance of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. For example, you can specify the width and color of ink drawn on the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control.
     * 
     * Successive calls to the <b>DrawingAttributes</b> property change only the <b>DrawingAttributes</b> properties of new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> objects. The calls do not apply to <b>IInkStrokeDisp</b> objects that the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control already collected or is in the process of collecting.
     * 
     * This property is different from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, which specifies the attributes of already collected ink. The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control's <b>DrawingAttributes</b> property is more analogous to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes">DefaultDrawingAttributes</a> property, except that for the <b>DefaultDrawingAttributes</b> property the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve">FitToCurve</a> property is set to <b>TRUE</b> by default.
     * 
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_drawingattributes
     */
    get_DrawingAttributes() {
        result := ComCall(14, this, "ptr*", &pVal := 0, "HRESULT")
        return IInkDrawingAttributes(pVal)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_drawingattributes
     */
    putref_DrawingAttributes(newVal) {
        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the length of time, in milliseconds, between the last IInkStrokeDisp object collected and the beginning of text recognition.
     * @remarks
     * 
     * Setting this property equal to zero prevents the ink from being replaced by the recognized text.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_recognitiontimeout
     */
    get_RecognitionTimeout() {
        result := ComCall(16, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the length of time, in milliseconds, between the last IInkStrokeDisp object collected and the beginning of text recognition.
     * @remarks
     * 
     * Setting this property equal to zero prevents the ink from being replaced by the recognized text.
     * 
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_recognitiontimeout
     */
    put_RecognitionTimeout(newVal) {
        result := ComCall(17, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the IInkRecognizer object to use for recognition.
     * @remarks
     * 
     * This property is run time only.
     * 
     * This property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * If a factoid is used for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control, it must be reapplied after setting this property.
     * 
     * 
     * @returns {IInkRecognizer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_recognizer
     */
    get_Recognizer() {
        result := ComCall(18, this, "ptr*", &pVal := 0, "HRESULT")
        return IInkRecognizer(pVal)
    }

    /**
     * 
     * @param {IInkRecognizer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_recognizer
     */
    putref_Recognizer(newVal) {
        result := ComCall(19, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the Factoid constant that a IInkRecognizer object uses to constrain its search for the recognition result.
     * @remarks
     * 
     * This property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * To ensure that ink is recognized in the correct field context, set this property before processing the ink for the first time.
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> provides context for recognized ink in the context of a particular field. You specify a factoid if an input field is of a known type, for example, if the input field contains a date.
     * 
     * This property takes or returns a string parameter and not a class object of the <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> class. The members of this class are of type STRING. This method does not throw an error if you attempt to set this property to an invalid string value.
     * 
     * <div class="alert"><b>Note</b>  All factoids are case sensitive.</div>
     * <div> </div>
     * For more information about factoids and how to use them, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-context-to-improve-accuracy">Using Context to Improve Accuracy</a>. For a list of supported factoids, see <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid Constants</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_factoid
     */
    get_Factoid() {
        pVal := BSTR()
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the Factoid constant that a IInkRecognizer object uses to constrain its search for the recognition result.
     * @remarks
     * 
     * This property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns IES_Idle.
     * 
     * To ensure that ink is recognized in the correct field context, set this property before processing the ink for the first time.
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> provides context for recognized ink in the context of a particular field. You specify a factoid if an input field is of a known type, for example, if the input field contains a date.
     * 
     * This property takes or returns a string parameter and not a class object of the <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> class. The members of this class are of type STRING. This method does not throw an error if you attempt to set this property to an invalid string value.
     * 
     * <div class="alert"><b>Note</b>  All factoids are case sensitive.</div>
     * <div> </div>
     * For more information about factoids and how to use them, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-context-to-improve-accuracy">Using Context to Improve Accuracy</a>. For a list of supported factoids, see <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid Constants</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>.
     * 
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_factoid
     */
    put_Factoid(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(21, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the array of embedded InkDisp objects (if displayed as ink) in the current selection.
     * @remarks
     * 
     * Ink must be recognized before being accessed through this property. If it is not recognized first, the <b>SelInks</b> property always contains zero <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> objects. You must either call the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-recognize">Recognize</a> method (if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_recognitiontimeout">RecognitionTimeout</a> property equals 0) or wait until the ink is automatically recognized (when the value of the <b>RecognitionTimeout</b> property is greater than 0) to access ink through this property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control ignores any <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a> on ink set through the <b>SelInks</b> property. Instead, the InkEdit control applies alternate drawing attributes according to the attributes of nearby text.
     * 
     * This property is run time only.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selinks
     */
    get_SelInks() {
        pSelInk := VARIANT()
        result := ComCall(22, this, "ptr", pSelInk, "HRESULT")
        return pSelInk
    }

    /**
     * Gets or sets the array of embedded InkDisp objects (if displayed as ink) in the current selection.
     * @remarks
     * 
     * Ink must be recognized before being accessed through this property. If it is not recognized first, the <b>SelInks</b> property always contains zero <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> objects. You must either call the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-recognize">Recognize</a> method (if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_recognitiontimeout">RecognitionTimeout</a> property equals 0) or wait until the ink is automatically recognized (when the value of the <b>RecognitionTimeout</b> property is greater than 0) to access ink through this property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control ignores any <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a> on ink set through the <b>SelInks</b> property. Instead, the InkEdit control applies alternate drawing attributes according to the attributes of nearby text.
     * 
     * This property is run time only.
     * 
     * 
     * @param {VARIANT} SelInk 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selinks
     */
    put_SelInks(SelInk) {
        result := ComCall(23, this, "ptr", SelInk, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that allows for toggling the appearance of the selection between ink and text.
     * @remarks
     * 
     * This property is run time only.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selinksdisplaymode
     */
    get_SelInksDisplayMode() {
        result := ComCall(24, this, "int*", &pInkDisplayMode := 0, "HRESULT")
        return pInkDisplayMode
    }

    /**
     * Gets or sets a value that allows for toggling the appearance of the selection between ink and text.
     * @remarks
     * 
     * This property is run time only.
     * 
     * 
     * @param {Integer} InkDisplayMode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selinksdisplaymode
     */
    put_SelInksDisplayMode(InkDisplayMode) {
        result := ComCall(25, this, "int", InkDisplayMode, "HRESULT")
        return result
    }

    /**
     * Performs recognition on an InkStrokes collection and returns recognition results.
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
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-recognize
     */
    Recognize() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether the InkEdit control is interested in a particular application gesture.
     * @param {Integer} Gesture The gesture that you want the status of.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control has interest in the gesture and the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-gesture">Gesture</a> event of the InkEdit control fires when the gesture is recognized. <b>VARIANT_FALSE</b> if the InkEdit control has no interest in the gesture.
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-getgesturestatus
     */
    GetGestureStatus(Gesture) {
        result := ComCall(27, this, "int", Gesture, "short*", &pListen := 0, "HRESULT")
        return pListen
    }

    /**
     * Modifies the interest of the InkEdit control in a known application gesture.
     * @param {Integer} Gesture The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkgesture">IInkGesture</a> object that you want the status of.
     * @param {VARIANT_BOOL} Listen <b>VARIANT_TRUE</b> to indicate that the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control uses the application gesture; otherwise, <b>VARIANT_FALSE</b>.
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
     * The input parameter was incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_INVALID_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * InkEdit status must be IES_Idle.
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
     * An exception occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unsupported gesture.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate memory operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-setgesturestatus
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(28, this, "int", Gesture, "short", Listen, "HRESULT")
        return result
    }

    /**
     * Gets or sets the background color for the InkEdit control.
     * @param {Integer} clr 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_backcolor
     */
    put_BackColor(clr) {
        result := ComCall(29, this, "uint", clr, "HRESULT")
        return result
    }

    /**
     * Gets or sets the background color for the InkEdit control.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_backcolor
     */
    get_BackColor() {
        result := ComCall(30, this, "uint*", &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * Gets or sets a value that determines the appearance of the InkEdit control - whether it is flat (painted with no visual effects) or 3D (painted with three-dimensional effects).
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_appearance
     */
    get_Appearance() {
        result := ComCall(31, this, "int*", &pAppearance := 0, "HRESULT")
        return pAppearance
    }

    /**
     * Gets or sets a value that determines the appearance of the InkEdit control - whether it is flat (painted with no visual effects) or 3D (painted with three-dimensional effects).
     * @param {Integer} pAppearance 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_appearance
     */
    put_Appearance(pAppearance) {
        result := ComCall(32, this, "int", pAppearance, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that determines whether the InkEdit control has a border.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_borderstyle
     */
    get_BorderStyle() {
        result := ComCall(33, this, "int*", &pBorderStyle := 0, "HRESULT")
        return pBorderStyle
    }

    /**
     * Gets or sets a value that determines whether the InkEdit control has a border.
     * @param {Integer} pBorderStyle 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_borderstyle
     */
    put_BorderStyle(pBorderStyle) {
        result := ComCall(34, this, "int", pBorderStyle, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the InkEdit control.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  Because the value of this property can change while a program is running, never store the Hwnd value in a variable.
     * </div>
     * <div> </div>
     * 
     * 
     * @returns {OLE_HANDLE} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_hwnd
     */
    get_Hwnd() {
        pohHwnd := OLE_HANDLE()
        result := ComCall(35, this, "ptr", pohHwnd, "HRESULT")
        return pohHwnd
    }

    /**
     * Gets or sets a Font object.
     * @remarks
     * 
     * Use the <b>Font</b> property of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control to identify a specific Font object whose properties you want to use. For example, the following code changes the <b>Bold</b> property setting of a Font object identified by the <b>Font</b> property of an InkEdit control:
     * 
     * <c>myInkEditControl.Font.Bold = true;</c>
     * 
     * 
     * @returns {IFontDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_font
     */
    get_Font() {
        result := ComCall(36, this, "ptr*", &ppFont := 0, "HRESULT")
        return IFontDisp(ppFont)
    }

    /**
     * 
     * @param {IFontDisp} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_font
     */
    putref_Font(ppFont) {
        result := ComCall(37, this, "ptr", ppFont, "HRESULT")
        return result
    }

    /**
     * Gets or sets the current text in the InkEdit control.
     * @remarks
     * 
     * Setting the Text property replaces the entire contents of a control with the new string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_text
     */
    get_Text() {
        pbstrText := BSTR()
        result := ComCall(38, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * Gets or sets the current text in the InkEdit control.
     * @remarks
     * 
     * Setting the Text property replaces the entire contents of a control with the new string.
     * 
     * 
     * @param {BSTR} pbstrText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_text
     */
    put_Text(pbstrText) {
        pbstrText := pbstrText is String ? BSTR.Alloc(pbstrText).Value : pbstrText

        result := ComCall(39, this, "ptr", pbstrText, "HRESULT")
        return result
    }

    /**
     * Gets or sets the custom mouse icon for the InkEdit control.
     * @remarks
     * 
     * This property provides a custom icon that is used when the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_mousepointer">MousePointer</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Custom</a>.
     * 
     * You can use the <b>MouseIcon</b> property to load either cursor or icon files. The <b>MouseIcon</b> property provides your application with access to custom cursors of any size with any desired hot spot location.
     * 
     * 
     * @returns {IPictureDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_mouseicon
     */
    get_MouseIcon() {
        result := ComCall(40, this, "ptr*", &MouseIcon := 0, "HRESULT")
        return IPictureDisp(MouseIcon)
    }

    /**
     * Gets or sets the custom mouse icon for the InkEdit control.
     * @remarks
     * 
     * This property provides a custom icon that is used when the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_mousepointer">MousePointer</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Custom</a>.
     * 
     * You can use the <b>MouseIcon</b> property to load either cursor or icon files. The <b>MouseIcon</b> property provides your application with access to custom cursors of any size with any desired hot spot location.
     * 
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_mouseicon
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(41, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_mouseicon
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(42, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value indicating the type of mouse pointer to be displayed.
     * @remarks
     * 
     * If you set the <b>MousePointer</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Default</a>, the mouse cursor setting is based on the current cursor's drawing attributes. If the ink collector is disabled, the mouse cursor setting is based on the underlying windows mouse cursor <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_drawingattributes">DrawingAttributes</a> property. If the <b>MousePointer</b> property is set to <b>IMP_Custom</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_mouseicon">MouseIcon</a> property is <b>NULL</b>, then the ink collector no longer handles mouse cursor settings. Setting the mouse cursor to any other setting (other than the <b>MousePointer</b> property set to <b>IMP_Default</b> and the <b>MouseIcon</b> property set to <b>NULL</b>) forces the mouse cursor to use the current setting.
     * 
     * You can use this property when you want to indicate changes in functionality as the mouse pointer passes over controls on a form or dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Hourglass</a> setting is useful for indicating that the user should wait for a process or operation to finish.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_mousepointer
     */
    get_MousePointer() {
        result := ComCall(43, this, "int*", &MousePointer := 0, "HRESULT")
        return MousePointer
    }

    /**
     * Gets or sets a value indicating the type of mouse pointer to be displayed.
     * @remarks
     * 
     * If you set the <b>MousePointer</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Default</a>, the mouse cursor setting is based on the current cursor's drawing attributes. If the ink collector is disabled, the mouse cursor setting is based on the underlying windows mouse cursor <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_drawingattributes">DrawingAttributes</a> property. If the <b>MousePointer</b> property is set to <b>IMP_Custom</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_mouseicon">MouseIcon</a> property is <b>NULL</b>, then the ink collector no longer handles mouse cursor settings. Setting the mouse cursor to any other setting (other than the <b>MousePointer</b> property set to <b>IMP_Default</b> and the <b>MouseIcon</b> property set to <b>NULL</b>) forces the mouse cursor to use the current setting.
     * 
     * You can use this property when you want to indicate changes in functionality as the mouse pointer passes over controls on a form or dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Hourglass</a> setting is useful for indicating that the user should wait for a process or operation to finish.
     * 
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(44, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value indicating whether the contents of the InkEdit control can be edited.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_locked
     */
    get_Locked() {
        result := ComCall(45, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value indicating whether the contents of the InkEdit control can be edited.
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_locked
     */
    put_Locked(newVal) {
        result := ComCall(46, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that determines whether the InkEdit control can respond to user-generated events.
     * @remarks
     * 
     * The <b>Enabled</b> property allows objects to be enabled or disabled at run time.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_enabled
     */
    get_Enabled() {
        result := ComCall(47, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that determines whether the InkEdit control can respond to user-generated events.
     * @remarks
     * 
     * The <b>Enabled</b> property allows objects to be enabled or disabled at run time.
     * 
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_enabled
     */
    put_Enabled(newVal) {
        result := ComCall(48, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value indicating whether there is a maximum number of characters an InkEdit control can hold and, if so, specifies the maximum number of characters.
     * @remarks
     * 
     * The default for the <b>MaxLength</b> property is 0, indicating no maximum other than that created by memory constraints on the user's system. Any number greater than 0 indicates the maximum number of characters.
     * 
     * Use the <b>MaxLength</b> property to limit the number of characters a user can enter in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control.
     * 
     * 
     * 
     * If text that exceeds the <b>MaxLength</b> property setting is assigned to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control from code, no error occurs; however, only the maximum number of characters is assigned to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-text">Text</a> property, and extra characters are truncated. Changing this property doesn't affect the current contents of an InkEdit control, but will affect any subsequent changes to the contents.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_maxlength
     */
    get_MaxLength() {
        result := ComCall(49, this, "int*", &plMaxLength := 0, "HRESULT")
        return plMaxLength
    }

    /**
     * Gets or sets a value indicating whether there is a maximum number of characters an InkEdit control can hold and, if so, specifies the maximum number of characters.
     * @remarks
     * 
     * The default for the <b>MaxLength</b> property is 0, indicating no maximum other than that created by memory constraints on the user's system. Any number greater than 0 indicates the maximum number of characters.
     * 
     * Use the <b>MaxLength</b> property to limit the number of characters a user can enter in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control.
     * 
     * 
     * 
     * If text that exceeds the <b>MaxLength</b> property setting is assigned to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control from code, no error occurs; however, only the maximum number of characters is assigned to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-text">Text</a> property, and extra characters are truncated. Changing this property doesn't affect the current contents of an InkEdit control, but will affect any subsequent changes to the contents.
     * 
     * 
     * @param {Integer} lMaxLength 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_maxlength
     */
    put_MaxLength(lMaxLength) {
        result := ComCall(50, this, "int", lMaxLength, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value indicating whether an InkEdit control can accept and display multiple lines of text.
     * @remarks
     * 
     * A multiple-line <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control wraps text as the user types text extending beyond the text box.
     * 
     * 
     * 
     * You can also add scroll bars to a larger <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control using the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_scrollbars">ScrollBars</a> property. If no HScrollBar control (horizontal scroll bar) is specified, the text in a multiple-line InkEdit control automatically wraps.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_multiline
     */
    get_MultiLine() {
        result := ComCall(51, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value indicating whether an InkEdit control can accept and display multiple lines of text.
     * @remarks
     * 
     * A multiple-line <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control wraps text as the user types text extending beyond the text box.
     * 
     * 
     * 
     * You can also add scroll bars to a larger <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control using the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_scrollbars">ScrollBars</a> property. If no HScrollBar control (horizontal scroll bar) is specified, the text in a multiple-line InkEdit control automatically wraps.
     * 
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_multiline
     */
    put_MultiLine(newVal) {
        result := ComCall(52, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the type of scroll bars, if any, to display in the InkEdit control.
     * @remarks
     * 
     * For an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control with setting rtfHorizontal, rtfVertical, or rtfBoth, you must set the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_multiline">MultiLine</a> property to <b>TRUE</b>.
     * 
     * 
     * 
     * At run time, the Windows operating environment automatically implements a standard keyboard interface to allow navigation in <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> controls with the arrow keys (UP ARROW, DOWN ARROW, LEFT ARROW, and RIGHT ARROW), the HOME and END keys, and so on.
     * 
     * 
     * 
     * Scroll bars are displayed only if the contents of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control extend beyond the control's borders. If <b>ScrollBars</b> is set to <b>FALSE</b>, the control won't have scroll bars, regardless of its contents.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_scrollbars
     */
    get_ScrollBars() {
        result := ComCall(53, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the type of scroll bars, if any, to display in the InkEdit control.
     * @remarks
     * 
     * For an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control with setting rtfHorizontal, rtfVertical, or rtfBoth, you must set the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_multiline">MultiLine</a> property to <b>TRUE</b>.
     * 
     * 
     * 
     * At run time, the Windows operating environment automatically implements a standard keyboard interface to allow navigation in <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> controls with the arrow keys (UP ARROW, DOWN ARROW, LEFT ARROW, and RIGHT ARROW), the HOME and END keys, and so on.
     * 
     * 
     * 
     * Scroll bars are displayed only if the contents of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control extend beyond the control's borders. If <b>ScrollBars</b> is set to <b>FALSE</b>, the control won't have scroll bars, regardless of its contents.
     * 
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_scrollbars
     */
    put_ScrollBars(newVal) {
        result := ComCall(54, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that determines whether scroll bars in the InkEdit control are disabled.
     * @remarks
     * 
     * The <b>DisableNoScroll</b> property is ignored when the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_scrollbars">ScrollBars</a> property is set to <b>rtfNone</b>. However, when <b>ScrollBars</b> is set to <b>rtfHorizontal</b>, <b>rtfVertical</b>, or <b>rtfBoth</b>, individual scroll bars are disabled when there are too few lines of text to scroll vertically or too few characters of text to scroll horizontally in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control.
     * 
     * 
     * 
     * This property is read-only at run time.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_disablenoscroll
     */
    get_DisableNoScroll() {
        result := ComCall(55, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that determines whether scroll bars in the InkEdit control are disabled.
     * @remarks
     * 
     * The <b>DisableNoScroll</b> property is ignored when the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_scrollbars">ScrollBars</a> property is set to <b>rtfNone</b>. However, when <b>ScrollBars</b> is set to <b>rtfHorizontal</b>, <b>rtfVertical</b>, or <b>rtfBoth</b>, individual scroll bars are disabled when there are too few lines of text to scroll vertically or too few characters of text to scroll horizontally in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control.
     * 
     * 
     * 
     * This property is read-only at run time.
     * 
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_disablenoscroll
     */
    put_DisableNoScroll(newVal) {
        result := ComCall(56, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that controls the alignment of the paragraphs in an InkEdit control.
     * @remarks
     * 
     * The <b>SelAlignment</b> property determines paragraph alignment for all paragraphs that have text in the current selection or for the paragraph containing the insertion point if no text is selected.
     * 
     * If a selection spans multiple paragraphs with different alignment styles, the <b>SelAlignment</b> property will be null.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selalignment
     */
    get_SelAlignment() {
        pvarSelAlignment := VARIANT()
        result := ComCall(57, this, "ptr", pvarSelAlignment, "HRESULT")
        return pvarSelAlignment
    }

    /**
     * Gets or sets a value that controls the alignment of the paragraphs in an InkEdit control.
     * @remarks
     * 
     * The <b>SelAlignment</b> property determines paragraph alignment for all paragraphs that have text in the current selection or for the paragraph containing the insertion point if no text is selected.
     * 
     * If a selection spans multiple paragraphs with different alignment styles, the <b>SelAlignment</b> property will be null.
     * 
     * 
     * @param {VARIANT} pvarSelAlignment 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selalignment
     */
    put_SelAlignment(pvarSelAlignment) {
        result := ComCall(58, this, "ptr", pvarSelAlignment, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the font style of the currently selected text in the InkEdit control is bold.
     * @remarks
     * 
     * If a selection spans multiple characters with different bold styles, the <b>SelBold</b> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property determines whether all new text entered at the current insertion point is bold.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selbold
     */
    get_SelBold() {
        pvarSelBold := VARIANT()
        result := ComCall(59, this, "ptr", pvarSelBold, "HRESULT")
        return pvarSelBold
    }

    /**
     * Gets or sets a value that specifies whether the font style of the currently selected text in the InkEdit control is bold.
     * @remarks
     * 
     * If a selection spans multiple characters with different bold styles, the <b>SelBold</b> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property determines whether all new text entered at the current insertion point is bold.
     * 
     * 
     * @param {VARIANT} pvarSelBold 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selbold
     */
    put_SelBold(pvarSelBold) {
        result := ComCall(60, this, "ptr", pvarSelBold, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the font style of the currently selected text in the InkEdit control is italic (run time only).
     * @remarks
     * 
     * If a selection spans multiple italicized and un-italicized characters, the <b>SelItalic</b> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property indicates all new text entered at the current insertion point will be italicized.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selitalic
     */
    get_SelItalic() {
        pvarSelItalic := VARIANT()
        result := ComCall(61, this, "ptr", pvarSelItalic, "HRESULT")
        return pvarSelItalic
    }

    /**
     * Gets or sets a value that specifies whether the font style of the currently selected text in the InkEdit control is italic (run time only).
     * @remarks
     * 
     * If a selection spans multiple italicized and un-italicized characters, the <b>SelItalic</b> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property indicates all new text entered at the current insertion point will be italicized.
     * 
     * 
     * @param {VARIANT} pvarSelItalic 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selitalic
     */
    put_SelItalic(pvarSelItalic) {
        result := ComCall(62, this, "ptr", pvarSelItalic, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the font style of the currently selected text in the InkEdit control is underlined (run time only).
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selunderline
     */
    get_SelUnderline() {
        pvarSelUnderline := VARIANT()
        result := ComCall(63, this, "ptr", pvarSelUnderline, "HRESULT")
        return pvarSelUnderline
    }

    /**
     * Gets or sets a value that specifies whether the font style of the currently selected text in the InkEdit control is underlined (run time only).
     * @param {VARIANT} pvarSelUnderline 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selunderline
     */
    put_SelUnderline(pvarSelUnderline) {
        result := ComCall(64, this, "ptr", pvarSelUnderline, "HRESULT")
        return result
    }

    /**
     * Gets or sets the text color of the current text selection or insertion point (run time only).
     * @remarks
     * 
     * If a selection spans multiple characters with different colors, the <b>SelColor</b> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property determines the color of all new text entered at the current insertion point.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selcolor
     */
    get_SelColor() {
        pvarSelColor := VARIANT()
        result := ComCall(65, this, "ptr", pvarSelColor, "HRESULT")
        return pvarSelColor
    }

    /**
     * Gets or sets the text color of the current text selection or insertion point (run time only).
     * @remarks
     * 
     * If a selection spans multiple characters with different colors, the <b>SelColor</b> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property determines the color of all new text entered at the current insertion point.
     * 
     * 
     * @param {VARIANT} pvarSelColor 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selcolor
     */
    put_SelColor(pvarSelColor) {
        result := ComCall(66, this, "ptr", pvarSelColor, "HRESULT")
        return result
    }

    /**
     * Gets or sets the font name of the selected text within the InkEdit control (run time only).
     * @remarks
     * 
     * If a selection spans multiple characters with different fonts, the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_selcolor">SelColor</a> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property determines the font of all new text entered at the current insertion point.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selfontname
     */
    get_SelFontName() {
        pvarSelFontName := VARIANT()
        result := ComCall(67, this, "ptr", pvarSelFontName, "HRESULT")
        return pvarSelFontName
    }

    /**
     * Gets or sets the font name of the selected text within the InkEdit control (run time only).
     * @remarks
     * 
     * If a selection spans multiple characters with different fonts, the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_selcolor">SelColor</a> property will be <b>NULL</b>.
     * 
     * If there is no text selected in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control, setting this property determines the font of all new text entered at the current insertion point.
     * 
     * 
     * @param {VARIANT} pvarSelFontName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selfontname
     */
    put_SelFontName(pvarSelFontName) {
        result := ComCall(68, this, "ptr", pvarSelFontName, "HRESULT")
        return result
    }

    /**
     * Gets or sets the font size of the selected text within the InkEdit control (run time only).
     * @remarks
     * 
     * The <b>SelFontSize</b> property returns Null if the selected text contains different font sizes.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selfontsize
     */
    get_SelFontSize() {
        pvarSelFontSize := VARIANT()
        result := ComCall(69, this, "ptr", pvarSelFontSize, "HRESULT")
        return pvarSelFontSize
    }

    /**
     * Gets or sets the font size of the selected text within the InkEdit control (run time only).
     * @remarks
     * 
     * The <b>SelFontSize</b> property returns Null if the selected text contains different font sizes.
     * 
     * 
     * @param {VARIANT} pvarSelFontSize 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selfontsize
     */
    put_SelFontSize(pvarSelFontSize) {
        result := ComCall(70, this, "ptr", pvarSelFontSize, "HRESULT")
        return result
    }

    /**
     * Returns or sets a value that determines whether text in the InkEdit control appears on the baseline (normal), as a superscript above the baseline, or as a subscript below the baseline.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selcharoffset
     */
    get_SelCharOffset() {
        pvarSelCharOffset := VARIANT()
        result := ComCall(71, this, "ptr", pvarSelCharOffset, "HRESULT")
        return pvarSelCharOffset
    }

    /**
     * Returns or sets a value that determines whether text in the InkEdit control appears on the baseline (normal), as a superscript above the baseline, or as a subscript below the baseline.
     * @param {VARIANT} pvarSelCharOffset 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selcharoffset
     */
    put_SelCharOffset(pvarSelCharOffset) {
        result := ComCall(72, this, "ptr", pvarSelCharOffset, "HRESULT")
        return result
    }

    /**
     * Gets or sets the text of the InkEdit control, including all RTF codes.
     * @remarks
     * 
     * Setting the TextRTF property replaces the entire contents of a control with the new string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_textrtf
     */
    get_TextRTF() {
        pbstrTextRTF := BSTR()
        result := ComCall(73, this, "ptr", pbstrTextRTF, "HRESULT")
        return pbstrTextRTF
    }

    /**
     * Gets or sets the text of the InkEdit control, including all RTF codes.
     * @remarks
     * 
     * Setting the TextRTF property replaces the entire contents of a control with the new string.
     * 
     * 
     * @param {BSTR} pbstrTextRTF 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_textrtf
     */
    put_TextRTF(pbstrTextRTF) {
        pbstrTextRTF := pbstrTextRTF is String ? BSTR.Alloc(pbstrTextRTF).Value : pbstrTextRTF

        result := ComCall(74, this, "ptr", pbstrTextRTF, "HRESULT")
        return result
    }

    /**
     * Gets or sets the starting point of the text that is selected in the InkEdit control (run time only).
     * @remarks
     * 
     * Setting <b>SelStart</b> greater than the text length sets the property to the existing text length; changing <b>SelStart</b> changes the selection to an insertion point and sets <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_sellength">SelLength</a> to 0.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selstart
     */
    get_SelStart() {
        result := ComCall(75, this, "int*", &plSelStart := 0, "HRESULT")
        return plSelStart
    }

    /**
     * Gets or sets the starting point of the text that is selected in the InkEdit control (run time only).
     * @remarks
     * 
     * Setting <b>SelStart</b> greater than the text length sets the property to the existing text length; changing <b>SelStart</b> changes the selection to an insertion point and sets <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_sellength">SelLength</a> to 0.
     * 
     * 
     * @param {Integer} plSelStart 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selstart
     */
    put_SelStart(plSelStart) {
        result := ComCall(76, this, "int", plSelStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets the number of characters that are selected in the InkEdit control (run time only).
     * @remarks
     * 
     * You can use this property to determine if any characters are currently selected in the text box control before performing operations on the selected text. You can also use this property to determine the total number of characters (including spaces) that are selected when performing single character tasks in a for loop.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_sellength
     */
    get_SelLength() {
        result := ComCall(77, this, "int*", &plSelLength := 0, "HRESULT")
        return plSelLength
    }

    /**
     * Gets or sets the number of characters that are selected in the InkEdit control (run time only).
     * @remarks
     * 
     * You can use this property to determine if any characters are currently selected in the text box control before performing operations on the selected text. You can also use this property to determine the total number of characters (including spaces) that are selected when performing single character tasks in a for loop.
     * 
     * 
     * @param {Integer} plSelLength 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_sellength
     */
    put_SelLength(plSelLength) {
        result := ComCall(78, this, "int", plSelLength, "HRESULT")
        return result
    }

    /**
     * Gets or sets the selected text within the InkEdit control (run time only).
     * @remarks
     * 
     * Setting <b>SelText</b> to a new value sets <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_sellength">SelLength</a> to 0 and replaces the selected text with the new string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_seltext
     */
    get_SelText() {
        pbstrSelText := BSTR()
        result := ComCall(79, this, "ptr", pbstrSelText, "HRESULT")
        return pbstrSelText
    }

    /**
     * Gets or sets the selected text within the InkEdit control (run time only).
     * @remarks
     * 
     * Setting <b>SelText</b> to a new value sets <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_sellength">SelLength</a> to 0 and replaces the selected text with the new string.
     * 
     * 
     * @param {BSTR} pbstrSelText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_seltext
     */
    put_SelText(pbstrSelText) {
        pbstrSelText := pbstrSelText is String ? BSTR.Alloc(pbstrSelText).Value : pbstrSelText

        result := ComCall(80, this, "ptr", pbstrSelText, "HRESULT")
        return result
    }

    /**
     * Gets or sets the currently selected Rich Text Format (RTF) formatted text in the InkEdit control (run time only).
     * @remarks
     * 
     * Setting the SelRTF property replaces any selected text in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control with the new string. This property returns a zero-length string ("") if no text is selected in the control.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-get_selrtf
     */
    get_SelRTF() {
        pbstrSelRTF := BSTR()
        result := ComCall(81, this, "ptr", pbstrSelRTF, "HRESULT")
        return pbstrSelRTF
    }

    /**
     * Gets or sets the currently selected Rich Text Format (RTF) formatted text in the InkEdit control (run time only).
     * @remarks
     * 
     * Setting the SelRTF property replaces any selected text in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control">InkEdit</a> control with the new string. This property returns a zero-length string ("") if no text is selected in the control.
     * 
     * 
     * @param {BSTR} pbstrSelRTF 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-put_selrtf
     */
    put_SelRTF(pbstrSelRTF) {
        pbstrSelRTF := pbstrSelRTF is String ? BSTR.Alloc(pbstrSelRTF).Value : pbstrSelRTF

        result := ComCall(82, this, "ptr", pbstrSelRTF, "HRESULT")
        return result
    }

    /**
     * Causes the InkEdit control to redraw.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inked/nf-inked-iinkedit-refresh
     */
    Refresh() {
        result := ComCall(83, this, "HRESULT")
        return result
    }
}
