#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpEventSource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpEventSource2 extends ISpEventSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpEventSource2
     * @type {Guid}
     */
    static IID => Guid("{2373a435-6a4b-429e-a6ac-d4231a61975b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventsEx"]

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<SPEVENTEX>} pEventArray 
     * @param {Pointer<Integer>} pulFetched 
     * @returns {HRESULT} 
     */
    GetEventsEx(ulCount, pEventArray, pulFetched) {
        result := ComCall(13, this, "uint", ulCount, "ptr", pEventArray, "uint*", pulFetched, "HRESULT")
        return result
    }
}
