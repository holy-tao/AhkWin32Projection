#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemUnboundObjectSink interface is implemented by all logical event consumers. It is a simple sink interface that accepts delivery of event objects.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemunboundobjectsink
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemUnboundObjectSink extends IUnknown{
    /**
     * The interface identifier for IWbemUnboundObjectSink
     * @type {Guid}
     */
    static IID => Guid("{e246107b-b06e-11d0-ad61-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pLogicalConsumer 
     * @param {Integer} lNumObjects 
     * @param {Pointer<IWbemClassObject>} apObjects 
     * @returns {HRESULT} 
     */
    IndicateToConsumer(pLogicalConsumer, lNumObjects, apObjects) {
        result := ComCall(3, this, "ptr", pLogicalConsumer, "int", lNumObjects, "ptr", apObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
