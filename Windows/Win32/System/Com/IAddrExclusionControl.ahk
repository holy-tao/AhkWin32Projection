#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAddrExclusionControl extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppEnumerator 
     * @returns {HRESULT} 
     */
    GetCurrentAddrExclusionList(riid, ppEnumerator) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pEnumerator 
     * @returns {HRESULT} 
     */
    UpdateAddrExclusionList(pEnumerator) {
        result := ComCall(4, this, "ptr", pEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
