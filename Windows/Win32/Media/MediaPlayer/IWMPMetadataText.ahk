#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPMetadataText interface provides methods for retrieving information about complex textual metadata attributes.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmetadatatext
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMetadataText extends IDispatch{
    /**
     * The interface identifier for IWMPMetadataText
     * @type {Guid}
     */
    static IID => Guid("{769a72db-13d2-45e2-9c48-53ca9d5b7450}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_description(pbstrDescription) {
        result := ComCall(7, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     */
    get_text(pbstrText) {
        result := ComCall(8, this, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
