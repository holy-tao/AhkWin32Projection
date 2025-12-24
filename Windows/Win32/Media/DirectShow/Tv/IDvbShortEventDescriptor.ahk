#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) short event descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbshorteventdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbShortEventDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbShortEventDescriptor
     * @type {Guid}
     */
    static IID => Guid("{b170be92-5b75-458e-9c6e-b0008231491a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetLanguageCode", "GetEventNameW", "GetTextW"]

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) short event descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB short event descriptors, this value is "0x4D".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) short event descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) short event descriptor.
     * @returns {Integer} Receives the language code. For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">this document</a>. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(5, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the event name in Unicode string format from a Digital Video Broadcast (DVB) short event descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the event name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-geteventnamew
     */
    GetEventNameW(convMode) {
        pbstrName := BSTR()
        result := ComCall(6, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the text that describes the event in Unicode string format from a Digital Video Broadcast (DVB) short event descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the event description text. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(7, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
