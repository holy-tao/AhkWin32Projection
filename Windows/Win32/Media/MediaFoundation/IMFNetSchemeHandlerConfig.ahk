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
     * 
     * @param {Pointer<UInt32>} pcProtocols 
     * @returns {HRESULT} 
     */
    GetNumberOfSupportedProtocols(pcProtocols) {
        result := ComCall(3, this, "uint*", pcProtocols, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nProtocolIndex 
     * @param {Pointer<Int32>} pnProtocolType 
     * @returns {HRESULT} 
     */
    GetSupportedProtocolType(nProtocolIndex, pnProtocolType) {
        result := ComCall(4, this, "uint", nProtocolIndex, "int*", pnProtocolType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetProtocolRolloverSettings() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
