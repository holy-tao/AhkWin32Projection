#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAddrExclusionControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAddrExclusionControl
     * @type {Guid}
     */
    static IID => Guid("{00000148-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentAddrExclusionList", "UpdateAddrExclusionList"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppEnumerator 
     * @returns {HRESULT} 
     */
    GetCurrentAddrExclusionList(riid, ppEnumerator) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEnumerator 
     * @returns {HRESULT} 
     */
    UpdateAddrExclusionList(pEnumerator) {
        result := ComCall(4, this, "ptr", pEnumerator, "HRESULT")
        return result
    }
}
