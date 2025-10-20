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
     * 
     * @param {Pointer<UInt32>} pcCodecInfos 
     * @returns {HRESULT} 
     */
    GetCodecInfoCount(pcCodecInfos) {
        result := ComCall(15, this, "uint*", pcCodecInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<UInt16>} pcchName 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt16>} pcchDescription 
     * @param {PWSTR} pwszDescription 
     * @param {Pointer<Int32>} pCodecType 
     * @param {Pointer<UInt16>} pcbCodecInfo 
     * @param {Pointer<Byte>} pbCodecInfo 
     * @returns {HRESULT} 
     */
    GetCodecInfo(wIndex, pcchName, pwszName, pcchDescription, pwszDescription, pCodecType, pcbCodecInfo, pbCodecInfo) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(16, this, "uint", wIndex, "ushort*", pcchName, "ptr", pwszName, "ushort*", pcchDescription, "ptr", pwszDescription, "int*", pCodecType, "ushort*", pcbCodecInfo, "char*", pbCodecInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
