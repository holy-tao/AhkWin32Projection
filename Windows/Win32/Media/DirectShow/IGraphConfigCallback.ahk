#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGraphConfigCallback interface contains the callback method passed to IGraphConfig::Reconfigure. The caller (an application or filter) implements this interface. For more information, see IGraphConfig.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-igraphconfigcallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphConfigCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphConfigCallback
     * @type {Guid}
     */
    static IID => Guid("{ade0fd60-d19d-11d2-abf6-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reconfigure"]

    /**
     * The Reconfigure method is a callback method passed to IGraphConfig::Reconfigure.
     * @remarks
     * If your application or filter calls <b>IGraphConfig::Reconfigure</b>, you must implement this method and pass it as a callback. The <b>IGraphConfig::Reconfigure</b> method obtains a lock on the filter graph before calling your <c>Reconfigure</c> method. Your method then handles all the other details of dynamic graph building.
     * 
     * If this method succeeds, <b>IGraphConfig::Reconfigure</b> tries to put all the filters in the graph back into a running state. If the method fails, <b>IGraphConfig::Reconfigure</b> returns whatever error code this method returned.
     * 
     * This method allows for specialized graph rebuilding. For a more straightforward approach to dynamic graph building, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-reconnect">IGraphConfig::Reconnect</a>.
     * @param {Pointer<Void>} pvContext Value passed in the <b>IGraphConfig::Reconfigure</b> method's <i>pvContext</i> parameter.
     * @param {Integer} dwFlags Value passed in the <b>IGraphConfig::Reconfigure</b> method's <i>dwFlags</i> parameter.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfigcallback-reconfigure
     */
    Reconfigure(pvContext, dwFlags) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvContextMarshal, pvContext, "uint", dwFlags, "HRESULT")
        return result
    }
}
