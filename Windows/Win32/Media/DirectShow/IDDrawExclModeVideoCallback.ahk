#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDDrawExclModeVideoCallback interface is a callback interface for the IDDrawExclModeVideo interface.This callback interface enables applications to get synchronous notification about changes to the overlay position, size, visibility, and so on, so that the application can adjust its video visibility, size, and position. This avoids any color key flash at the beginning, end, or during playback. The application must implement the interface. It is important that none of the methods block or slow down the video processing, because this will cause problems with playback.Use this interface if you are writing a filter that supports IDDrawExclModeVideo or needs to generate callbacks to enable an application to draw color keys at the right time.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iddrawexclmodevideocallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDDrawExclModeVideoCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDDrawExclModeVideoCallback
     * @type {Guid}
     */
    static IID => Guid("{913c24a0-20ab-11d2-9038-00a0c9697298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdateOverlay", "OnUpdateColorKey", "OnUpdateSize"]

    /**
     * 
     * @param {BOOL} bBefore 
     * @param {Integer} dwFlags 
     * @param {BOOL} bOldVisible 
     * @param {Pointer<RECT>} prcOldSrc 
     * @param {Pointer<RECT>} prcOldDest 
     * @param {BOOL} bNewVisible 
     * @param {Pointer<RECT>} prcNewSrc 
     * @param {Pointer<RECT>} prcNewDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideocallback-onupdateoverlay
     */
    OnUpdateOverlay(bBefore, dwFlags, bOldVisible, prcOldSrc, prcOldDest, bNewVisible, prcNewSrc, prcNewDest) {
        result := ComCall(3, this, "int", bBefore, "uint", dwFlags, "int", bOldVisible, "ptr", prcOldSrc, "ptr", prcOldDest, "int", bNewVisible, "ptr", prcNewSrc, "ptr", prcNewDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pKey 
     * @param {Integer} dwColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideocallback-onupdatecolorkey
     */
    OnUpdateColorKey(pKey, dwColor) {
        result := ComCall(4, this, "ptr", pKey, "uint", dwColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @param {Integer} dwARWidth 
     * @param {Integer} dwARHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideocallback-onupdatesize
     */
    OnUpdateSize(dwWidth, dwHeight, dwARWidth, dwARHeight) {
        result := ComCall(5, this, "uint", dwWidth, "uint", dwHeight, "uint", dwARWidth, "uint", dwARHeight, "HRESULT")
        return result
    }
}
