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
     * 
     * @param {Pointer<Guid>} pguidStreamType 
     * @returns {HRESULT} 
     */
    GetStreamType(pguidStreamType) {
        result := ComCall(33, this, "ptr", pguidStreamType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStreamNumber() {
        result := ComCall(34, this, "ushort")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(35, this, "ushort", wStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} ppIMediaType 
     * @returns {HRESULT} 
     */
    GetMediaType(ppIMediaType) {
        result := ComCall(36, this, "ptr", ppIMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} pIMediaType 
     * @returns {HRESULT} 
     */
    SetMediaType(pIMediaType) {
        result := ComCall(37, this, "ptr", pIMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pcPayloadExtensions 
     * @returns {HRESULT} 
     */
    GetPayloadExtensionCount(pcPayloadExtensions) {
        result := ComCall(38, this, "ushort*", pcPayloadExtensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wPayloadExtensionNumber 
     * @param {Pointer<Guid>} pguidExtensionSystemID 
     * @param {Pointer<UInt16>} pcbExtensionDataSize 
     * @param {Pointer<Byte>} pbExtensionSystemInfo 
     * @param {Pointer<UInt32>} pcbExtensionSystemInfo 
     * @returns {HRESULT} 
     */
    GetPayloadExtension(wPayloadExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        result := ComCall(39, this, "ushort", wPayloadExtensionNumber, "ptr", pguidExtensionSystemID, "ushort*", pcbExtensionDataSize, "char*", pbExtensionSystemInfo, "uint*", pcbExtensionSystemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidExtensionSystemID 
     * @param {Integer} cbExtensionDataSize 
     * @param {Pointer<Byte>} pbExtensionSystemInfo 
     * @param {Integer} cbExtensionSystemInfo 
     * @returns {HRESULT} 
     */
    AddPayloadExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        result := ComCall(40, this, "ptr", guidExtensionSystemID, "ushort", cbExtensionDataSize, "char*", pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllPayloadExtensions() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamConfig>} ppIStreamConfig 
     * @returns {HRESULT} 
     */
    Clone(ppIStreamConfig) {
        result := ComCall(42, this, "ptr", ppIStreamConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
