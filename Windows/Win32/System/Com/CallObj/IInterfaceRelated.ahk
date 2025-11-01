#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class IInterfaceRelated extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInterfaceRelated
     * @type {Guid}
     */
    static IID => Guid("{d1fb5a79-7706-11d1-adba-00c04fc2adc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIID", "GetIID"]

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @returns {HRESULT} 
     */
    SetIID(iid) {
        result := ComCall(3, this, "ptr", iid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} piid 
     * @returns {HRESULT} 
     */
    GetIID(piid) {
        result := ComCall(4, this, "ptr", piid, "HRESULT")
        return result
    }
}
