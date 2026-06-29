#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import ".\IEnumTfRanges.ahk" { IEnumTfRanges }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITfReadOnlyProperty interface is implemented by the TSF manager and used by an application or text service to obtain property data.
 * @remarks
 * An instance of this interface is obtained by using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getappproperty">ITfContext::GetAppProperty</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-trackproperties">ITfContext::TrackProperties</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfreadonlyproperty
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfReadOnlyProperty extends IUnknown {
    /**
     * The interface identifier for ITfReadOnlyProperty
     * @type {Guid}
     */
    static IID := Guid("{17d49a3d-f8b8-4b2f-b254-52319dd64c53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfReadOnlyProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetType    : IntPtr
        EnumRanges : IntPtr
        GetValue   : IntPtr
        GetContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfReadOnlyProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfReadOnlyProperty::GetType method
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, Guid.Ptr, pguid, "HRESULT")
        return pguid
    }

    /**
     * ITfReadOnlyProperty::EnumRanges method
     * @remarks
     * <b>Note:</b> If an application does not implement <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-findnextattrtransition">ITextStoreACP::FindNextAttrTransition</a>, <b>ITfReadOnlyProperty::EnumRanges</b> fails with E_FAIL.
     * 
     * The enumerator obtained by this method will contain a range for each unique value, including empty values, of the specified property. For example, a hypothetical color property can be applied to the following marked up text:
     * 
     * 
     * ``` syntax
     * 
     * COLOR:      RR      GGGGGGGG
     * TEXT:  this is some colored text
     * 
     * ```
     * 
     * When <b>ITfReadOnlyProperty::EnumRanges</b> is called with <i>pTargetRange</i> set to this range, the enumerator will contain five ranges.
     * 
     * <table>
     * <tr>
     * <th>Range Index</th>
     * <th>Color Property Value</th>
     * <th>Range Text</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>&lt;empty&gt;</td>
     * <td>"this "</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>R</td>
     * <td>"is"</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>&lt;empty&gt;</td>
     * <td>" some "</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>G</td>
     * <td>"colored "</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>&lt;empty&gt;</td>
     * <td>"text"</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>pTargetRange</i> is <b>NULL</b>, then the enumerator will begin and end with the first and last range that contains a non-empty property value in the context. Specifying <b>NULL</b> for <i>pTargetRange</i> in the above example would result in an enumerator with three ranges.
     * 
     * <table>
     * <tr>
     * <th>Range Index</th>
     * <th>Color Property Value</th>
     * <th>Text Within Range</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>R</td>
     * <td>"is"</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>&lt;empty&gt;</td>
     * <td>" some "</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>G</td>
     * <td>"colored "</td>
     * </tr>
     * </table>
     *  
     * 
     * The enumerated ranges will begin and end with the start and end anchors of <i>pTargetRange</i>, even if either anchor is positioned in the middle of a property.
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pTargetRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that specifies the range to scan for unique property values. This parameter is optional and can be <b>NULL</b>. For more information, see the Remarks section.
     * @returns {IEnumTfRanges} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfranges">IEnumTfRanges</a> interface pointer that receives the enumerator object. The caller must release this object when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-enumranges
     */
    EnumRanges(ec, pTargetRange) {
        result := ComCall(4, this, "uint", ec, "ptr*", &ppEnum := 0, "ptr", pTargetRange, "HRESULT")
        return IEnumTfRanges(ppEnum)
    }

    /**
     * ITfReadOnlyProperty::GetValue method
     * @remarks
     * If the property has no value over <i>pRange</i>, <i>pRange</i> contains more than one value for the property or the property does not completely cover <i>pRange</i>, <i>pvarValue</i> receives a VT_EMPTY value and the method returns S_FALSE.
     * 
     * 
     * ``` syntax
     * 
     * COLOR:      RR      GGGGGGGG
     * TEXT:  this is some colored text
     *     range--&gt;||&lt;-
     * 
     * ```
     * 
     * 
     * ``` syntax
     * 
     * COLOR:      RR      GGGGGGGG
     * TEXT:  this is some colored text
     *     range--&gt;|    |&lt;-
     * 
     * ```
     * 
     * 
     * ``` syntax
     * 
     * COLOR:      RR      GGGGGGGG
     * TEXT:  this is some colored text
     *     range--&gt;|             |&lt;-
     * 
     * ```
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that specifies the range to obtain the property for.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> value that receives the property value. The data type and contents of this value is defined by the property owner and must be recognized by the caller in order to use this value. The caller must release this data, when it is no longer required, by passing this value to the <b>VariantClear</b> API.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-getvalue
     */
    GetValue(ec, pRange) {
        pvarValue := VARIANT()
        result := ComCall(5, this, "uint", ec, "ptr", pRange, VARIANT.Ptr, pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * ITfReadOnlyProperty::GetContext method
     * @returns {ITfContext} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface pointer that receives the context object. The caller must release this object when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-getcontext
     */
    GetContext() {
        result := ComCall(6, this, "ptr*", &ppContext := 0, "HRESULT")
        return ITfContext(ppContext)
    }

    Query(iid) {
        if (ITfReadOnlyProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.EnumRanges := CallbackCreate(GetMethod(implObj, "EnumRanges"), flags, 4)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 4)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.EnumRanges)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.GetContext)
    }
}
