#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentStatistics.ahk

/**
 * Describes how the system displayed an instance of a particular piece of content within a particular independent-flip present.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-iindependentflipframepresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IIndependentFlipFramePresentStatistics extends IPresentStatistics{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndependentFlipFramePresentStatistics
     * @type {Guid}
     */
    static IID => Guid("{8c93be27-ad94-4da0-8fd4-2413132d124e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputAdapterLUID", "GetOutputVidPnSourceId", "GetContentTag", "GetDisplayedTime", "GetPresentDuration"]

    /**
     * Gets the locally unique ID (LUID) that refers to the display adapter on which this independent-flip present occurred.
     * @returns {LUID} Type: **[LUID](/windows/win32/api/winnt/ns-winnt-luid)**
     * 
     * A locally unique ID (LUID) that refers to the display adapter on which this independent-flip present occurred.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getoutputadapterluid
     */
    GetOutputAdapterLUID() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * Gets an integer that identifies a video present source on the display adapter.
     * @returns {Integer} Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An integer that identifies a video present source on the display adapter.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getoutputvidpnsourceid
     */
    GetOutputVidPnSourceId() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Gets the tag of the content on which statistics are being reporting. (IIndependentFlipFramePresentStatistics::GetContentTag)
     * @returns {Pointer} Type: **[UINT_PTR_](/windows/desktop/winprog/windows-data-types)**
     * 
     * The tag of the content on which statistics are being reporting.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getcontenttag
     */
    GetContentTag() {
        result := ComCall(7, this, "ptr")
        return result
    }

    /**
     * Gets the time the present was displayed.
     * @returns {SystemInterruptTime} TYPE: **[SystemInterruptTime](/windows/win32/api/presentationtypes/ns-presentationtypes-systeminterrupttime)**
     * 
     * The time the present was displayed.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getdisplayedtime
     */
    GetDisplayedTime() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * Gets the actual amount of time the present was displayed.
     * @remarks
     * The actual present duration may be different from the preferred present duration requested by the application if the system decided not to honor the preferred duration. This usually happens either because it was not supported by the driver, or other content on screen influenced the system to go with another duration.
     * @returns {SystemInterruptTime} TYPE: **[SystemInterruptTime](/windows/win32/api/presentationtypes/ns-presentationtypes-systeminterrupttime)**
     * 
     * The actual amount of time the present was displayed.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getpresentduration
     */
    GetPresentDuration() {
        result := ComCall(9, this, "ptr")
        return result
    }
}
