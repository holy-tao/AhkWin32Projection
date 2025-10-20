#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsAggregateControl extends IUnknown{
    /**
     * The interface identifier for IKsAggregateControl
     * @type {Guid}
     */
    static IID => Guid("{7f40eac0-3947-11d2-874e-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} AggregateClass 
     * @returns {HRESULT} 
     */
    KsAddAggregate(AggregateClass) {
        result := ComCall(3, this, "ptr", AggregateClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} AggregateClass 
     * @returns {HRESULT} 
     */
    KsRemoveAggregate(AggregateClass) {
        result := ComCall(4, this, "ptr", AggregateClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
