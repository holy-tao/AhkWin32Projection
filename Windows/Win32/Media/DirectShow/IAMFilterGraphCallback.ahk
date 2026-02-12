#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMFilterGraphCallback interface provides a callback mechanism during graph building.To use this interface, implement the interface in your application or client object.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iamfiltergraphcallback
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
     * @remarks
     * The Filter Graph Manager holds a graph-wide critical section while it calls this method. Therefore, the callback method should avoid calling any methods on the Filter Graph Manager, or any methods on filters that might change the graph state (such as disconnecting pins). Doing so might cause a deadlock or other unexpected behaviors. However, it is safe to query the pin for an interface or check the pin's preferred media type. The main use for this method would be to register a new filter, such as a decoder.
     * 
     * This method uses the thiscall calling convention, rather than __stdcall.
     * @param {IPin} pPin Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the pin that could not be rendered.
     * @returns {HRESULT} If the return value is S_OK, this Filter Graph Manager attempts to render the pin again. For any other return value, including S_FALSE and other success codes, the Filter Graph Manager continues to build the graph as normal. Typically it will reject the current filter and attempt to use a different filter.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamfiltergraphcallback-unabletorender
     */
    UnableToRender(pPin) {
        result := ComCall(3, this, "ptr", pPin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
