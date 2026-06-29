#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IComponentType.ahk" { IComponentType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ILanguageComponentType interface is implemented on LanguageComponentType objects. It provides methods that define the language of the stream content. Not all streams have a language component.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ILanguageComponentType)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ilanguagecomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ILanguageComponentType extends IComponentType {
    /**
     * The interface identifier for ILanguageComponentType
     * @type {Guid}
     */
    static IID := Guid("{b874c8ba-0fa2-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for LanguageComponentType
     * @type {Guid}
     */
    static CLSID := Guid("{1be49f30-0e1b-11d3-9d8e-00c04f72d980}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILanguageComponentType interfaces
    */
    struct Vtbl extends IComponentType.Vtbl {
        get_LangID : IntPtr
        put_LangID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILanguageComponentType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    LangID {
        get => this.get_LangID()
        set => this.put_LangID(value)
    }

    /**
     * The get_LangID method retrieves the LCID that identifies the language.
     * @remarks
     * The <i>pLangID</i> parameter is a pointer to a Win32 LCID. Use this method to determine the language of an audio stream. Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponent-get_desclangid">IComponent::get_DescLangID</a> to determine the language of the text description of the stream.
     * @returns {Integer} Pointer to a variable that receives the LCID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilanguagecomponenttype-get_langid
     */
    get_LangID() {
        result := ComCall(24, this, "int*", &LangID := 0, "HRESULT")
        return LangID
    }

    /**
     * The put_LangID method specifies the LCID that identifies the language.
     * @remarks
     * The <i>LangID</i> parameter is a Win32 LCID. Use this method to set the language of an audio stream, for example when creating a new entry for the Guide Store database. Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponent-put_desclangid">IComponent::put_DescLangID</a> method to specify the language of the text description of the stream.
     * @param {Integer} LangID Specifies the LCID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilanguagecomponenttype-put_langid
     */
    put_LangID(LangID) {
        result := ComCall(25, this, "int", LangID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILanguageComponentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LangID := CallbackCreate(GetMethod(implObj, "get_LangID"), flags, 2)
        this.vtbl.put_LangID := CallbackCreate(GetMethod(implObj, "put_LangID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LangID)
        CallbackFree(this.vtbl.put_LangID)
    }
}
