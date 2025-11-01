#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBufferingTime extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBufferingTime
     * @type {Guid}
     */
    static IID => Guid("{1e00486a-78dd-11d2-8dd3-006097c9a2b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBufferingTime", "SetBufferingTime"]

    /**
     * 
     * @param {Pointer<Integer>} pdwMilliseconds 
     * @returns {HRESULT} 
     */
    GetBufferingTime(pdwMilliseconds) {
        result := ComCall(3, this, "uint*", pdwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    SetBufferingTime(dwMilliseconds) {
        result := ComCall(4, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }
}
