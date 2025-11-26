#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPClosedCaption interface provides a way to include captions with a digital media file. The captioning text is in a Synchronized Accessible Media Interchange (SAMI) file.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpclosedcaption
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPClosedCaption extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPClosedCaption
     * @type {Guid}
     */
    static IID => Guid("{4f2df574-c588-11d3-9ed0-00c04fb6e937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SAMIStyle", "put_SAMIStyle", "get_SAMILang", "put_SAMILang", "get_SAMIFileName", "put_SAMIFileName", "get_captioningId", "put_captioningId"]

    /**
     */
    SAMIStyle {
        get => this.get_SAMIStyle()
        set => this.put_SAMIStyle(value)
    }

    /**
     */
    SAMILang {
        get => this.get_SAMILang()
        set => this.put_SAMILang(value)
    }

    /**
     */
    SAMIFileName {
        get => this.get_SAMIFileName()
        set => this.put_SAMIFileName(value)
    }

    /**
     */
    captioningId {
        get => this.get_captioningId()
        set => this.put_captioningId(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSAMIStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_samistyle
     */
    get_SAMIStyle(pbstrSAMIStyle) {
        result := ComCall(7, this, "ptr", pbstrSAMIStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSAMIStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_samistyle
     */
    put_SAMIStyle(bstrSAMIStyle) {
        bstrSAMIStyle := bstrSAMIStyle is String ? BSTR.Alloc(bstrSAMIStyle).Value : bstrSAMIStyle

        result := ComCall(8, this, "ptr", bstrSAMIStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSAMILang 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_samilang
     */
    get_SAMILang(pbstrSAMILang) {
        result := ComCall(9, this, "ptr", pbstrSAMILang, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSAMILang 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_samilang
     */
    put_SAMILang(bstrSAMILang) {
        bstrSAMILang := bstrSAMILang is String ? BSTR.Alloc(bstrSAMILang).Value : bstrSAMILang

        result := ComCall(10, this, "ptr", bstrSAMILang, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSAMIFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_samifilename
     */
    get_SAMIFileName(pbstrSAMIFileName) {
        result := ComCall(11, this, "ptr", pbstrSAMIFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSAMIFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_samifilename
     */
    put_SAMIFileName(bstrSAMIFileName) {
        bstrSAMIFileName := bstrSAMIFileName is String ? BSTR.Alloc(bstrSAMIFileName).Value : bstrSAMIFileName

        result := ComCall(12, this, "ptr", bstrSAMIFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCaptioningID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_captioningid
     */
    get_captioningId(pbstrCaptioningID) {
        result := ComCall(13, this, "ptr", pbstrCaptioningID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCaptioningID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_captioningid
     */
    put_captioningId(bstrCaptioningID) {
        bstrCaptioningID := bstrCaptioningID is String ? BSTR.Alloc(bstrCaptioningID).Value : bstrCaptioningID

        result := ComCall(14, this, "ptr", bstrCaptioningID, "HRESULT")
        return result
    }
}
