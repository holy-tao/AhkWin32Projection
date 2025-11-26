#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextDisplays.ahk
#Include .\ITextFont2.ahk
#Include .\ITextPara2.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextSelection2.ahk
#Include .\ITextStoryRanges2.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextStrings.ahk
#Include .\ITextRange2.ahk
#Include .\ITextStory.ahk
#Include .\ITextDocument.ahk

/**
 * Extends the ITextDocument interface, adding methods that enable the Input Method Editor (IME) to drive the rich edit control, and methods to retrieve other interfaces such as ITextDisplays, ITextRange2, ITextFont2, ITextPara2, and so on.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextdocument2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDocument2 extends ITextDocument{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e0-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaretType", "SetCaretType", "GetDisplays", "GetDocumentFont", "SetDocumentFont", "GetDocumentPara", "SetDocumentPara", "GetEastAsianFlags", "GetGenerator", "SetIMEInProgress", "GetNotificationMode", "SetNotificationMode", "GetSelection2", "GetStoryRanges2", "GetTypographyOptions", "GetVersion", "GetWindow", "AttachMsgFilter", "CheckTextLimit", "GetCallManager", "GetClientRect", "GetEffectColor", "GetImmContext", "GetPreferredFont", "GetProperty", "GetStrings", "Notify", "Range2", "RangeFromPoint2", "ReleaseCallManager", "ReleaseImmContext", "SetEffectColor", "SetProperty", "SetTypographyOptions", "SysBeep", "Update", "UpdateWindow", "GetMathProperties", "SetMathProperties", "GetActiveStory", "SetActiveStory", "GetMainStory", "GetNewStory", "GetStory"]

    /**
     * Gets the caret type.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getcarettype
     */
    GetCaretType() {
        result := ComCall(26, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the caret type.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setcarettype
     */
    SetCaretType(Value) {
        result := ComCall(27, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the displays collection for this Text Object Model (TOM) engine instance.
     * @returns {ITextDisplays} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextdisplays">ITextDisplays</a>**</b>
     * 
     * The displays collection.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getdisplays
     */
    GetDisplays() {
        result := ComCall(28, this, "ptr*", &ppDisplays := 0, "HRESULT")
        return ITextDisplays(ppDisplays)
    }

    /**
     * Gets an object that provides the default character format information for this instance of the Text Object Model (TOM) engine.
     * @returns {ITextFont2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>**</b>
     * 
     * The object that provides the default character format information.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getdocumentfont
     */
    GetDocumentFont() {
        result := ComCall(29, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont2(ppFont)
    }

    /**
     * Sets the default character formatting for this instance of the Text Object Model (TOM) engine.
     * @param {ITextFont2} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>*</b>
     * 
     * The font object that provides the default character formatting.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setdocumentfont
     */
    SetDocumentFont(pFont) {
        result := ComCall(30, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Gets an object that provides the default paragraph format information for this instance of the Text Object Model (TOM) engine.
     * @returns {ITextPara2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara2">ITextPara2</a>**</b>
     * 
     * The object that provides the default paragraph format  information.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getdocumentpara
     */
    GetDocumentPara() {
        result := ComCall(31, this, "ptr*", &ppPara := 0, "HRESULT")
        return ITextPara2(ppPara)
    }

    /**
     * Sets the default paragraph formatting for this instance of the Text Object Model (TOM) engine.
     * @param {ITextPara2} pPara Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara2">ITextPara2</a>*</b>
     * 
     * The paragraph object that provides the default paragraph formatting
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setdocumentpara
     */
    SetDocumentPara(pPara) {
        result := ComCall(32, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * Gets the East Asian flags.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-geteastasianflags
     */
    GetEastAsianFlags() {
        result := ComCall(33, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the name of the Text Object Model (TOM) engine.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The name of the TOM engine.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getgenerator
     */
    GetGenerator() {
        pbstr := BSTR()
        result := ComCall(34, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets the state of the Input Method Editor (IME) in-progress flag.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Use <b>tomTrue</b> to turn  on the IME in-progress flag, or <b>tomFalse</b> to turn it off.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setimeinprogress
     */
    SetIMEInProgress(Value) {
        result := ComCall(35, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the notification mode.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The notification mode. This parameter is set to <b>tomTrue</b> if notifications are active, or <b>tomFalse</b> if not.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getnotificationmode
     */
    GetNotificationMode() {
        result := ComCall(36, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the notification mode.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The notification mode. Use <b>tomTrue</b> to turn on notifications, or  <b>tomFalse</b> to turn them off.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setnotificationmode
     */
    SetNotificationMode(Value) {
        result := ComCall(37, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the active selection.
     * @returns {ITextSelection2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection2">ITextSelection2</a>**</b>
     * 
     * The active selection. This parameter is <b>NULL</b> if the rich edit control is not in-place active.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getselection2
     */
    GetSelection2() {
        result := ComCall(38, this, "ptr*", &ppSel := 0, "HRESULT")
        return ITextSelection2(ppSel)
    }

    /**
     * Gets an object for enumerating the stories in a document.
     * @returns {ITextStoryRanges2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstoryranges2">ITextStoryRanges2</a>**</b>
     * 
     * The object for enumerating stories.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getstoryranges2
     */
    GetStoryRanges2() {
        result := ComCall(39, this, "ptr*", &ppStories := 0, "HRESULT")
        return ITextStoryRanges2(ppStories)
    }

    /**
     * Gets the typography options.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A combination of the following typography options. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TO_ADVANCEDTYPOGRAPHY"></a><a id="to_advancedtypography"></a><dl>
     * <dt><b>TO_ADVANCEDTYPOGRAPHY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Advanced typography (special line breaking and line formatting) is turned on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TO_SIMPLELINEBREAK"></a><a id="to_simplelinebreak"></a><dl>
     * <dt><b>TO_SIMPLELINEBREAK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal line breaking and formatting is used.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-gettypographyoptions
     */
    GetTypographyOptions() {
        result := ComCall(40, this, "int*", &pOptions := 0, "HRESULT")
        return pOptions
    }

    /**
     * Gets the version number of the Text Object Model (TOM) engine.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The version number. Byte 3 gives the major version number, byte 2 the minor version number, and the low-order 16 bits give the build number.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getversion
     */
    GetVersion() {
        result := ComCall(41, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets the handle of the window that the Text Object Model (TOM) engine is using to display output.
     * @returns {Integer} Type: <b>__int64*</b>
     * 
     * The handle of the window that the TOM engine is using.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getwindow
     */
    GetWindow() {
        result := ComCall(42, this, "int64*", &pHwnd := 0, "HRESULT")
        return pHwnd
    }

    /**
     * Attaches a new message filter to the edit instance. All window messages that the edit instance receives are forwarded to the message filter.
     * @param {IUnknown} pFilter Type: <b>IUnknown*</b>
     * 
     * The message filter.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-attachmsgfilter
     */
    AttachMsgFilter(pFilter) {
        result := ComCall(43, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Checks whether the number of characters to be added would exceed the maximum text limit.
     * @param {Integer} cch Type: <b>long</b>
     * 
     * The number of characters to be added.
     * @param {Pointer<Integer>} pcch Type: <b>long*</b>
     * 
     * The number of characters that exceed the maximum text limit. This parameter is 0 if the number of characters does not exceed the limit.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-checktextlimit
     */
    CheckTextLimit(cch, pcch) {
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, "int", cch, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * Gets the call manager.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The call manager object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getcallmanager
     */
    GetCallManager() {
        result := ComCall(45, this, "ptr*", &ppVoid := 0, "HRESULT")
        return IUnknown(ppVoid)
    }

    /**
     * Retrieves the client rectangle of the rich edit control.
     * @param {Integer} Type Type: <b>long</b>
     * @param {Pointer<Integer>} pLeft Type: <b>long*</b>
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     * @param {Pointer<Integer>} pTop Type: <b>long*</b>
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     * @param {Pointer<Integer>} pRight Type: <b>long*</b>
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     * @param {Pointer<Integer>} pBottom Type: <b>long*</b>
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getclientrect
     */
    GetClientRect(Type, pLeft, pTop, pRight, pBottom) {
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pRightMarshal := pRight is VarRef ? "int*" : "ptr"
        pBottomMarshal := pBottom is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, "int", Type, pLeftMarshal, pLeft, pTopMarshal, pTop, pRightMarshal, pRight, pBottomMarshal, pBottom, "HRESULT")
        return result
    }

    /**
     * Retrieves the color used for special text attributes.
     * @param {Integer} Index Type: <b>long</b>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The color that corresponds to the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-geteffectcolor
     */
    GetEffectColor(Index) {
        result := ComCall(47, this, "int", Index, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets the Input Method Manager (IMM) input context from the Text Object Model (TOM) host.
     * @returns {Integer} Type: <b>__int64*</b>
     * 
     * The IMM input context.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getimmcontext
     */
    GetImmContext() {
        result := ComCall(48, this, "int64*", &pContext := 0, "HRESULT")
        return pContext
    }

    /**
     * Retrieves the preferred font for a particular character repertoire and character position.
     * @param {Integer} cp Type: <b>long</b>
     * 
     * The character position for the preferred font.
     * @param {Integer} CharRep Type: <b>long</b>
     * @param {Integer} Options Type: <b>long</b>
     * @param {Integer} curCharRep Type: <b>long</b>
     * 
     * The index of the current character repertoire.
     * @param {Integer} curFontSize Type: <b>long</b>
     * 
     * The current font size.
     * @param {Pointer<BSTR>} pbstr Type: <b>BSTR*</b>
     * 
     * The name of the font.
     * @param {Pointer<Integer>} pPitchAndFamily Type: <b>long*</b>
     * 
     * The font pitch and family.
     * @param {Pointer<Integer>} pNewFontSize Type: <b>long*</b>
     * 
     * The new font size.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getpreferredfont
     */
    GetPreferredFont(cp, CharRep, Options, curCharRep, curFontSize, pbstr, pPitchAndFamily, pNewFontSize) {
        pPitchAndFamilyMarshal := pPitchAndFamily is VarRef ? "int*" : "ptr"
        pNewFontSizeMarshal := pNewFontSize is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, "int", cp, "int", CharRep, "int", Options, "int", curCharRep, "int", curFontSize, "ptr", pbstr, pPitchAndFamilyMarshal, pPitchAndFamily, pNewFontSizeMarshal, pNewFontSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of a property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The identifier of the property to retrieve. It can be one of the following property IDs.
     * 
     * <a id="tomCanCopy_"></a>
     * <a id="tomcancopy_"></a>
     * <a id="TOMCANCOPY_"></a>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(50, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets a collection of rich-text strings.
     * @returns {ITextStrings} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstrings">ITextStrings</a>**</b>
     * 
     * The collection of rich-text strings.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getstrings
     */
    GetStrings() {
        result := ComCall(51, this, "ptr*", &ppStrs := 0, "HRESULT")
        return ITextStrings(ppStrs)
    }

    /**
     * Notifies the Text Object Model (TOM) engine client of particular Input Method Editor (IME) events.
     * @param {Integer} Notify Type: <b>long</b>
     * 
     * An IME notification code.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-notify
     */
    Notify(Notify) {
        result := ComCall(52, this, "int", Notify, "HRESULT")
        return result
    }

    /**
     * Retrieves a new text range for the active story of the document.
     * @param {Integer} cpActive Type: <b>long</b>
     * 
     * The active end of the new text range. The default value is 0; that is, the beginning of the story.
     * @param {Integer} cpAnchor Type: <b>long</b>
     * 
     * The anchor end of the new text range. The default value is 0.
     * @returns {ITextRange2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>**</b>
     * 
     * The new text range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-range2
     */
    Range2(cpActive, cpAnchor) {
        result := ComCall(53, this, "int", cpActive, "int", cpAnchor, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Retrieves the degenerate range at (or nearest to) a particular point on the screen.
     * @param {Integer} x Type: <b>long</b>
     * 
     * The x-coordinate of a point, in screen coordinates.
     * @param {Integer} y Type: <b>long</b>
     * 
     * The y-coordinate of a point, in screen coordinates.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The alignment type of the specified point. For a list of valid values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getpoint">ITextRange::GetPoint</a>.
     * @returns {ITextRange2} Type: <b>ITextRange2**</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-rangefrompoint2
     */
    RangeFromPoint2(x, y, Type) {
        result := ComCall(54, this, "int", x, "int", y, "int", Type, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Releases the call manager.
     * @param {IUnknown} pVoid Type: <b>IUnknown*</b>
     * 
     * The call manager object to release.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-releasecallmanager
     */
    ReleaseCallManager(pVoid) {
        result := ComCall(55, this, "ptr", pVoid, "HRESULT")
        return result
    }

    /**
     * Releases an Input Method Manager (IMM) input context.
     * @param {Integer} Context Type: <b>int64</b>
     * 
     * The IMM input context to release.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-releaseimmcontext
     */
    ReleaseImmContext(Context) {
        result := ComCall(56, this, "int64", Context, "HRESULT")
        return result
    }

    /**
     * Specifies the color to use for special text attributes.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The index of the color to retrieve. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-geteffectcolor">GetEffectColor</a>.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new color for the specified index.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-seteffectcolor
     */
    SetEffectColor(Index, Value) {
        result := ComCall(57, this, "int", Index, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies a new value for a property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The identifier of the property. For a list of possible property identifiers, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-getproperty"> GetProperty</a>.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(58, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies the typography options for the document.
     * @param {Integer} Options Type: <b>long</b>
     * 
     * The typography options to set. For a list of possible options, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-gettypographyoptions">GetTypographyOptions</a>.
     * @param {Integer} Mask Type: <b>long</b>
     * 
     * A mask identifying the options to set. For example, to turn on <b>TO_ADVANCEDTYPOGRAPHY</b>, call <b>ITextDocument2::SetTypographyOptions (TO_ADVANCEDTYPOGRAPHY, TO_ADVANCEDTYPOGRAPHY)</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-settypographyoptions
     */
    SetTypographyOptions(Options, Mask) {
        result := ComCall(59, this, "int", Options, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Generates a system beep.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-sysbeep
     */
    SysBeep() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * Updates the selection and caret.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Scroll flag. Use <b>tomTrue</b> to scroll the caret into view.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-update
     */
    Update(Value) {
        result := ComCall(61, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Notifies the client that the view has changed and the client should update the view if the Text Object Model (TOM) engine is in-place active.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-updatewindow
     */
    UpdateWindow() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * Gets the math properties for the document.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A combination of the following math properties. 
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispAlignMask"></a><a id="tommathdispalignmask"></a><a id="TOMMATHDISPALIGNMASK"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispAlignMask</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display-mode alignment mask.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispAlignCenter"></a><a id="tommathdispaligncenter"></a><a id="TOMMATHDISPALIGNCENTER"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispAlignCenter</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Center (default) alignment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispAlignLeft"></a><a id="tommathdispalignleft"></a><a id="TOMMATHDISPALIGNLEFT"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispAlignLeft</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Left alignment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispAlignRight"></a><a id="tommathdispalignright"></a><a id="TOMMATHDISPALIGNRIGHT"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispAlignRight</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Right alignment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispIntUnderOver"></a><a id="tommathdispintunderover"></a><a id="TOMMATHDISPINTUNDEROVER"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispIntUnderOver</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display-mode integral limits location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispFracTeX"></a><a id="tommathdispfractex"></a><a id="TOMMATHDISPFRACTEX"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispFracTeX</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display-mode nested fraction script size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispNaryGrow"></a><a id="tommathdispnarygrow"></a><a id="TOMMATHDISPNARYGROW"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispNaryGrow</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Math-paragraph n-ary grow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocEmptyArgMask"></a><a id="tommathdocemptyargmask"></a><a id="TOMMATHDOCEMPTYARGMASK"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocEmptyArgMask</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty arguments display mask.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocEmptyArgAuto_"></a><a id="tommathdocemptyargauto_"></a><a id="TOMMATHDOCEMPTYARGAUTO_"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocEmptyArgAuto </a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatically use a dotted square to denote empty arguments, if necessary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocEmptyArgAlways"></a><a id="tommathdocemptyargalways"></a><a id="TOMMATHDOCEMPTYARGALWAYS"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocEmptyArgAlways</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always use a dotted square to denote empty arguments..
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocEmptyArgNever"></a><a id="tommathdocemptyargnever"></a><a id="TOMMATHDOCEMPTYARGNEVER"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocEmptyArgNever</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Don't denote empty arguments. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocSbSpOpUnchanged"></a><a id="tommathdocsbspopunchanged"></a><a id="TOMMATHDOCSBSPOPUNCHANGED"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocSbSpOpUnchanged</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display the underscore (_) and caret (^) as themselves.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocDiffMask"></a><a id="tommathdocdiffmask"></a><a id="TOMMATHDOCDIFFMASK"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocDiffMask</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Style mask for the <b>tomMathDocDiffUpright</b>, <b>tomMathDocDiffItalic</b>, <b>tomMathDocDiffOpenItalic </b>options.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocDiffItalic"></a><a id="tommathdocdiffitalic"></a><a id="TOMMATHDOCDIFFITALIC"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocDiffItalic</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use italic (default) for math differentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocDiffUpright"></a><a id="tommathdocdiffupright"></a><a id="TOMMATHDOCDIFFUPRIGHT"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocDiffUpright</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use an upright font for math differentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDocDiffOpenItalic"></a><a id="tommathdocdiffopenitalic"></a><a id="TOMMATHDOCDIFFOPENITALIC"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDocDiffOpenItalic</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use open italic (default) for math differentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispNarySubSup"></a><a id="tommathdispnarysubsup"></a><a id="TOMMATHDISPNARYSUBSUP"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispNarySubSup</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Math-paragraph non-integral n-ary limits location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathDispDef"></a><a id="tommathdispdef"></a><a id="TOMMATHDISPDEF"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathDispDef</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Math-paragraph spacing defaults.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathEnableRtl"></a><a id="tommathenablertl"></a><a id="TOMMATHENABLERTL"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathEnableRtl</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable right-to-left (RTL) math zones in RTL paragraphs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinMask"></a><a id="tommathbrkbinmask"></a><a id="TOMMATHBRKBINMASK"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinMask</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Equation line break mask.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinBefore"></a><a id="tommathbrkbinbefore"></a><a id="TOMMATHBRKBINBEFORE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinBefore</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Break before binary/relational operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinAfter"></a><a id="tommathbrkbinafter"></a><a id="TOMMATHBRKBINAFTER"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinAfter</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Break after binary/relational operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinDup"></a><a id="tommathbrkbindup"></a><a id="TOMMATHBRKBINDUP"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinDup</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Duplicate binary/relational before/after.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinSubMask"></a><a id="tommathbrkbinsubmask"></a><a id="TOMMATHBRKBINSUBMASK"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinSubMask</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Duplicate mask for minus operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinSubMM"></a><a id="tommathbrkbinsubmm"></a><a id="TOMMATHBRKBINSUBMM"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinSubMM</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * - - (minus on both lines).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinSubPM"></a><a id="tommathbrkbinsubpm"></a><a id="TOMMATHBRKBINSUBPM"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinSubPM</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * + -
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomMathBrkBinSubMP"></a><a id="tommathbrkbinsubmp"></a><a id="TOMMATHBRKBINSUBMP"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathBrkBinSubMP</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * - +
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getmathproperties
     */
    GetMathProperties() {
        result := ComCall(63, this, "int*", &pOptions := 0, "HRESULT")
        return pOptions
    }

    /**
     * Specifies the math properties to use for the document.
     * @param {Integer} Options Type: <b>long</b>
     * 
     * The math properties to set. For a list of possible properties, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-getmathproperties">GetMathProperties</a>.
     * @param {Integer} Mask Type: <b>long</b>
     * 
     * The math mask. For a list of possible masks, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-getmathproperties">GetMathProperties</a>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setmathproperties
     */
    SetMathProperties(Options, Mask) {
        result := ComCall(64, this, "int", Options, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Gets the active story; that is, the story that receives keyboard and mouse input.
     * @returns {ITextStory} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstory">ITextStory</a>**</b>
     * 
     * The active story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getactivestory
     */
    GetActiveStory() {
        result := ComCall(65, this, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }

    /**
     * Sets the active story; that is, the story that receives keyboard and mouse input.
     * @param {ITextStory} pStory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstory">ITextStory</a>*</b>
     * 
     * The story to set as active.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-setactivestory
     */
    SetActiveStory(pStory) {
        result := ComCall(66, this, "ptr", pStory, "HRESULT")
        return result
    }

    /**
     * Gets the main story.
     * @returns {ITextStory} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstory">ITextStory</a>**</b>
     * 
     * The main story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getmainstory
     */
    GetMainStory() {
        result := ComCall(67, this, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }

    /**
     * Gets a new story.
     * @returns {ITextStory} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstory">ITextStory</a>**</b>
     * 
     * The new story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getnewstory
     */
    GetNewStory() {
        result := ComCall(68, this, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }

    /**
     * Retrieves the story that corresponds to a particular index.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The index of the story to retrieve.
     * @returns {ITextStory} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstory">ITextStory</a>**</b>
     * 
     * The story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument2-getstory
     */
    GetStory(Index) {
        result := ComCall(69, this, "int", Index, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }
}
