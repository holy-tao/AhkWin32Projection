#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITBasicAudioTerminal interface provides methods that allow an application to control basic sound characteristics of terminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itbasicaudioterminal
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITBasicAudioTerminal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITBasicAudioTerminal
     * @type {Guid}
     */
    static IID => Guid("{b1efc38d-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Volume", "get_Volume", "put_Balance", "get_Balance"]

    /**
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-put_volume
     */
    put_Volume(lVolume) {
        result := ComCall(7, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-get_volume
     */
    get_Volume() {
        result := ComCall(8, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {Integer} lBalance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-put_balance
     */
    put_Balance(lBalance) {
        result := ComCall(9, this, "int", lBalance, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-get_balance
     */
    get_Balance() {
        result := ComCall(10, this, "int*", &plBalance := 0, "HRESULT")
        return plBalance
    }
}
