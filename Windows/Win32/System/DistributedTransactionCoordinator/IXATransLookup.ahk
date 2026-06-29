#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ITransaction.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class IXATransLookup extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXATransLookup
     * @type {Guid}
     */
    static IID => Guid("{f3b1f131-eeda-11ce-aed4-00aa0051e2c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lookup"]

    /**
     * 
     * @returns {ITransaction} 
     */
    Lookup() {
        result := ComCall(3, this, "ptr*", &ppTransaction := 0, "HRESULT")
        return ITransaction(ppTransaction)
    }
}
