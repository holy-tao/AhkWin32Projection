#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMHeaderInfo.ahk

/**
 * The IWMHeaderInfo2 interface exposes information about the codecs used to create the content in a file.The IWMHeaderInfo2 interface is implemented by the metadata editor object, the writer object, the reader object, and the synchronous reader object.
 * @remarks
 * 
 * For information about using the writer for metadata editing, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/to-edit-metadata-with-the-writer">To Edit Metadata with the Writer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmheaderinfo2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMHeaderInfo2 extends IWMHeaderInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMHeaderInfo2
     * @type {Guid}
     */
    static IID => Guid("{15cf9781-454e-482e-b393-85fae487a810}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecInfoCount", "GetCodecInfo"]

    /**
     * The GetCodecInfoCount method retrieves the number of codecs for which information is available.
     * @returns {Integer} Pointer to a count of codecs for which information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfocount
     */
    GetCodecInfoCount() {
        result := ComCall(15, this, "uint*", &pcCodecInfos := 0, "HRESULT")
        return pcCodecInfos
    }

    /**
     * The GetCodecInfo method retrieves information about a codec that is used to create the content of a file.
     * @param {Integer} wIndex <b>DWORD</b>that contains the zero-based codec index.
     * @param {Pointer<Integer>} pcchName On input, pointer to the length of <i>pwszName</i> in wide characters. On output, pointer to a count of the characters that are used in <i>pwszName</i>.This includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string buffer into which the name of the codec is copied.
     * @param {Pointer<Integer>} pcchDescription On input, pointer to the length of <i>pwszDescription</i> in wide characters. On output, pointer to a count of the characters that are used in <i>pwszDescription</i>. This includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszDescription Pointer to a wide-character <b>null</b>-terminated string buffer into which the description of the codec is copied.
     * @param {Pointer<Integer>} pCodecType Pointer to one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_codec_info_type">WMT_CODEC_INFO_TYPE</a> enumeration type.
     * @param {Pointer<Integer>} pcbCodecInfo On input, pointer to the length of <i>pbCodecInfo</i>, in bytes. On output, pointer to a count of the bytes used in <i>pbCodecInfo</i>.
     * @param {Pointer<Integer>} pbCodecInfo Pointer to a byte array.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfo
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
}
