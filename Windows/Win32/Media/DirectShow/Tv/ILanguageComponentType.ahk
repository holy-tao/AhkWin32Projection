#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IComponentType.ahk

/**
 * The ILanguageComponentType interface is implemented on LanguageComponentType objects. It provides methods that define the language of the stream content. Not all streams have a language component.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ILanguageComponentType)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nn-tuner-ilanguagecomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ILanguageComponentType extends IComponentType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageComponentType
     * @type {Guid}
     */
    static IID => Guid("{b874c8ba-0fa2-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for LanguageComponentType
     * @type {Guid}
     */
    static CLSID => Guid("{1be49f30-0e1b-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LangID", "put_LangID"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-ilanguagecomponenttype-get_langid
     */
    get_LangID() {
        result := ComCall(24, this, "int*", &LangID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LangID
    }

    /**
     * The put_LangID method specifies the LCID that identifies the language.
     * @remarks
     * The <i>LangID</i> parameter is a Win32 LCID. Use this method to set the language of an audio stream, for example when creating a new entry for the Guide Store database. Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponent-put_desclangid">IComponent::put_DescLangID</a> method to specify the language of the text description of the stream.
     * @param {Integer} LangID Specifies the LCID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-ilanguagecomponenttype-put_langid
     */
    put_LangID(LangID) {
        result := ComCall(25, this, "int", LangID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
