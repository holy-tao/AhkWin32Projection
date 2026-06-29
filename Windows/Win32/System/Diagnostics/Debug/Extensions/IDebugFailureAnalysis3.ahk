#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Data\Xml\MsXml\IXMLDOMElement.ahk" { IXMLDOMElement }
#Import ".\FA_ENTRY.ahk" { FA_ENTRY }
#Import ".\DEBUG_FLR_PARAM_TYPE.ahk" { DEBUG_FLR_PARAM_TYPE }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugFailureAnalysis2.ahk" { IDebugFailureAnalysis2 }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DEBUG_FAILURE_TYPE.ahk" { DEBUG_FAILURE_TYPE }
#Import ".\IDebugFAEntryTags.ahk" { IDebugFAEntryTags }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\FA_ENTRY_TYPE.ahk" { FA_ENTRY_TYPE }
#Import "..\..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugFailureAnalysis3 extends IUnknown {
    /**
     * The interface identifier for IDebugFailureAnalysis3
     * @type {Guid}
     */
    static IID := Guid("{3627dc67-fd45-42ff-9ba4-4a67ee64619f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugFailureAnalysis3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFailureClass           : IntPtr
        GetFailureType            : IntPtr
        GetFailureCode            : IntPtr
        Get                       : IntPtr
        GetNext                   : IntPtr
        GetString                 : IntPtr
        GetBuffer                 : IntPtr
        GetUlong                  : IntPtr
        GetUlong64                : IntPtr
        NextEntry                 : IntPtr
        SetString                 : IntPtr
        SetExtensionCommand       : IntPtr
        SetUlong                  : IntPtr
        SetUlong64                : IntPtr
        SetBuffer                 : IntPtr
        AddString                 : IntPtr
        AddExtensionCommand       : IntPtr
        AddUlong                  : IntPtr
        AddUlong64                : IntPtr
        AddBuffer                 : IntPtr
        GetDebugFATagControl      : IntPtr
        GetAnalysisXml            : IntPtr
        AddStructuredAnalysisData : IntPtr
        AddThreads                : IntPtr
        AttributeGet              : IntPtr
        AttributeGetName          : IntPtr
        AttributeSet              : IntPtr
        BlameApplication          : IntPtr
        BlameProcess              : IntPtr
        BlameThread               : IntPtr
        BlameStitch               : IntPtr
        BlameTEB                  : IntPtr
        BlameETHREAD              : IntPtr
        ProblemClassIsSet         : IntPtr
        ProblemClassDelete        : IntPtr
        ProblemClassSet           : IntPtr
        ProblemClassSetBSTR       : IntPtr
        SetAdditionalXML          : IntPtr
        GetAdditionalXML          : IntPtr
        DeleteAdditionalXML       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugFailureAnalysis3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureClass() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * 
     * @returns {DEBUG_FAILURE_TYPE} 
     */
    GetFailureType() {
        result := ComCall(4, this, DEBUG_FAILURE_TYPE)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureCode() {
        result := ComCall(5, this, UInt32)
        return result
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(Tag) {
        result := ComCall(6, this, DEBUG_FLR_PARAM_TYPE, Tag, FA_ENTRY.Ptr)
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
        result := ComCall(7, this, FA_ENTRY.Ptr, Entry, DEBUG_FLR_PARAM_TYPE, Tag, DEBUG_FLR_PARAM_TYPE, TagMask, FA_ENTRY.Ptr)
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

        result := ComCall(8, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Str, "uint", MaxSize, FA_ENTRY.Ptr)
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
        result := ComCall(9, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Buf, "uint", _Size, FA_ENTRY.Ptr)
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

        result := ComCall(10, this, DEBUG_FLR_PARAM_TYPE, Tag, ValueMarshal, Value, FA_ENTRY.Ptr)
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

        result := ComCall(11, this, DEBUG_FLR_PARAM_TYPE, Tag, ValueMarshal, Value, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @returns {Pointer<FA_ENTRY>} 
     */
    NextEntry(Entry) {
        result := ComCall(12, this, FA_ENTRY.Ptr, Entry, FA_ENTRY.Ptr)
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

        result := ComCall(13, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Str, FA_ENTRY.Ptr)
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

        result := ComCall(14, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", _Extension, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetUlong(Tag, Value) {
        result := ComCall(15, this, DEBUG_FLR_PARAM_TYPE, Tag, "uint", Value, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    SetUlong64(Tag, Value) {
        result := ComCall(16, this, DEBUG_FLR_PARAM_TYPE, Tag, "uint", Value, FA_ENTRY.Ptr)
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
        result := ComCall(17, this, DEBUG_FLR_PARAM_TYPE, Tag, FA_ENTRY_TYPE, EntryType, "ptr", Buf, "uint", _Size, FA_ENTRY.Ptr)
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

        result := ComCall(18, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Str, FA_ENTRY.Ptr)
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

        result := ComCall(19, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", _Extension, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddUlong(Tag, Value) {
        result := ComCall(20, this, DEBUG_FLR_PARAM_TYPE, Tag, "uint", Value, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    AddUlong64(Tag, Value) {
        result := ComCall(21, this, DEBUG_FLR_PARAM_TYPE, Tag, "uint", Value, FA_ENTRY.Ptr)
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
        result := ComCall(22, this, DEBUG_FLR_PARAM_TYPE, Tag, FA_ENTRY_TYPE, EntryType, "ptr", Buf, "uint", _Size, FA_ENTRY.Ptr)
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
        result := ComCall(25, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Analysis, "HRESULT")
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
        result := ComCall(27, this, "uint", nIndex, VARIANT.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    AttributeGetName(nIndex) {
        pName := BSTR.Owned()
        result := ComCall(28, this, "uint", nIndex, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    AttributeSet(nIndex, Value) {
        result := ComCall(29, this, "uint", nIndex, VARIANT, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Postfix 
     * @returns {HRESULT} 
     */
    BlameApplication(Postfix) {
        Postfix := Postfix is String ? BSTR.Alloc(Postfix).Value : Postfix

        result := ComCall(30, this, BSTR, Postfix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Postfix 
     * @returns {HRESULT} 
     */
    BlameProcess(Postfix) {
        Postfix := Postfix is String ? BSTR.Alloc(Postfix).Value : Postfix

        result := ComCall(31, this, BSTR, Postfix, "HRESULT")
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

        result := ComCall(33, this, "ptr", pThread, BSTR, Stitch, "HRESULT")
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
        result := ComCall(36, this, "uint", nIndex, VARIANT_BOOL.Ptr, &pSet := 0, "HRESULT")
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

        result := ComCall(39, this, "uint", nIndex, BSTR, Value, "HRESULT")
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

        result := ComCall(40, this, BSTR, Key, "ptr", pXMLDOMElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Key 
     * @returns {IUnknown} 
     */
    GetAdditionalXML(Key) {
        Key := Key is String ? BSTR.Alloc(Key).Value : Key

        result := ComCall(41, this, BSTR, Key, "ptr*", &ppXMLDOMElement := 0, "HRESULT")
        return IUnknown(ppXMLDOMElement)
    }

    /**
     * 
     * @param {BSTR} Key 
     * @returns {HRESULT} 
     */
    DeleteAdditionalXML(Key) {
        Key := Key is String ? BSTR.Alloc(Key).Value : Key

        result := ComCall(42, this, BSTR, Key, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugFailureAnalysis3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFailureClass := CallbackCreate(GetMethod(implObj, "GetFailureClass"), flags, 1)
        this.vtbl.GetFailureType := CallbackCreate(GetMethod(implObj, "GetFailureType"), flags, 1)
        this.vtbl.GetFailureCode := CallbackCreate(GetMethod(implObj, "GetFailureCode"), flags, 1)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 2)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 4)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 4)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 4)
        this.vtbl.GetUlong := CallbackCreate(GetMethod(implObj, "GetUlong"), flags, 3)
        this.vtbl.GetUlong64 := CallbackCreate(GetMethod(implObj, "GetUlong64"), flags, 3)
        this.vtbl.NextEntry := CallbackCreate(GetMethod(implObj, "NextEntry"), flags, 2)
        this.vtbl.SetString := CallbackCreate(GetMethod(implObj, "SetString"), flags, 3)
        this.vtbl.SetExtensionCommand := CallbackCreate(GetMethod(implObj, "SetExtensionCommand"), flags, 3)
        this.vtbl.SetUlong := CallbackCreate(GetMethod(implObj, "SetUlong"), flags, 3)
        this.vtbl.SetUlong64 := CallbackCreate(GetMethod(implObj, "SetUlong64"), flags, 3)
        this.vtbl.SetBuffer := CallbackCreate(GetMethod(implObj, "SetBuffer"), flags, 5)
        this.vtbl.AddString := CallbackCreate(GetMethod(implObj, "AddString"), flags, 3)
        this.vtbl.AddExtensionCommand := CallbackCreate(GetMethod(implObj, "AddExtensionCommand"), flags, 3)
        this.vtbl.AddUlong := CallbackCreate(GetMethod(implObj, "AddUlong"), flags, 3)
        this.vtbl.AddUlong64 := CallbackCreate(GetMethod(implObj, "AddUlong64"), flags, 3)
        this.vtbl.AddBuffer := CallbackCreate(GetMethod(implObj, "AddBuffer"), flags, 5)
        this.vtbl.GetDebugFATagControl := CallbackCreate(GetMethod(implObj, "GetDebugFATagControl"), flags, 2)
        this.vtbl.GetAnalysisXml := CallbackCreate(GetMethod(implObj, "GetAnalysisXml"), flags, 2)
        this.vtbl.AddStructuredAnalysisData := CallbackCreate(GetMethod(implObj, "AddStructuredAnalysisData"), flags, 3)
        this.vtbl.AddThreads := CallbackCreate(GetMethod(implObj, "AddThreads"), flags, 2)
        this.vtbl.AttributeGet := CallbackCreate(GetMethod(implObj, "AttributeGet"), flags, 3)
        this.vtbl.AttributeGetName := CallbackCreate(GetMethod(implObj, "AttributeGetName"), flags, 3)
        this.vtbl.AttributeSet := CallbackCreate(GetMethod(implObj, "AttributeSet"), flags, 3)
        this.vtbl.BlameApplication := CallbackCreate(GetMethod(implObj, "BlameApplication"), flags, 2)
        this.vtbl.BlameProcess := CallbackCreate(GetMethod(implObj, "BlameProcess"), flags, 2)
        this.vtbl.BlameThread := CallbackCreate(GetMethod(implObj, "BlameThread"), flags, 2)
        this.vtbl.BlameStitch := CallbackCreate(GetMethod(implObj, "BlameStitch"), flags, 3)
        this.vtbl.BlameTEB := CallbackCreate(GetMethod(implObj, "BlameTEB"), flags, 2)
        this.vtbl.BlameETHREAD := CallbackCreate(GetMethod(implObj, "BlameETHREAD"), flags, 2)
        this.vtbl.ProblemClassIsSet := CallbackCreate(GetMethod(implObj, "ProblemClassIsSet"), flags, 3)
        this.vtbl.ProblemClassDelete := CallbackCreate(GetMethod(implObj, "ProblemClassDelete"), flags, 2)
        this.vtbl.ProblemClassSet := CallbackCreate(GetMethod(implObj, "ProblemClassSet"), flags, 2)
        this.vtbl.ProblemClassSetBSTR := CallbackCreate(GetMethod(implObj, "ProblemClassSetBSTR"), flags, 3)
        this.vtbl.SetAdditionalXML := CallbackCreate(GetMethod(implObj, "SetAdditionalXML"), flags, 3)
        this.vtbl.GetAdditionalXML := CallbackCreate(GetMethod(implObj, "GetAdditionalXML"), flags, 3)
        this.vtbl.DeleteAdditionalXML := CallbackCreate(GetMethod(implObj, "DeleteAdditionalXML"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFailureClass)
        CallbackFree(this.vtbl.GetFailureType)
        CallbackFree(this.vtbl.GetFailureCode)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.GetNext)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.GetUlong)
        CallbackFree(this.vtbl.GetUlong64)
        CallbackFree(this.vtbl.NextEntry)
        CallbackFree(this.vtbl.SetString)
        CallbackFree(this.vtbl.SetExtensionCommand)
        CallbackFree(this.vtbl.SetUlong)
        CallbackFree(this.vtbl.SetUlong64)
        CallbackFree(this.vtbl.SetBuffer)
        CallbackFree(this.vtbl.AddString)
        CallbackFree(this.vtbl.AddExtensionCommand)
        CallbackFree(this.vtbl.AddUlong)
        CallbackFree(this.vtbl.AddUlong64)
        CallbackFree(this.vtbl.AddBuffer)
        CallbackFree(this.vtbl.GetDebugFATagControl)
        CallbackFree(this.vtbl.GetAnalysisXml)
        CallbackFree(this.vtbl.AddStructuredAnalysisData)
        CallbackFree(this.vtbl.AddThreads)
        CallbackFree(this.vtbl.AttributeGet)
        CallbackFree(this.vtbl.AttributeGetName)
        CallbackFree(this.vtbl.AttributeSet)
        CallbackFree(this.vtbl.BlameApplication)
        CallbackFree(this.vtbl.BlameProcess)
        CallbackFree(this.vtbl.BlameThread)
        CallbackFree(this.vtbl.BlameStitch)
        CallbackFree(this.vtbl.BlameTEB)
        CallbackFree(this.vtbl.BlameETHREAD)
        CallbackFree(this.vtbl.ProblemClassIsSet)
        CallbackFree(this.vtbl.ProblemClassDelete)
        CallbackFree(this.vtbl.ProblemClassSet)
        CallbackFree(this.vtbl.ProblemClassSetBSTR)
        CallbackFree(this.vtbl.SetAdditionalXML)
        CallbackFree(this.vtbl.GetAdditionalXML)
        CallbackFree(this.vtbl.DeleteAdditionalXML)
    }
}
