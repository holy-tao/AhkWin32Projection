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
     * Creates a COM+ object that executes within the scope of the specified local transaction.
     * @param {IUnknown} pTransaction The transaction in which the requested object participates.
     * @param {Pointer<Guid>} rclsid The CLSID of the class from which to create the requested object.
     * @param {Pointer<Guid>} riid A reference to the interface identifier (IID) of the interface that is used to communicate with the request object.
     * @param {Pointer<Pointer<Void>>} pObject The address of the pointer variable that receives the interface pointer specified with <i>riid</i>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icreatewithlocaltransaction-createinstancewithsystx
     */
    CreateInstanceWithSysTx(pTransaction, rclsid, riid, pObject) {
        pObjectMarshal := pObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pTransaction, "ptr", rclsid, "ptr", riid, pObjectMarshal, pObject, "HRESULT")
        return result
    }
}
