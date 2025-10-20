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
     * 
     * @param {Pointer<BSTR>} pbstrSAMIStyle 
     * @returns {HRESULT} 
     */
    get_SAMIStyle(pbstrSAMIStyle) {
        result := ComCall(7, this, "ptr", pbstrSAMIStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSAMIStyle 
     * @returns {HRESULT} 
     */
    put_SAMIStyle(bstrSAMIStyle) {
        bstrSAMIStyle := bstrSAMIStyle is String ? BSTR.Alloc(bstrSAMIStyle).Value : bstrSAMIStyle

        result := ComCall(8, this, "ptr", bstrSAMIStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSAMILang 
     * @returns {HRESULT} 
     */
    get_SAMILang(pbstrSAMILang) {
        result := ComCall(9, this, "ptr", pbstrSAMILang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSAMILang 
     * @returns {HRESULT} 
     */
    put_SAMILang(bstrSAMILang) {
        bstrSAMILang := bstrSAMILang is String ? BSTR.Alloc(bstrSAMILang).Value : bstrSAMILang

        result := ComCall(10, this, "ptr", bstrSAMILang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSAMIFileName 
     * @returns {HRESULT} 
     */
    get_SAMIFileName(pbstrSAMIFileName) {
        result := ComCall(11, this, "ptr", pbstrSAMIFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSAMIFileName 
     * @returns {HRESULT} 
     */
    put_SAMIFileName(bstrSAMIFileName) {
        bstrSAMIFileName := bstrSAMIFileName is String ? BSTR.Alloc(bstrSAMIFileName).Value : bstrSAMIFileName

        result := ComCall(12, this, "ptr", bstrSAMIFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCaptioningID 
     * @returns {HRESULT} 
     */
    get_captioningId(pbstrCaptioningID) {
        result := ComCall(13, this, "ptr", pbstrCaptioningID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCaptioningID 
     * @returns {HRESULT} 
     */
    put_captioningId(bstrCaptioningID) {
        bstrCaptioningID := bstrCaptioningID is String ? BSTR.Alloc(bstrCaptioningID).Value : bstrCaptioningID

        result := ComCall(14, this, "ptr", bstrCaptioningID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
