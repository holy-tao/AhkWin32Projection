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
     * 
     * @param {Pointer<IUnknown>} pServiceProvider 
     * @param {Integer} dwEventId 
     * @param {Pointer<Guid>} guidEventType 
     * @param {Integer} dwEventDataLength 
     * @param {Pointer<Byte>} pEventData 
     * @param {BSTR} bstrBaseUrl 
     * @param {Pointer<IUnknown>} pInitContext 
     * @param {Pointer<IESEvent>} ppESEvent 
     * @returns {HRESULT} 
     */
    CreateESEvent(pServiceProvider, dwEventId, guidEventType, dwEventDataLength, pEventData, bstrBaseUrl, pInitContext, ppESEvent) {
        bstrBaseUrl := bstrBaseUrl is String ? BSTR.Alloc(bstrBaseUrl).Value : bstrBaseUrl

        result := ComCall(3, this, "ptr", pServiceProvider, "uint", dwEventId, "ptr", guidEventType, "uint", dwEventDataLength, "char*", pEventData, "ptr", bstrBaseUrl, "ptr", pInitContext, "ptr", ppESEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
