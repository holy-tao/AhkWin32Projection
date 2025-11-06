#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransactionReceiver.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionReceiverFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionReceiverFactory
     * @type {Guid}
     */
    static IID => Guid("{59313e02-b36c-11cf-a539-00aa006887c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * 
     * @returns {ITransactionReceiver} 
     */
    Create() {
        result := ComCall(3, this, "ptr*", &ppReceiver := 0, "HRESULT")
        return ITransactionReceiver(ppReceiver)
    }
}
