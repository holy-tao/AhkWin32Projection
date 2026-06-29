#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfComposition.ahk" { ITfComposition }
#Import ".\ITfRange.ahk" { ITfRange }
#Import ".\IEnumITfCompositionView.ahk" { IEnumITfCompositionView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCompositionView.ahk" { ITfCompositionView }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfCompositionSink.ahk" { ITfCompositionSink }

/**
 * The ITfContextComposition interface is implemented by the TSF manager and is used by a text service to create and manipulate compositions. An instance of this interface is provided by ITfContext::QueryInterface with IID_ITfContextComposition.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcontextcomposition
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfContextComposition extends IUnknown {
    /**
     * The interface identifier for ITfContextComposition
     * @type {Guid}
     */
    static IID := Guid("{d40c8aae-ac92-4fc7-9a11-0ee0e23aa39b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfContextComposition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartComposition : IntPtr
        EnumCompositions : IntPtr
        FindComposition  : IntPtr
        TakeOwnership    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfContextComposition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfContextComposition::StartComposition method
     * @remarks
     * If the context owner has installed a context owner composition advise sink, the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontextownercompositionsink-onstartcomposition">ITfContextOwnerCompositionSink::OnStartComposition</a> method is called. If the advise sink rejects the new composition, this method returns S_OK but <i>ppComposition</i> is set to <b>NULL</b>.
     * 
     * Any text covered by <i>pCompositionRange</i> receives the GUID_PROP_COMPOSING property.
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pCompositionRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that specifies the text that the composition initially covers.
     * @param {ITfCompositionSink} pSink Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionsink">ITfCompositionSink</a> object that receives composition event notifications. This parameter is optional and can be <b>NULL</b>. If supplied, the object is released when the composition is terminated.
     * @returns {ITfComposition} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfComposition</a> interface pointer that receives the new composition object. This parameter receives <b>NULL</b> if the context owner rejects the composition.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-startcomposition
     */
    StartComposition(ecWrite, pCompositionRange, pSink) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pCompositionRange, "ptr", pSink, "ptr*", &ppComposition := 0, "HRESULT")
        return ITfComposition(ppComposition)
    }

    /**
     * ITfContextComposition::EnumCompositions method
     * @returns {IEnumITfCompositionView} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumitfcompositionview">IEnumITfCompositionView</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-enumcompositions
     */
    EnumCompositions() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumITfCompositionView(ppEnum)
    }

    /**
     * ITfContextComposition::FindComposition method
     * @param {Integer} ecRead Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pTestRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that specifies the range to search. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the enumerator will contain all compositions in the edit context.
     * @returns {IEnumITfCompositionView} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumitfcompositionview">IEnumITfCompositionView</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-findcomposition
     */
    FindComposition(ecRead, pTestRange) {
        result := ComCall(5, this, "uint", ecRead, "ptr", pTestRange, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumITfCompositionView(ppEnum)
    }

    /**
     * ITfContextComposition::TakeOwnership method
     * @param {Integer} ecWrite Not used.
     * @param {ITfCompositionView} pComposition Not used.
     * @param {ITfCompositionSink} pSink Not used.
     * @returns {ITfComposition} Not used.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-takeownership
     */
    TakeOwnership(ecWrite, pComposition, pSink) {
        result := ComCall(6, this, "uint", ecWrite, "ptr", pComposition, "ptr", pSink, "ptr*", &ppComposition := 0, "HRESULT")
        return ITfComposition(ppComposition)
    }

    Query(iid) {
        if (ITfContextComposition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartComposition := CallbackCreate(GetMethod(implObj, "StartComposition"), flags, 5)
        this.vtbl.EnumCompositions := CallbackCreate(GetMethod(implObj, "EnumCompositions"), flags, 2)
        this.vtbl.FindComposition := CallbackCreate(GetMethod(implObj, "FindComposition"), flags, 4)
        this.vtbl.TakeOwnership := CallbackCreate(GetMethod(implObj, "TakeOwnership"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartComposition)
        CallbackFree(this.vtbl.EnumCompositions)
        CallbackFree(this.vtbl.FindComposition)
        CallbackFree(this.vtbl.TakeOwnership)
    }
}
