#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\DxMediaObjects\DMO_MEDIA_TYPE.ahk" { DMO_MEDIA_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves names and descriptive strings for codecs and formats.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecstrings
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMCodecStrings extends IUnknown {
    /**
     * The interface identifier for IWMCodecStrings
     * @type {Guid}
     */
    static IID := Guid("{a7b2504b-e58a-47fb-958b-cac7165a057d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMCodecStrings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName        : IntPtr
        GetDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMCodecStrings.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecstrings-getname
     */
    GetName(pmt, cchLength, szName, pcchLength) {
        szName := szName is String ? StrPtr(szName) : szName

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, DMO_MEDIA_TYPE.Ptr, pmt, "uint", cchLength, "ptr", szName, pcchLengthMarshal, pcchLength, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecstrings-getdescription
     */
    GetDescription(pmt, cchLength, szDescription, pcchLength) {
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, DMO_MEDIA_TYPE.Ptr, pmt, "uint", cchLength, "ptr", szDescription, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMCodecStrings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 5)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetDescription)
    }
}
