#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMTranscryptor.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMTranscryptor2 extends IWMDRMTranscryptor{
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
     * 
     * @param {Integer} cnsStartTime 
     * @param {Integer} cnsDuration 
     * @param {Float} flRate 
     * @param {BOOL} fIncludeFileHeader 
     * @returns {HRESULT} 
     */
    SeekEx(cnsStartTime, cnsDuration, flRate, fIncludeFileHeader) {
        result := ComCall(7, this, "uint", cnsStartTime, "uint", cnsDuration, "float", flRate, "int", fIncludeFileHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    ZeroAdjustTimestamps(fEnable) {
        result := ComCall(8, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pcnsTime 
     * @returns {HRESULT} 
     */
    GetSeekStartTime(pcnsTime) {
        result := ComCall(9, this, "uint*", pcnsTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pcnsDuration 
     * @returns {HRESULT} 
     */
    GetDuration(pcnsDuration) {
        result := ComCall(10, this, "uint*", pcnsDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
