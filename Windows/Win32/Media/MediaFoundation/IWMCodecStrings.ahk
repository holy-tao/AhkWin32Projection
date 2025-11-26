#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves names and descriptive strings for codecs and formats.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecstrings
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecStrings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecStrings
     * @type {Guid}
     */
    static IID => Guid("{a7b2504b-e58a-47fb-958b-cac7165a057d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDescription"]

    /**
     * Retrieves the name of a codec.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to the output media type. If <b>NULL</b>, the codec will use the media type that is currently set.
     * @param {Integer} cchLength Size of szName buffer in wide characters.
     * @param {PWSTR} szName Address of the wide-character buffer that receives the name. If <b>NULL</b>, pcchLength receives the required length.
     * @param {Pointer<Integer>} pcchLength Pointer to the required buffer length in wide characters, including the null terminating character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecstrings-getname
     */
    GetName(pmt, cchLength, szName, pcchLength) {
        szName := szName is String ? StrPtr(szName) : szName

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pmt, "uint", cchLength, "ptr", szName, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * Retrieves the description of an output format.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to the output media type. If <b>NULL</b>, the codec will use the media type that is currently set.
     * @param {Integer} cchLength Size of szDescription buffer, in wide characters.
     * @param {PWSTR} szDescription Address of the wide-character buffer that receives the description. If <b>NULL</b>, pcchLength receives the required length.
     * @param {Pointer<Integer>} pcchLength Pointer to the required buffer length in wide characters, including the null terminating character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecstrings-getdescription
     */
    GetDescription(pmt, cchLength, szDescription, pcchLength) {
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pmt, "uint", cchLength, "ptr", szDescription, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }
}
