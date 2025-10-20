#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries an object for the number of quality modes it supports.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfqualityadviselimits
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFQualityAdviseLimits extends IUnknown{
    /**
     * The interface identifier for IMFQualityAdviseLimits
     * @type {Guid}
     */
    static IID => Guid("{dfcd8e4d-30b5-4567-acaa-8eb5b7853dc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} peDropMode 
     * @returns {HRESULT} 
     */
    GetMaximumDropMode(peDropMode) {
        result := ComCall(3, this, "int*", peDropMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peQualityLevel 
     * @returns {HRESULT} 
     */
    GetMinimumQualityLevel(peQualityLevel) {
        result := ComCall(4, this, "int*", peQualityLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
