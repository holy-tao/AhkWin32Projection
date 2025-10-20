#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineEMENotify extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngineEMENotify
     * @type {Guid}
     */
    static IID => Guid("{9e184d15-cdb7-4f86-b49e-566689f4a601}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} pbInitData 
     * @param {Integer} cb 
     * @param {BSTR} bstrInitDataType 
     * @returns {String} Nothing - always returns an empty string
     */
    Encrypted(pbInitData, cb, bstrInitDataType) {
        bstrInitDataType := bstrInitDataType is String ? BSTR.Alloc(bstrInitDataType).Value : bstrInitDataType

        ComCall(3, this, "ptr", pbInitData, "uint", cb, "ptr", bstrInitDataType)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    WaitingForKey() {
        ComCall(4, this)
        return result
    }
}
