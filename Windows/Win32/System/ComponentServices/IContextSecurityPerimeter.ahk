#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IContextSecurityPerimeter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextSecurityPerimeter
     * @type {Guid}
     */
    static IID => Guid("{a7549a29-a7c4-42e1-8dc1-7e3d748dc24a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPerimeterFlag", "SetPerimeterFlag"]

    /**
     * 
     * @param {Pointer<BOOL>} pFlag 
     * @returns {HRESULT} 
     */
    GetPerimeterFlag(pFlag) {
        pFlagMarshal := pFlag is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pFlagMarshal, pFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFlag 
     * @returns {HRESULT} 
     */
    SetPerimeterFlag(fFlag) {
        result := ComCall(4, this, "int", fFlag, "HRESULT")
        return result
    }
}
