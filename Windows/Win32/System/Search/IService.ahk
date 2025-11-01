#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IService
     * @type {Guid}
     */
    static IID => Guid("{06210e88-01f5-11d1-b512-0080c781c384}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeService"]

    /**
     * 
     * @param {IUnknown} pUnkInner 
     * @returns {HRESULT} 
     */
    InvokeService(pUnkInner) {
        result := ComCall(3, this, "ptr", pUnkInner, "HRESULT")
        return result
    }
}
