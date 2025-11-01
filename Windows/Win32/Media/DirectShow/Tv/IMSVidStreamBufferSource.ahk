#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFilePlayback.ahk

/**
 * The IMSVidStreamBufferSource interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSource extends IMSVidFilePlayback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSource
     * @type {Guid}
     */
    static IID => Guid("{eb0c8cf9-6950-4772-87b1-47d11cf3a02f}")

    /**
     * The class identifier for MSVidStreamBufferSource
     * @type {Guid}
     */
    static CLSID => Guid("{ad8e510d-217f-409b-8076-29c5e73b98e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Start", "get_RecordingAttribute", "CurrentRatings", "MaxRatingsLevel", "put_BlockUnrated", "put_UnratedDelay", "get_SBESource"]

    /**
     * 
     * @param {Pointer<Integer>} lStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-get_start
     */
    get_Start(lStart) {
        result := ComCall(34, this, "int*", lStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pRecordingAttribute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-get_recordingattribute
     */
    get_RecordingAttribute(pRecordingAttribute) {
        result := ComCall(35, this, "ptr*", pRecordingAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEnSystem 
     * @param {Pointer<Integer>} pEnRating 
     * @param {Pointer<Integer>} pBfEnAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-currentratings
     */
    CurrentRatings(pEnSystem, pEnRating, pBfEnAttr) {
        result := ComCall(36, this, "int*", pEnSystem, "int*", pEnRating, "int*", pBfEnAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enRating 
     * @param {Integer} lbfEnAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-maxratingslevel
     */
    MaxRatingsLevel(enSystem, enRating, lbfEnAttr) {
        result := ComCall(37, this, "int", enSystem, "int", enRating, "int", lbfEnAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBlock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-put_blockunrated
     */
    put_BlockUnrated(bBlock) {
        result := ComCall(38, this, "short", bBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-put_unrateddelay
     */
    put_UnratedDelay(dwDelay) {
        result := ComCall(39, this, "int", dwDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} sbeFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-get_sbesource
     */
    get_SBESource(sbeFilter) {
        result := ComCall(40, this, "ptr*", sbeFilter, "HRESULT")
        return result
    }
}
