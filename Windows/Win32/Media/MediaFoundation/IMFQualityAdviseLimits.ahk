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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaximumDropMode", "GetMinimumQualityLevel"]

    /**
     * 
     * @param {Pointer<Integer>} peDropMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadviselimits-getmaximumdropmode
     */
    GetMaximumDropMode(peDropMode) {
        peDropModeMarshal := peDropMode is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, peDropModeMarshal, peDropMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peQualityLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadviselimits-getminimumqualitylevel
     */
    GetMinimumQualityLevel(peQualityLevel) {
        peQualityLevelMarshal := peQualityLevel is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, peQualityLevelMarshal, peQualityLevel, "HRESULT")
        return result
    }
}
