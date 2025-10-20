#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Int32>} pprgInputScopes 
     * @param {Pointer<UInt32>} pcCount 
     * @returns {HRESULT} 
     */
    GetInputScopes(pprgInputScopes, pcCount) {
        result := ComCall(3, this, "int*", pprgInputScopes, "uint*", pcCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppbstrPhrases 
     * @param {Pointer<UInt32>} pcCount 
     * @returns {HRESULT} 
     */
    GetPhrase(ppbstrPhrases, pcCount) {
        result := ComCall(4, this, "ptr", ppbstrPhrases, "uint*", pcCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRegExp 
     * @returns {HRESULT} 
     */
    GetRegularExpression(pbstrRegExp) {
        result := ComCall(5, this, "ptr", pbstrRegExp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSRGS 
     * @returns {HRESULT} 
     */
    GetSRGS(pbstrSRGS) {
        result := ComCall(6, this, "ptr", pbstrSRGS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrXML 
     * @returns {HRESULT} 
     */
    GetXML(pbstrXML) {
        result := ComCall(7, this, "ptr", pbstrXML, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
