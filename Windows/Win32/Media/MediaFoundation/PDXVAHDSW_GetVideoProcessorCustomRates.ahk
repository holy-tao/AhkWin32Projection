#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXVAHD_CUSTOM_RATE_DATA.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the custom rates that a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor supports.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcustomrates
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PDXVAHDSW_GetVideoProcessorCustomRates extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hDevice 
     * @param {Pointer<Guid>} pVPGuid 
     * @param {Integer} Count 
     * @returns {DXVAHD_CUSTOM_RATE_DATA} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hDevice, pVPGuid, Count) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        pRates := DXVAHD_CUSTOM_RATE_DATA()
        result := ComCall(3, this, "ptr", hDevice, "ptr", pVPGuid, "uint", Count, "ptr", pRates, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRates
    }
}
