#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeRealEstate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPNodeRealEstate
     * @type {Guid}
     */
    static IID => Guid("{42751198-5a50-4460-bcb4-709f8bdc8e59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesiredSize", "SetRects", "GetRects", "SetWindowless", "GetWindowless", "SetFullScreen", "GetFullScreen"]

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     */
    GetDesiredSize(pSize) {
        result := ComCall(3, this, "ptr", pSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSrc 
     * @param {Pointer<RECT>} pDest 
     * @param {Pointer<RECT>} pClip 
     * @returns {HRESULT} 
     */
    SetRects(pSrc, pDest, pClip) {
        result := ComCall(4, this, "ptr", pSrc, "ptr", pDest, "ptr", pClip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSrc 
     * @param {Pointer<RECT>} pDest 
     * @param {Pointer<RECT>} pClip 
     * @returns {HRESULT} 
     */
    GetRects(pSrc, pDest, pClip) {
        result := ComCall(5, this, "ptr", pSrc, "ptr", pDest, "ptr", pClip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fWindowless 
     * @returns {HRESULT} 
     */
    SetWindowless(fWindowless) {
        result := ComCall(6, this, "int", fWindowless, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfWindowless 
     * @returns {HRESULT} 
     */
    GetWindowless(pfWindowless) {
        pfWindowlessMarshal := pfWindowless is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pfWindowlessMarshal, pfWindowless, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFullScreen 
     * @returns {HRESULT} 
     */
    SetFullScreen(fFullScreen) {
        result := ComCall(8, this, "int", fFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFullScreen 
     * @returns {HRESULT} 
     */
    GetFullScreen(pfFullScreen) {
        pfFullScreenMarshal := pfFullScreen is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pfFullScreenMarshal, pfFullScreen, "HRESULT")
        return result
    }
}
