#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAudioElementFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAudioElementFactory
     * @type {Guid}
     */
    static IID => Guid("{305107eb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAudioElementFactory
     * @type {Guid}
     */
    static CLSID => Guid("{305107ec-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["create"]

    /**
     * 
     * @param {VARIANT} src 
     * @param {Pointer<IHTMLAudioElement>} __MIDL__IHTMLAudioElementFactory0000 
     * @returns {HRESULT} 
     */
    create(src, __MIDL__IHTMLAudioElementFactory0000) {
        result := ComCall(7, this, "ptr", src, "ptr*", __MIDL__IHTMLAudioElementFactory0000, "HRESULT")
        return result
    }
}
