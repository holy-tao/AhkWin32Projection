#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfInputScope interface is used by the text input processors to get the InputScope value that represents a document context associated with a window.
 * @remarks
 * 
 * To use this interface with window-less controls, an application has two options.
 * 
 * <ol>
 * <li><b>Make the application TSF-aware:  </b>A TSF-aware application must implement either <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontextowner">ITfContextOwner</a> to get a pointer to <b>ITfInputScope</b>.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/inputscope/nf-inputscope-setinputscopes">SetInputScopes</a>  This is not recommended, but if the application is not TSF-aware, there is no other way to maintain the association between the input scope and the application. In this case, the application must call SetInputScopes whenever focus changes among window-less controls.</li>
 * </ol>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//inputscope/nn-inputscope-itfinputscope
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputScope extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputScope
     * @type {Guid}
     */
    static IID => Guid("{fde1eaee-6924-4cdf-91e7-da38cff5559d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputScopes", "GetPhrase", "GetRegularExpression", "GetSRGS", "GetXML"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pprgInputScopes 
     * @param {Pointer<Integer>} pcCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getinputscopes
     */
    GetInputScopes(pprgInputScopes, pcCount) {
        pprgInputScopesMarshal := pprgInputScopes is VarRef ? "ptr*" : "ptr"
        pcCountMarshal := pcCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pprgInputScopesMarshal, pprgInputScopes, pcCountMarshal, pcCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<BSTR>>} ppbstrPhrases 
     * @param {Pointer<Integer>} pcCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getphrase
     */
    GetPhrase(ppbstrPhrases, pcCount) {
        ppbstrPhrasesMarshal := ppbstrPhrases is VarRef ? "ptr*" : "ptr"
        pcCountMarshal := pcCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ppbstrPhrasesMarshal, ppbstrPhrases, pcCountMarshal, pcCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getregularexpression
     */
    GetRegularExpression() {
        pbstrRegExp := BSTR()
        result := ComCall(5, this, "ptr", pbstrRegExp, "HRESULT")
        return pbstrRegExp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getsrgs
     */
    GetSRGS() {
        pbstrSRGS := BSTR()
        result := ComCall(6, this, "ptr", pbstrSRGS, "HRESULT")
        return pbstrSRGS
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getxml
     */
    GetXML() {
        pbstrXML := BSTR()
        result := ComCall(7, this, "ptr", pbstrXML, "HRESULT")
        return pbstrXML
    }
}
