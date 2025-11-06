#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMLanguageList interface manages a list of languages supported by an ASF file.
 * @remarks
 * 
  * This interface provides support for referencing languages by a string compliant with RFC 1766 – Tags for the Identification of Languages. Other interfaces in this SDK refer to the languages supported in an ASF file by language index. A language index is assigned to every language added to the language list.
  * 
  * This interface manages the list of languages supported for the file. Individual features of the file may not support all of the languages in the list. When selecting a language for playback of an output associated with a set of streams that are mutually exclusive by language, you must get the languages that are supported in that mutual exclusion object. You can retrieve the languages supported for a particular output by using the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderadvanced4">IWMReaderAdvanced4</a> interface.
  * 
  * When using this interface to add metadata in multiple languages to an MP3 file, only the first half of the language string is important. For example, the RFC 1766 identifier "en-us" designates English in the region of the United States. When written to an MP3 file, the identifier would be "en" without a regional designation.
  * 
  * For a list of common RFC 1766-compliant language identifiers, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/language-strings">Language Strings</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmlanguagelist
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMLanguageList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMLanguageList
     * @type {Guid}
     */
    static IID => Guid("{df683f00-2d49-4d8e-92b7-fb19f6a0dc57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLanguageCount", "GetLanguageDetails", "AddLanguageByRFC1766String"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlanguagelist-getlanguagecount
     */
    GetLanguageCount() {
        result := ComCall(3, this, "ushort*", &pwCount := 0, "HRESULT")
        return pwCount
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszLanguageString 
     * @param {Pointer<Integer>} pcchLanguageStringLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlanguagelist-getlanguagedetails
     */
    GetLanguageDetails(wIndex, pwszLanguageString, pcchLanguageStringLength) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        pcchLanguageStringLengthMarshal := pcchLanguageStringLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ushort", wIndex, "ptr", pwszLanguageString, pcchLanguageStringLengthMarshal, pcchLanguageStringLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszLanguageString 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlanguagelist-addlanguagebyrfc1766string
     */
    AddLanguageByRFC1766String(pwszLanguageString) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        result := ComCall(5, this, "ptr", pwszLanguageString, "ushort*", &pwIndex := 0, "HRESULT")
        return pwIndex
    }
}
