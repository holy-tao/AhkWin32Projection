#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEVRFilterConfig.ahk

/**
 * Configures the DirectShow Enhanced Video Renderer (EVR) filter.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-ievrfilterconfigex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IEVRFilterConfigEx extends IEVRFilterConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEVRFilterConfigEx
     * @type {Guid}
     */
    static IID => Guid("{aea36028-796d-454f-beee-b48071e24304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConfigPrefs", "GetConfigPrefs"]

    /**
     * 
     * @param {Integer} dwConfigFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfigex-setconfigprefs
     */
    SetConfigPrefs(dwConfigFlags) {
        result := ComCall(5, this, "uint", dwConfigFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfigex-getconfigprefs
     */
    GetConfigPrefs() {
        result := ComCall(6, this, "uint*", &pdwConfigFlags := 0, "HRESULT")
        return pdwConfigFlags
    }
}
