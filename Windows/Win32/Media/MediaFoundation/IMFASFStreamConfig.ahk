#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Configures the settings of a stream in an ASF file.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfstreamconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFStreamConfig extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFStreamConfig
     * @type {Guid}
     */
    static IID => Guid("{9e8ae8d2-dbbd-4200-9aca-06e6df484913}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamType", "GetStreamNumber", "SetStreamNumber", "GetMediaType", "SetMediaType", "GetPayloadExtensionCount", "GetPayloadExtension", "AddPayloadExtension", "RemoveAllPayloadExtensions", "Clone"]

    /**
     * 
     * @param {Pointer<Guid>} pguidStreamType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getstreamtype
     */
    GetStreamType(pguidStreamType) {
        result := ComCall(33, this, "ptr", pguidStreamType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getstreamnumber
     */
    GetStreamNumber() {
        result := ComCall(34, this, "ushort")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-setstreamnumber
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(35, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} ppIMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getmediatype
     */
    GetMediaType(ppIMediaType) {
        result := ComCall(36, this, "ptr*", ppIMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaType} pIMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-setmediatype
     */
    SetMediaType(pIMediaType) {
        result := ComCall(37, this, "ptr", pIMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcPayloadExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextensioncount
     */
    GetPayloadExtensionCount(pcPayloadExtensions) {
        result := ComCall(38, this, "ushort*", pcPayloadExtensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wPayloadExtensionNumber 
     * @param {Pointer<Guid>} pguidExtensionSystemID 
     * @param {Pointer<Integer>} pcbExtensionDataSize 
     * @param {Pointer<Integer>} pbExtensionSystemInfo 
     * @param {Pointer<Integer>} pcbExtensionSystemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextension
     */
    GetPayloadExtension(wPayloadExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        result := ComCall(39, this, "ushort", wPayloadExtensionNumber, "ptr", pguidExtensionSystemID, "ushort*", pcbExtensionDataSize, "char*", pbExtensionSystemInfo, "uint*", pcbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidExtensionSystemID 
     * @param {Integer} cbExtensionDataSize 
     * @param {Pointer<Integer>} pbExtensionSystemInfo 
     * @param {Integer} cbExtensionSystemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-addpayloadextension
     */
    AddPayloadExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        result := ComCall(40, this, "ptr", guidExtensionSystemID, "ushort", cbExtensionDataSize, "char*", pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-removeallpayloadextensions
     */
    RemoveAllPayloadExtensions() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamConfig>} ppIStreamConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-clone
     */
    Clone(ppIStreamConfig) {
        result := ComCall(42, this, "ptr*", ppIStreamConfig, "HRESULT")
        return result
    }
}
