#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides functionality required for all Windows Runtime classes.
 * @remarks
 * 
  * <b>IInspectable</b> methods have no effect on COM apartments and are safe to call from user interface threads.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//inspectable/nn-inspectable-iinspectable
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IInspectable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInspectable
     * @type {Guid}
     */
    static IID => Guid("{af86e2e0-b12d-4c6a-9c5a-d7aa65101e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIids", "GetRuntimeClassName", "GetTrustLevel"]

    /**
     * 
     * @param {Pointer<Integer>} iidCount 
     * @param {Pointer<Pointer<Guid>>} iids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inspectable/nf-inspectable-iinspectable-getiids
     */
    GetIids(iidCount, iids) {
        iidCountMarshal := iidCount is VarRef ? "uint*" : "ptr"
        iidsMarshal := iids is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, iidCountMarshal, iidCount, iidsMarshal, iids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HSTRING>} className 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inspectable/nf-inspectable-iinspectable-getruntimeclassname
     */
    GetRuntimeClassName(className) {
        result := ComCall(4, this, "ptr", className, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} trustLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inspectable/nf-inspectable-iinspectable-gettrustlevel
     */
    GetTrustLevel(trustLevel) {
        trustLevelMarshal := trustLevel is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, trustLevelMarshal, trustLevel, "HRESULT")
        return result
    }
}
