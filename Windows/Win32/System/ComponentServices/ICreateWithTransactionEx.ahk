#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Creates an object that is enlisted within a manual transaction.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icreatewithtransactionex
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICreateWithTransactionEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateWithTransactionEx
     * @type {Guid}
     */
    static IID => Guid("{455acf57-5345-11d2-99cf-00c04f797bc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * Creates a COM+ object that executes within the scope of a manual transaction specified with a reference to an ITransaction interface.
     * @param {ITransaction} pTransaction An <b>ITransaction</b> interface pointer indicating the transaction in which you want to create the COM+ object.
     * @param {Pointer<Guid>} rclsid The CLSID of the type of object to instantiate.
     * @param {Pointer<Guid>} riid The ID of the interface to be returned by the <i>ppvObj</i> parameter.
     * @returns {Pointer<Void>} A new object of the type specified by the <i>rclsid</i> argument through the interface specified by the <i>riid</i> argument.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icreatewithtransactionex-createinstance
     */
    CreateInstance(pTransaction, rclsid, riid) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", rclsid, "ptr", riid, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }
}
