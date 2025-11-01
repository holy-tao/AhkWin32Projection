#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPCdromRip interface provides methods to manage copying, or ripping, tracks from an audio CD.Ripping a CD by using the IWMPCdromRip interface has the same effect as ripping music by using the Windows Media Player user interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdromrip
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdromRip extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCdromRip
     * @type {Guid}
     */
    static IID => Guid("{56e2294f-69ed-4629-a869-aea72c0dcc2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ripState", "get_ripProgress", "startRip", "stopRip"]

    /**
     * 
     * @param {Pointer<Integer>} pwmprs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-get_ripstate
     */
    get_ripState(pwmprs) {
        pwmprsMarshal := pwmprs is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pwmprsMarshal, pwmprs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-get_ripprogress
     */
    get_ripProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-startrip
     */
    startRip() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-stoprip
     */
    stopRip() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
