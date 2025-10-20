#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary interface for an event consumer provider. Through this interface and the FindConsumer method, an event consumer provider can indicate which event consumers should receive a given event.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemeventconsumerprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemEventConsumerProvider extends IUnknown{
    /**
     * The interface identifier for IWbemEventConsumerProvider
     * @type {Guid}
     */
    static IID => Guid("{e246107a-b06e-11d0-ad61-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pLogicalConsumer 
     * @param {Pointer<IWbemUnboundObjectSink>} ppConsumer 
     * @returns {HRESULT} 
     */
    FindConsumer(pLogicalConsumer, ppConsumer) {
        result := ComCall(3, this, "ptr", pLogicalConsumer, "ptr", ppConsumer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
