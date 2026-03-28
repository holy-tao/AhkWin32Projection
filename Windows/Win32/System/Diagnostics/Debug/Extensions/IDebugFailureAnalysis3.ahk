#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugFAEntryTags.ahk
#Include ..\..\..\..\Data\Xml\MsXml\IXMLDOMElement.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugFailureAnalysis3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugFailureAnalysis3
     * @type {Guid}
     */
    static IID => Guid("{3627dc67-fd45-42ff-9ba4-4a67ee64619f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFailureClass", "GetFailureType", "GetFailureCode", "Get", "GetNext", "GetString", "GetBuffer", "GetUlong", "GetUlong64", "NextEntry", "SetString", "SetExtensionCommand", "SetUlong", "SetUlong64", "SetBuffer", "AddString", "AddExtensionCommand", "AddUlong", "AddUlong64", "AddBuffer", "GetDebugFATagControl", "GetAnalysisXml", "AddStructuredAnalysisData", "AddThreads", "AttributeGet", "AttributeGetName", "AttributeSet", "BlameApplication", "BlameProcess", "BlameThread", "BlameStitch", "BlameTEB", "BlameETHREAD", "ProblemClassIsSet", "ProblemClassDelete", "ProblemClassSet", "ProblemClassSetBSTR", "SetAdditionalXML", "GetAdditionalXML", "DeleteAdditionalXML"]

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureClass() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureType() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureCode() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {Integer} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(Tag) {
        result := ComCall(6, this, "int", Tag, "ptr")
        return result
    }

    /**
     * Retrieves a handle to the first control in a group of controls that precedes (or follows) the specified control in a dialog box.
     * @remarks
     * The <b>GetNextDlgGroupItem</b> function searches controls in the order (or reverse order) they were created in the dialog box template. The first control in the group must have the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dlgbox-programming-considerations">WS_GROUP</a> style; all other controls in the group must have been consecutively created and must not have the <b>WS_GROUP</b> style. 
     * 
     * When searching for the previous control, the function returns the first control it locates that is visible and not disabled. If the control specified by <i>hCtl</i> has the <b>WS_GROUP</b> style, the function temporarily reverses the search to locate the first control having the <b>WS_GROUP</b> style, then resumes the search in the original direction, returning the first control it locates that is visible and not disabled, or returning <i>hCtl</i> if no such control is found. 
     * 
     * When searching for the next control, the function returns the first control it locates that is visible, not disabled, and does not have the <b>WS_GROUP</b> style. If it encounters a control having the <b>WS_GROUP</b> style, the function reverses the search, locates the first control having the <b>WS_GROUP</b> style, and returns this control if it is visible and not disabled. Otherwise, the function resumes the search in the original direction and returns the first control it locates that is visible and not disabled, or returns <i>hCtl</i> if no such control is found. 
     * 
     * If the search for the next control in the group encounters a window with the <b>WS_EX_CONTROLPARENT</b> style, the system recursively searches the window's children.
     * @param {Pointer<FA_ENTRY>} Entry 
     * @param {Integer} Tag 
     * @param {Integer} TagMask 
     * @returns {Pointer<FA_ENTRY>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous (or next) control in the group of controls. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getnextdlggroupitem
     */
    GetNext(Entry, Tag, TagMask) {
        result := ComCall(7, this, "ptr", Entry, "int", Tag, "int", TagMask, "ptr")
        return result
    }

    /**
     * Returns a string located at a given position within a BLOB.
     * @param {Integer} Tag 
     * @param {PSTR} Str 
     * @param {Integer} MaxSize 
     * @returns {Pointer<FA_ENTRY>} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the error.
     * 
     * If the specified **Owner**, **Category**, or **Tag** data does not exist, the function returns **NMERR\_BLOB\_ENTRY\_DOES\_NOT\_EXIST**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getstringfromblob
     */
    GetString(Tag, Str, MaxSize) {
        Str := Str is String ? StrPtr(Str) : Str

        result := ComCall(8, this, "int", Tag, "ptr", Str, "uint", MaxSize, "ptr")
        return result
    }

    /**
     * Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
     * @remarks
     * The number of bits per pixel depends on the pixel format passed to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
     * @param {Integer} Tag 
     * @param {Pointer} Buf 
     * @param {Integer} _Size 
     * @returns {Pointer<FA_ENTRY>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If an error occurs, <i>ppbBuffer</i>  is set to <b>NULL</b> and <i>pcxRow</i> is set to zero.
     * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getbufferedpaintbits
     */
    GetBuffer(Tag, Buf, _Size) {
        result := ComCall(9, this, "int", Tag, "ptr", Buf, "uint", _Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong(Tag, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "int", Tag, ValueMarshal, Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong64(Tag, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "int", Tag, ValueMarshal, Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @returns {Pointer<FA_ENTRY>} 
     */
    NextEntry(Entry) {
        result := ComCall(12, this, "ptr", Entry, "ptr")
        return result
    }

    /**
     * Sets a string at a given location within a BLOB.
     * @param {Integer} Tag 
     * @param {PSTR} Str 
     * @returns {Pointer<FA_ENTRY>} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the problem.
     * 
     * If the specified **Owner**, **Category**, or **Tag** information does not exist, the return value is NMERR\_BLOB\_ENTRY\_DOES\_NOT\_EXIST.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/setstringinblob
     */
    SetString(Tag, Str) {
        Str := Str is String ? StrPtr(Str) : Str

        result := ComCall(13, this, "int", Tag, "ptr", Str, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {PSTR} _Extension 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetExtensionCommand(Tag, _Extension) {
        _Extension := _Extension is String ? StrPtr(_Extension) : _Extension

        result := ComCall(14, this, "int", Tag, "ptr", _Extension, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetUlong(Tag, Value) {
        result := ComCall(15, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetUlong64(Tag, Value) {
        result := ComCall(16, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | SetBufferFullnessBits
     * @param {Integer} Tag 
     * @param {Integer} EntryType 
     * @param {Pointer} Buf 
     * @param {Integer} _Size 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecleakybucket-setbufferfullnessbits
     */
    SetBuffer(Tag, EntryType, Buf, _Size) {
        result := ComCall(17, this, "int", Tag, "int", EntryType, "ptr", Buf, "uint", _Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {PSTR} Str 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddString(Tag, Str) {
        Str := Str is String ? StrPtr(Str) : Str

        result := ComCall(18, this, "int", Tag, "ptr", Str, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {PSTR} _Extension 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddExtensionCommand(Tag, _Extension) {
        _Extension := _Extension is String ? StrPtr(_Extension) : _Extension

        result := ComCall(19, this, "int", Tag, "ptr", _Extension, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddUlong(Tag, Value) {
        result := ComCall(20, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddUlong64(Tag, Value) {
        result := ComCall(21, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Integer} EntryType 
     * @param {Pointer} Buf 
     * @param {Integer} _Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddBuffer(Tag, EntryType, Buf, _Size) {
        result := ComCall(22, this, "int", Tag, "int", EntryType, "ptr", Buf, "uint", _Size, "ptr")
        return result
    }

    /**
     * 
     * @returns {IDebugFAEntryTags} 
     */
    GetDebugFATagControl() {
        result := ComCall(23, this, "ptr*", &FATagControl := 0, "HRESULT")
        return IDebugFAEntryTags(FATagControl)
    }

    /**
     * 
     * @returns {IXMLDOMElement} 
     */
    GetAnalysisXml() {
        result := ComCall(24, this, "ptr*", &ppXMLDOMElement := 0, "HRESULT")
        return IXMLDOMElement(ppXMLDOMElement)
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {IDebugFailureAnalysis2} Analysis 
     * @returns {HRESULT} 
     */
    AddStructuredAnalysisData(Tag, Analysis) {
        result := ComCall(25, this, "int", Tag, "ptr", Analysis, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDebugFailureThreadEnum 
     * @returns {HRESULT} 
     */
    AddThreads(pDebugFailureThreadEnum) {
        result := ComCall(26, this, "ptr", pDebugFailureThreadEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {VARIANT} 
     */
    AttributeGet(nIndex) {
        pValue := VARIANT()
        result := ComCall(27, this, "uint", nIndex, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    AttributeGetName(nIndex) {
        pName := BSTR()
        result := ComCall(28, this, "uint", nIndex, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    AttributeSet(nIndex, Value) {
        result := ComCall(29, this, "uint", nIndex, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Postfix 
     * @returns {HRESULT} 
     */
    BlameApplication(Postfix) {
        Postfix := Postfix is String ? BSTR.Alloc(Postfix).Value : Postfix

        result := ComCall(30, this, "ptr", Postfix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Postfix 
     * @returns {HRESULT} 
     */
    BlameProcess(Postfix) {
        Postfix := Postfix is String ? BSTR.Alloc(Postfix).Value : Postfix

        result := ComCall(31, this, "ptr", Postfix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pThread 
     * @returns {HRESULT} 
     */
    BlameThread(pThread) {
        result := ComCall(32, this, "ptr", pThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pThread 
     * @param {BSTR} Stitch 
     * @returns {HRESULT} 
     */
    BlameStitch(pThread, Stitch) {
        Stitch := Stitch is String ? BSTR.Alloc(Stitch).Value : Stitch

        result := ComCall(33, this, "ptr", pThread, "ptr", Stitch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Address 
     * @returns {HRESULT} 
     */
    BlameTEB(_Address) {
        result := ComCall(34, this, "uint", _Address, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Address 
     * @returns {HRESULT} 
     */
    BlameETHREAD(_Address) {
        result := ComCall(35, this, "uint", _Address, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {VARIANT_BOOL} 
     */
    ProblemClassIsSet(nIndex) {
        result := ComCall(36, this, "uint", nIndex, "short*", &pSet := 0, "HRESULT")
        return pSet
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    ProblemClassDelete(nIndex) {
        result := ComCall(37, this, "uint", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    ProblemClassSet(nIndex) {
        result := ComCall(38, this, "uint", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    ProblemClassSetBSTR(nIndex, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(39, this, "uint", nIndex, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Key 
     * @param {IUnknown} pXMLDOMElement 
     * @returns {HRESULT} 
     */
    SetAdditionalXML(Key, pXMLDOMElement) {
        Key := Key is String ? BSTR.Alloc(Key).Value : Key

        result := ComCall(40, this, "ptr", Key, "ptr", pXMLDOMElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Key 
     * @returns {IUnknown} 
     */
    GetAdditionalXML(Key) {
        Key := Key is String ? BSTR.Alloc(Key).Value : Key

        result := ComCall(41, this, "ptr", Key, "ptr*", &ppXMLDOMElement := 0, "HRESULT")
        return IUnknown(ppXMLDOMElement)
    }

    /**
     * 
     * @param {BSTR} Key 
     * @returns {HRESULT} 
     */
    DeleteAdditionalXML(Key) {
        Key := Key is String ? BSTR.Alloc(Key).Value : Key

        result := ComCall(42, this, "ptr", Key, "HRESULT")
        return result
    }
}
