#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextBouten extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextBouten
     * @type {Guid}
     */
    static IID => Guid("{3c5f3e8a-90c0-464e-8136-898d2975f847}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBoutenType", "GetBoutenColor", "GetBoutenPosition"]

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetBoutenType(value) {
        result := ComCall(3, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} value 
     * @returns {HRESULT} 
     */
    GetBoutenColor(value) {
        result := ComCall(4, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetBoutenPosition(value) {
        result := ComCall(5, this, "int*", value, "HRESULT")
        return result
    }
}
