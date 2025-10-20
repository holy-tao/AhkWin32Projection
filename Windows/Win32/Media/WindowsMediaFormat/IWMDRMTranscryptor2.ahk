#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMTranscryptor.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMTranscryptor2 extends IWMDRMTranscryptor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMTranscryptor2
     * @type {Guid}
     */
    static IID => Guid("{e0da439f-d331-496a-bece-18e5bac5dd23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SeekEx", "ZeroAdjustTimestamps", "GetSeekStartTime", "GetDuration"]

    /**
     * 
     * @param {Integer} cnsStartTime 
     * @param {Integer} cnsDuration 
     * @param {Float} flRate 
     * @param {BOOL} fIncludeFileHeader 
     * @returns {HRESULT} 
     */
    SeekEx(cnsStartTime, cnsDuration, flRate, fIncludeFileHeader) {
        result := ComCall(7, this, "uint", cnsStartTime, "uint", cnsDuration, "float", flRate, "int", fIncludeFileHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    ZeroAdjustTimestamps(fEnable) {
        result := ComCall(8, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcnsTime 
     * @returns {HRESULT} 
     */
    GetSeekStartTime(pcnsTime) {
        result := ComCall(9, this, "uint*", pcnsTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcnsDuration 
     * @returns {HRESULT} 
     */
    GetDuration(pcnsDuration) {
        result := ComCall(10, this, "uint*", pcnsDuration, "HRESULT")
        return result
    }
}
