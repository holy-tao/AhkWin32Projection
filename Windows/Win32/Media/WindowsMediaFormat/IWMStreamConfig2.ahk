#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk

/**
 * The IWMStreamConfig2 interface manages the data unit extensions associated with a stream.IWMStreamConfig2 inherits from IWMStreamConfig. To obtain a pointer to IWMStreamConfig2, call the QueryInterface method of the IWMStreamConfig interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamconfig2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamConfig2 extends IWMStreamConfig{
    /**
     * The interface identifier for IWMStreamConfig2
     * @type {Guid}
     */
    static IID => Guid("{7688d8cb-fc0d-43bd-9459-5a8dec200cfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<Int32>} pnTransportType 
     * @returns {HRESULT} 
     */
    GetTransportType(pnTransportType) {
        result := ComCall(14, this, "int*", pnTransportType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nTransportType 
     * @returns {HRESULT} 
     */
    SetTransportType(nTransportType) {
        result := ComCall(15, this, "int", nTransportType, "int")
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
    AddDataUnitExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        result := ComCall(16, this, "ptr", guidExtensionSystemID, "ushort", cbExtensionDataSize, "char*", pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pcDataUnitExtensions 
     * @returns {HRESULT} 
     */
    GetDataUnitExtensionCount(pcDataUnitExtensions) {
        result := ComCall(17, this, "ushort*", pcDataUnitExtensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wDataUnitExtensionNumber 
     * @param {Pointer<Guid>} pguidExtensionSystemID 
     * @param {Pointer<UInt16>} pcbExtensionDataSize 
     * @param {Pointer<Byte>} pbExtensionSystemInfo 
     * @param {Pointer<UInt32>} pcbExtensionSystemInfo 
     * @returns {HRESULT} 
     */
    GetDataUnitExtension(wDataUnitExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        result := ComCall(18, this, "ushort", wDataUnitExtensionNumber, "ptr", pguidExtensionSystemID, "ushort*", pcbExtensionDataSize, "char*", pbExtensionSystemInfo, "uint*", pcbExtensionSystemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllDataUnitExtensions() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
