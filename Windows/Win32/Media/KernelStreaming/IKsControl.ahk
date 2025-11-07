#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsControl extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsProperty", "KsMethod", "KsEvent"]

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Property 
     * @param {Integer} PropertyLength 
     * @param {Pointer<Void>} PropertyData 
     * @param {Integer} DataLength 
     * @returns {Integer} 
     */
    KsProperty(Property, PropertyLength, PropertyData, DataLength) {
        PropertyDataMarshal := PropertyData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Property, "uint", PropertyLength, PropertyDataMarshal, PropertyData, "uint", DataLength, "uint*", &BytesReturned := 0, "HRESULT")
        return BytesReturned
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Method 
     * @param {Integer} MethodLength 
     * @param {Pointer<Void>} MethodData 
     * @param {Integer} DataLength 
     * @returns {Integer} 
     */
    KsMethod(Method, MethodLength, MethodData, DataLength) {
        MethodDataMarshal := MethodData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", Method, "uint", MethodLength, MethodDataMarshal, MethodData, "uint", DataLength, "uint*", &BytesReturned := 0, "HRESULT")
        return BytesReturned
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Event 
     * @param {Integer} EventLength 
     * @param {Pointer<Void>} EventData 
     * @param {Integer} DataLength 
     * @returns {Integer} 
     */
    KsEvent(Event, EventLength, EventData, DataLength) {
        EventDataMarshal := EventData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", Event, "uint", EventLength, EventDataMarshal, EventData, "uint", DataLength, "uint*", &BytesReturned := 0, "HRESULT")
        return BytesReturned
    }
}
