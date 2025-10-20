#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides notifications for spatial audio clients to respond to changes in the state of an ISpatialAudioObjectRenderStream.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreamnotify
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStreamNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamNotify
     * @type {Guid}
     */
    static IID => Guid("{dddf83e6-68d7-4c70-883f-a1836afb4a50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAvailableDynamicObjectCountChange"]

    /**
     * 
     * @param {ISpatialAudioObjectRenderStreamBase} sender 
     * @param {Integer} hnsComplianceDeadlineTime 
     * @param {Integer} availableDynamicObjectCountChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreamnotify-onavailabledynamicobjectcountchange
     */
    OnAvailableDynamicObjectCountChange(sender, hnsComplianceDeadlineTime, availableDynamicObjectCountChange) {
        result := ComCall(3, this, "ptr", sender, "int64", hnsComplianceDeadlineTime, "uint", availableDynamicObjectCountChange, "HRESULT")
        return result
    }
}
