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
     * 
     * @param {Pointer<Int32>} pwmprs 
     * @returns {HRESULT} 
     */
    get_ripState(pwmprs) {
        result := ComCall(3, this, "int*", pwmprs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProgress 
     * @returns {HRESULT} 
     */
    get_ripProgress(plProgress) {
        result := ComCall(4, this, "int*", plProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startRip() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopRip() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
