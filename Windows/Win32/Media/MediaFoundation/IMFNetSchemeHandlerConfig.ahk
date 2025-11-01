#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures a network scheme plug-in.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetschemehandlerconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetSchemeHandlerConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetSchemeHandlerConfig
     * @type {Guid}
     */
    static IID => Guid("{7be19e73-c9bf-468a-ac5a-a5e8653bec87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberOfSupportedProtocols", "GetSupportedProtocolType", "ResetProtocolRolloverSettings"]

    /**
     * 
     * @param {Pointer<Integer>} pcProtocols 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-getnumberofsupportedprotocols
     */
    GetNumberOfSupportedProtocols(pcProtocols) {
        pcProtocolsMarshal := pcProtocols is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcProtocolsMarshal, pcProtocols, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nProtocolIndex 
     * @param {Pointer<Integer>} pnProtocolType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-getsupportedprotocoltype
     */
    GetSupportedProtocolType(nProtocolIndex, pnProtocolType) {
        pnProtocolTypeMarshal := pnProtocolType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", nProtocolIndex, pnProtocolTypeMarshal, pnProtocolType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-resetprotocolrolloversettings
     */
    ResetProtocolRolloverSettings() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
