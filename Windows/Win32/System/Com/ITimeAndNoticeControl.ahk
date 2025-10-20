#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITimeAndNoticeControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeAndNoticeControl
     * @type {Guid}
     */
    static IID => Guid("{bc0bf6ae-8878-11d1-83e9-00c04fc2c6d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SuppressChanges"]

    /**
     * 
     * @param {Integer} res1 
     * @param {Integer} res2 
     * @returns {HRESULT} 
     */
    SuppressChanges(res1, res2) {
        result := ComCall(3, this, "uint", res1, "uint", res2, "HRESULT")
        return result
    }
}
