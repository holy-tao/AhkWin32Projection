#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQEvent.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQEvent2 extends IMSMQEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQEvent2
     * @type {Guid}
     */
    static IID => Guid("{eba96b12-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Properties"]

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(7, this, "ptr*", ppcolProperties, "HRESULT")
        return result
    }
}
