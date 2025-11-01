#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMFilterGraphCallback interface provides a callback mechanism during graph building.To use this interface, implement the interface in your application or client object.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamfiltergraphcallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMFilterGraphCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMFilterGraphCallback
     * @type {Guid}
     */
    static IID => Guid("{56a868fd-0ad4-11ce-b0a3-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnableToRender"]

    /**
     * 
     * @param {IPin} pPin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamfiltergraphcallback-unabletorender
     */
    UnableToRender(pPin) {
        result := ComCall(3, this, "ptr", pPin, "HRESULT")
        return result
    }
}
