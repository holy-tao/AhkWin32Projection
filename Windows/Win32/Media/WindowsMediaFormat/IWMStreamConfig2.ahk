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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransportType", "SetTransportType", "AddDataUnitExtension", "GetDataUnitExtensionCount", "GetDataUnitExtension", "RemoveAllDataUnitExtensions"]

    /**
     * 
     * @param {Pointer<Integer>} pnTransportType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-gettransporttype
     */
    GetTransportType(pnTransportType) {
        pnTransportTypeMarshal := pnTransportType is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pnTransportTypeMarshal, pnTransportType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nTransportType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-settransporttype
     */
    SetTransportType(nTransportType) {
        result := ComCall(15, this, "int", nTransportType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidExtensionSystemID 
     * @param {Integer} cbExtensionDataSize 
     * @param {Pointer<Integer>} pbExtensionSystemInfo 
     * @param {Integer} cbExtensionSystemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-adddataunitextension
     */
    AddDataUnitExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "ptr", guidExtensionSystemID, "ushort", cbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcDataUnitExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-getdataunitextensioncount
     */
    GetDataUnitExtensionCount(pcDataUnitExtensions) {
        pcDataUnitExtensionsMarshal := pcDataUnitExtensions is VarRef ? "ushort*" : "ptr"

        result := ComCall(17, this, pcDataUnitExtensionsMarshal, pcDataUnitExtensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wDataUnitExtensionNumber 
     * @param {Pointer<Guid>} pguidExtensionSystemID 
     * @param {Pointer<Integer>} pcbExtensionDataSize 
     * @param {Pointer<Integer>} pbExtensionSystemInfo 
     * @param {Pointer<Integer>} pcbExtensionSystemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-getdataunitextension
     */
    GetDataUnitExtension(wDataUnitExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        pcbExtensionDataSizeMarshal := pcbExtensionDataSize is VarRef ? "ushort*" : "ptr"
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"
        pcbExtensionSystemInfoMarshal := pcbExtensionSystemInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ushort", wDataUnitExtensionNumber, "ptr", pguidExtensionSystemID, pcbExtensionDataSizeMarshal, pcbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, pcbExtensionSystemInfoMarshal, pcbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-removealldataunitextensions
     */
    RemoveAllDataUnitExtensions() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
