#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESEventFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESEventFactory
     * @type {Guid}
     */
    static IID => Guid("{506a09b8-7f86-4e04-ac05-3303bfe8fc49}")

    /**
     * The class identifier for ESEventFactory
     * @type {Guid}
     */
    static CLSID => Guid("{8e8a07da-71f8-40c1-a929-5e3a868ac2c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateESEvent"]

    /**
     * 
     * @param {IUnknown} pServiceProvider 
     * @param {Integer} dwEventId 
     * @param {Guid} guidEventType 
     * @param {Integer} dwEventDataLength 
     * @param {Pointer<Integer>} pEventData 
     * @param {BSTR} bstrBaseUrl 
     * @param {IUnknown} pInitContext 
     * @param {Pointer<IESEvent>} ppESEvent 
     * @returns {HRESULT} 
     */
    CreateESEvent(pServiceProvider, dwEventId, guidEventType, dwEventDataLength, pEventData, bstrBaseUrl, pInitContext, ppESEvent) {
        bstrBaseUrl := bstrBaseUrl is String ? BSTR.Alloc(bstrBaseUrl).Value : bstrBaseUrl

        pEventDataMarshal := pEventData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pServiceProvider, "uint", dwEventId, "ptr", guidEventType, "uint", dwEventDataLength, pEventDataMarshal, pEventData, "ptr", bstrBaseUrl, "ptr", pInitContext, "ptr*", ppESEvent, "HRESULT")
        return result
    }
}
