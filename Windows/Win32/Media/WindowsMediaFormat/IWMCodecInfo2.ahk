#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk
#Include .\IWMCodecInfo.ahk

/**
 * The IWMCodecInfo2 interface manages the retrieval of information about codecs. To access it, call QueryInterface on a profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcodecinfo2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo2 extends IWMCodecInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecInfo2
     * @type {Guid}
     */
    static IID => Guid("{aa65e273-b686-4056-91ec-dd768d4df710}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecName", "GetCodecFormatDesc"]

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {PWSTR} wszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo2-getcodecname
     */
    GetCodecName(guidType, dwCodecIndex, wszName, pcchName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", wszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {Integer} dwFormatIndex 
     * @param {PWSTR} wszDesc 
     * @param {Pointer<Integer>} pcchDesc 
     * @returns {IWMStreamConfig} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo2-getcodecformatdesc
     */
    GetCodecFormatDesc(guidType, dwCodecIndex, dwFormatIndex, wszDesc, pcchDesc) {
        wszDesc := wszDesc is String ? StrPtr(wszDesc) : wszDesc

        pcchDescMarshal := pcchDesc is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr*", &ppIStreamConfig := 0, "ptr", wszDesc, pcchDescMarshal, pcchDesc, "HRESULT")
        return IWMStreamConfig(ppIStreamConfig)
    }
}
