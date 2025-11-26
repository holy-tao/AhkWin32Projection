#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IComponentType.ahk

/**
 * The ILanguageComponentType interface is implemented on LanguageComponentType objects. It provides methods that define the language of the stream content. Not all streams have a language component.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ILanguageComponentType)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ilanguagecomponenttype
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilanguagecomponenttype-get_langid
     */
    get_LangID() {
        result := ComCall(24, this, "int*", &LangID := 0, "HRESULT")
        return LangID
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilanguagecomponenttype-put_langid
     */
    put_LangID(LangID) {
        result := ComCall(25, this, "int", LangID, "HRESULT")
        return result
    }
}
