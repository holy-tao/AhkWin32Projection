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
     * Retrieves the number of protocols supported by the network scheme plug-in.
     * @returns {Integer} Receives the number of protocols.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetschemehandlerconfig-getnumberofsupportedprotocols
     */
    GetNumberOfSupportedProtocols() {
        result := ComCall(3, this, "uint*", &pcProtocols := 0, "HRESULT")
        return pcProtocols
    }

    /**
     * Retrieves a supported protocol by index.
     * @param {Integer} nProtocolIndex Zero-based index of the protocol to retrieve. To get the number of supported protocols, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-getnumberofsupportedprotocols">IMFNetSchemeHandlerConfig::GetNumberOfSupportedProtocols</a>.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetsource_protocol_type">MFNETSOURCE_PROTOCOL_TYPE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetschemehandlerconfig-getsupportedprotocoltype
     */
    GetSupportedProtocolType(nProtocolIndex) {
        result := ComCall(4, this, "uint", nProtocolIndex, "int*", &pnProtocolType := 0, "HRESULT")
        return pnProtocolType
    }

    /**
     * Not implemented in this release.
     * @returns {HRESULT} This method returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetschemehandlerconfig-resetprotocolrolloversettings
     */
    ResetProtocolRolloverSettings() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
