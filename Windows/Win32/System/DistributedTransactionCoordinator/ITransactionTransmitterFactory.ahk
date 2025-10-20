#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionTransmitterFactory extends IUnknown{
    /**
     * The interface identifier for ITransactionTransmitterFactory
     * @type {Guid}
     */
    static IID => Guid("{59313e00-b36c-11cf-a539-00aa006887c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITransactionTransmitter>} ppTransmitter 
     * @returns {HRESULT} 
     */
    Create(ppTransmitter) {
        result := ComCall(3, this, "ptr", ppTransmitter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
