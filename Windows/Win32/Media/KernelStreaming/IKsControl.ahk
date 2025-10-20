#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsControl extends IUnknown{
    /**
     * The interface identifier for IKsControl
     * @type {Guid}
     */
    static IID => Guid("{28f54685-06fd-11d2-b27a-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Property 
     * @param {Integer} PropertyLength 
     * @param {Pointer<Void>} PropertyData 
     * @param {Integer} DataLength 
     * @param {Pointer<UInt32>} BytesReturned 
     * @returns {HRESULT} 
     */
    KsProperty(Property, PropertyLength, PropertyData, DataLength, BytesReturned) {
        result := ComCall(3, this, "ptr", Property, "uint", PropertyLength, "ptr", PropertyData, "uint", DataLength, "uint*", BytesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Method 
     * @param {Integer} MethodLength 
     * @param {Pointer<Void>} MethodData 
     * @param {Integer} DataLength 
     * @param {Pointer<UInt32>} BytesReturned 
     * @returns {HRESULT} 
     */
    KsMethod(Method, MethodLength, MethodData, DataLength, BytesReturned) {
        result := ComCall(4, this, "ptr", Method, "uint", MethodLength, "ptr", MethodData, "uint", DataLength, "uint*", BytesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Event 
     * @param {Integer} EventLength 
     * @param {Pointer<Void>} EventData 
     * @param {Integer} DataLength 
     * @param {Pointer<UInt32>} BytesReturned 
     * @returns {HRESULT} 
     */
    KsEvent(Event, EventLength, EventData, DataLength, BytesReturned) {
        result := ComCall(5, this, "ptr", Event, "uint", EventLength, "ptr", EventData, "uint", DataLength, "uint*", BytesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
