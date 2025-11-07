#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFeatureEvent.ahk

/**
 * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidXDSEvent interface is used to receive events from the MSVidXDS object.This interface is an outgoing connection-point interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidXDSEvent)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidxdsevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidXDSEvent extends IMSVidFeatureEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidXDSEvent
     * @type {Guid}
     */
    static IID => Guid("{6db2317d-3b23-41ec-ba4b-701f407eaf3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RatingChange"]

    /**
     * 
     * @param {Integer} PrevRatingSystem 
     * @param {Integer} PrevLevel 
     * @param {Integer} PrevAttributes 
     * @param {Integer} NewRatingSystem 
     * @param {Integer} NewLevel 
     * @param {Integer} NewAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidxdsevent-ratingchange
     */
    RatingChange(PrevRatingSystem, PrevLevel, PrevAttributes, NewRatingSystem, NewLevel, NewAttributes) {
        result := ComCall(8, this, "int", PrevRatingSystem, "int", PrevLevel, "int", PrevAttributes, "int", NewRatingSystem, "int", NewLevel, "int", NewAttributes, "HRESULT")
        return result
    }
}
