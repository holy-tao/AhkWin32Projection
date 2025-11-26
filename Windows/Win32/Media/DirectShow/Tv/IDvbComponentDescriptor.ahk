#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Identifies the type of a Digital Video Broadcast (DVB) component stream and provides a text description of the component stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbcomponentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbComponentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbComponentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{91e405cf-80e7-457f-9096-1b9d1ce32141}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetStreamContent", "GetComponentType", "GetComponentTag", "GetLanguageCode", "GetTextW"]

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) component descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB component descriptors, this value is "0x50".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) component descriptor
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the stream content code for a Digital Video Broadcast (DVB) component descriptor.
     * @returns {Integer} Receives the stream content code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getstreamcontent
     */
    GetStreamContent() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the component type code for a Digital Video Broadcast (DVB) component descriptor.
     * @returns {Integer} Receives the component type code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getcomponenttype
     */
    GetComponentType() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the component tag from a DVB component descriptor. The component tag has the same value as the component_tag field in the stream identifier descriptor in the Program Specific Information (PSI) program map section for the component stream.
     * @returns {Integer} Receives the component tag.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) component descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code. For a list of language codes, refer to the <a href="http://www.sil.org/ISO639-3/codes.asp">ISO 639 Code Tables</a>. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(8, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the text describing the elementary stream, in Unicode string format, from a Digital Video Broadcast (DVB) component descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Receives the event description text. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(9, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
