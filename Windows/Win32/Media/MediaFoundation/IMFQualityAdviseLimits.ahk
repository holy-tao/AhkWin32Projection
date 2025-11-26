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
     * Gets the maximum drop mode.
     * @returns {Integer} Receives the maximum drop mode, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_drop_mode">MF_QUALITY_DROP_MODE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadviselimits-getmaximumdropmode
     */
    GetMaximumDropMode() {
        result := ComCall(3, this, "int*", &peDropMode := 0, "HRESULT")
        return peDropMode
    }

    /**
     * Gets the minimum quality level that is supported by the component.
     * @returns {Integer} Receives the minimum quality level, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_level">MF_QUALITY_LEVEL</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadviselimits-getminimumqualitylevel
     */
    GetMinimumQualityLevel() {
        result := ComCall(4, this, "int*", &peQualityLevel := 0, "HRESULT")
        return peQualityLevel
    }
}
