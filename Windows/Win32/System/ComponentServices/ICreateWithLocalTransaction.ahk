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
     * 
     * @param {Pointer<IUnknown>} pTransaction 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pObject 
     * @returns {HRESULT} 
     */
    CreateInstanceWithSysTx(pTransaction, rclsid, riid, pObject) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", rclsid, "ptr", riid, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
