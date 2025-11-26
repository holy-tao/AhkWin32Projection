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
     * The UnableToRender method is called by the Filter Graph Manager if it cannot find any combination of filters to render the specified pin.
     * @param {IPin} pPin Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the pin that could not be rendered.
     * @returns {HRESULT} If the return value is S_OK, this Filter Graph Manager attempts to render the pin again. For any other return value, including S_FALSE and other success codes, the Filter Graph Manager continues to build the graph as normal. Typically it will reject the current filter and attempt to use a different filter.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamfiltergraphcallback-unabletorender
     */
    UnableToRender(pPin) {
        result := ComCall(3, this, "ptr", pPin, "HRESULT")
        return result
    }
}
