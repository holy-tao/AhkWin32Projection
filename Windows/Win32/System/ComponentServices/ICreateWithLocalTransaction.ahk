#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Creates a COM+ object that executes within the scope of the specified local transaction.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icreatewithlocaltransaction
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICreateWithLocalTransaction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateWithLocalTransaction
     * @type {Guid}
     */
    static IID => Guid("{227ac7a8-8423-42ce-b7cf-03061ec9aaa3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithSysTx"]

    /**
     * 
     * @param {IUnknown} pTransaction 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icreatewithlocaltransaction-createinstancewithsystx
     */
    CreateInstanceWithSysTx(pTransaction, rclsid, riid, pObject) {
        pObjectMarshal := pObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pTransaction, "ptr", rclsid, "ptr", riid, pObjectMarshal, pObject, "HRESULT")
        return result
    }
}
