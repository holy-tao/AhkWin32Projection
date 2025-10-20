#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSourceEx.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSource2 extends IMFMediaSourceEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSource2
     * @type {Guid}
     */
    static IID => Guid("{fbb03414-d13b-4786-8319-5ac51fc0a136}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMediaType"]

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     */
    SetMediaType(dwStreamID, pMediaType) {
        result := ComCall(16, this, "uint", dwStreamID, "ptr", pMediaType, "HRESULT")
        return result
    }
}
