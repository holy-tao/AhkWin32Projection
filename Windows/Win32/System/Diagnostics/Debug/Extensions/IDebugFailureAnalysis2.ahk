#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugFailureAnalysis2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugFailureAnalysis2
     * @type {Guid}
     */
    static IID => Guid("{ea15c288-8226-4b70-acf6-0be6b189e3ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFailureClass", "GetFailureType", "GetFailureCode", "Get", "GetNext", "GetString", "GetBuffer", "GetUlong", "GetUlong64", "NextEntry", "SetString", "SetExtensionCommand", "SetUlong", "SetUlong64", "SetBuffer", "AddString", "AddExtensionCommand", "AddUlong", "AddUlong64", "AddBuffer", "GetDebugFATagControl", "GetAnalysisXml", "AddStructuredAnalysisData"]

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
     * 
     * @param {Integer} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     */
    Get(Tag) {
        result := ComCall(6, this, "int", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @param {Integer} Tag 
     * @param {Integer} TagMask 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetNext(Entry, Tag, TagMask) {
        result := ComCall(7, this, "ptr", Entry, "int", Tag, "int", TagMask, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
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
     * @param {Integer} Tag 
     * @param {Pointer} Buf 
     * @param {Integer} Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetBuffer(Tag, Buf, Size) {
        result := ComCall(9, this, "int", Tag, "ptr", Buf, "uint", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong(Tag, Value) {
        result := ComCall(10, this, "int", Tag, "uint*", Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong64(Tag, Value) {
        result := ComCall(11, this, "int", Tag, "uint*", Value, "ptr")
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
     * @param {Integer} Tag 
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
     * @param {Integer} Tag 
     * @param {PSTR} Extension 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetExtensionCommand(Tag, Extension) {
        Extension := Extension is String ? StrPtr(Extension) : Extension

        result := ComCall(14, this, "int", Tag, "ptr", Extension, "ptr")
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
     * 
     * @param {Integer} Tag 
     * @param {Integer} EntryType 
     * @param {Pointer} Buf 
     * @param {Integer} Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetBuffer(Tag, EntryType, Buf, Size) {
        result := ComCall(17, this, "int", Tag, "int", EntryType, "ptr", Buf, "uint", Size, "ptr")
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
     * @param {PSTR} Extension 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddExtensionCommand(Tag, Extension) {
        Extension := Extension is String ? StrPtr(Extension) : Extension

        result := ComCall(19, this, "int", Tag, "ptr", Extension, "ptr")
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
     * @param {Integer} Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddBuffer(Tag, EntryType, Buf, Size) {
        result := ComCall(22, this, "int", Tag, "int", EntryType, "ptr", Buf, "uint", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugFAEntryTags>} FATagControl 
     * @returns {HRESULT} 
     */
    GetDebugFATagControl(FATagControl) {
        result := ComCall(23, this, "ptr*", FATagControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMElement>} ppXMLDOMElement 
     * @returns {HRESULT} 
     */
    GetAnalysisXml(ppXMLDOMElement) {
        result := ComCall(24, this, "ptr*", ppXMLDOMElement, "HRESULT")
        return result
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
}
