#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMHeaderInfo.ahk" { IWMHeaderInfo }
#Import ".\WMT_CODEC_INFO_TYPE.ahk" { WMT_CODEC_INFO_TYPE }

/**
 * The IWMHeaderInfo2 interface exposes information about the codecs used to create the content in a file.The IWMHeaderInfo2 interface is implemented by the metadata editor object, the writer object, the reader object, and the synchronous reader object.
 * @remarks
 * For information about using the writer for metadata editing, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/to-edit-metadata-with-the-writer">To Edit Metadata with the Writer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMHeaderInfo2 extends IWMHeaderInfo {
    /**
     * The interface identifier for IWMHeaderInfo2
     * @type {Guid}
     */
    static IID := Guid("{15cf9781-454e-482e-b393-85fae487a810}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMHeaderInfo2 interfaces
    */
    struct Vtbl extends IWMHeaderInfo.Vtbl {
        GetCodecInfoCount : IntPtr
        GetCodecInfo      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMHeaderInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCodecInfoCount method retrieves the number of codecs for which information is available.
     * @remarks
     * Use this method, and <b>GetCodecInfo</b>, to enumerate through the codec information.
     * @returns {Integer} Pointer to a count of codecs for which information is available.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfocount
     */
    GetCodecInfoCount() {
        result := ComCall(15, this, "uint*", &pcCodecInfos := 0, "HRESULT")
        return pcCodecInfos
    }

    /**
     * The GetCodecInfo method retrieves information about a codec that is used to create the content of a file.
     * @remarks
     * You should make two calls to <b>GetCodecInfo</b>. On the first call, pass <b>NULL</b> for <i>pwszName</i>, <i>pwszDescription</i>, and <i>pbCodecInfo</i>. On return the values pointed to by <i>pcchName</i> and <i>pcchDescription</i> are set to the number of characters. These include the terminating <b>null</b> character, which is required to hold the name string in <i>pcchName</i> and the description string in <i>pcchDescription</i>. The value pointed to by <i>pcbCodecInfo</i> is set to the buffer size required to hold the codec information. With these sizes, you can allocate the required amount of memory to receive each value. Pass pointers to the buffers are <i>pwszName</i>, <i>pwszDescription</i>, and <i>pbCodecInfo</i> on the second call.
     * 
     * Use this method, and the <b>GetCodecInfoCount</b> method, to enumerate through the codec information.
     * @param {Integer} wIndex <b>DWORD</b> that contains the zero-based codec index.
     * @param {Pointer<Integer>} pcchName On input, pointer to the length of <i>pwszName</i> in wide characters. On output, pointer to a count of the characters that are used in <i>pwszName</i>.This includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string buffer into which the name of the codec is copied.
     * @param {Pointer<Integer>} pcchDescription On input, pointer to the length of <i>pwszDescription</i> in wide characters. On output, pointer to a count of the characters that are used in <i>pwszDescription</i>. This includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszDescription Pointer to a wide-character <b>null</b>-terminated string buffer into which the description of the codec is copied.
     * @param {Pointer<WMT_CODEC_INFO_TYPE>} pCodecType Pointer to one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_codec_info_type">WMT_CODEC_INFO_TYPE</a> enumeration type.
     * @param {Pointer<Integer>} pcbCodecInfo On input, pointer to the length of <i>pbCodecInfo</i>, in bytes. On output, pointer to a count of the bytes used in <i>pbCodecInfo</i>.
     * @param {Pointer<Integer>} pbCodecInfo Pointer to a byte array.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfo
     */
    GetCodecInfo(wIndex, pcchName, pwszName, pcchDescription, pwszDescription, pCodecType, pcbCodecInfo, pbCodecInfo) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"
        pcchDescriptionMarshal := pcchDescription is VarRef ? "ushort*" : "ptr"
        pCodecTypeMarshal := pCodecType is VarRef ? "int*" : "ptr"
        pcbCodecInfoMarshal := pcbCodecInfo is VarRef ? "ushort*" : "ptr"
        pbCodecInfoMarshal := pbCodecInfo is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "uint", wIndex, pcchNameMarshal, pcchName, "ptr", pwszName, pcchDescriptionMarshal, pcchDescription, "ptr", pwszDescription, pCodecTypeMarshal, pCodecType, pcbCodecInfoMarshal, pcbCodecInfo, pbCodecInfoMarshal, pbCodecInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMHeaderInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCodecInfoCount := CallbackCreate(GetMethod(implObj, "GetCodecInfoCount"), flags, 2)
        this.vtbl.GetCodecInfo := CallbackCreate(GetMethod(implObj, "GetCodecInfo"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCodecInfoCount)
        CallbackFree(this.vtbl.GetCodecInfo)
    }
}
