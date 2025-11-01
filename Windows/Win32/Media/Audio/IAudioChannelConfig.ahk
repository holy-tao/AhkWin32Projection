#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioChannelConfig interface provides access to a hardware channel-configuration control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiochannelconfig
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioChannelConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioChannelConfig
     * @type {Guid}
     */
    static IID => Guid("{bb11c46f-ec28-493c-b88a-5db88062ce98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetChannelConfig", "GetChannelConfig"]

    /**
     * 
     * @param {Integer} dwConfig 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiochannelconfig-setchannelconfig
     */
    SetChannelConfig(dwConfig, pguidEventContext) {
        result := ComCall(3, this, "uint", dwConfig, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiochannelconfig-getchannelconfig
     */
    GetChannelConfig(pdwConfig) {
        result := ComCall(4, this, "uint*", pdwConfig, "HRESULT")
        return result
    }
}
