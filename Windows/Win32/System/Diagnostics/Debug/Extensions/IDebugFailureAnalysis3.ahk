#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\FA_ENTRY.ahk
#Include ..\..\..\..\Foundation\VARIANT_BOOL.ahk
#Include .\DEBUG_FLR_PARAM_TYPE.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\DEBUG_FAILURE_TYPE.ahk
#Include .\IDebugFAEntryTags.ahk
#Include .\FA_ENTRY_TYPE.ahk
#Include ..\..\..\..\Data\Xml\MsXml\IXMLDOMElement.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include .\IDebugFailureAnalysis2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugFailureAnalysis3 extends IUnknown {

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
     * @returns {DEBUG_FAILURE_TYPE} 
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
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(Tag) {
        result := ComCall(6, this, "int", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {DEBUG_FLR_PARAM_TYPE} TagMask 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetNext(Entry, Tag, TagMask) {
        result := ComCall(7, this, "ptr", Entry, "int", Tag, "int", TagMask, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {PSTR} Str 
     * @param {Integer} MaxSize 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetString(Tag, Str, MaxSize) {
        Str := Str is String ? StrPtr(Str) : Str

        result := ComCall(8, this, "int", Tag, "ptr", Str, "uint", MaxSize, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Buf 
     * @param {Integer} _Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetBuffer(Tag, Buf, _Size) {
        result := ComCall(9, this, "int", Tag, "ptr", Buf, "uint", _Size, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
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
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
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
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {PSTR} Str 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetString(Tag, Str) {
        Str := Str is String ? StrPtr(Str) : Str

        result := ComCall(13, this, "int", Tag, "ptr", Str, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
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
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetUlong(Tag, Value) {
        result := ComCall(15, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetUlong64(Tag, Value) {
        result := ComCall(16, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {FA_ENTRY_TYPE} EntryType 
     * @param {Integer} Buf 
     * @param {Integer} _Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetBuffer(Tag, EntryType, Buf, _Size) {
        result := ComCall(17, this, "int", Tag, "int", EntryType, "ptr", Buf, "uint", _Size, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
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
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
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
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddUlong(Tag, Value) {
        result := ComCall(20, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddUlong64(Tag, Value) {
        result := ComCall(21, this, "int", Tag, "uint", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {FA_ENTRY_TYPE} EntryType 
     * @param {Integer} Buf 
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
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
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
        pName := BSTR({Value: 0}, True)
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
