#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemUnboundObjectSink.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary interface for an event consumer provider. Through this interface and the FindConsumer method, an event consumer provider can indicate which event consumers should receive a given event.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemeventconsumerprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemEventConsumerProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindConsumer"]

    /**
     * 
     * @param {IWbemClassObject} pLogicalConsumer 
     * @returns {IWbemUnboundObjectSink} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventconsumerprovider-findconsumer
     */
    FindConsumer(pLogicalConsumer) {
        result := ComCall(3, this, "ptr", pLogicalConsumer, "ptr*", &ppConsumer := 0, "HRESULT")
        return IWbemUnboundObjectSink(ppConsumer)
    }
}
