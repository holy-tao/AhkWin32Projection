#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DWebBridgeEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DWebBridgeEvents
     * @type {Guid}
     */
    static IID => Guid("{a6d897ff-0a95-11d1-b0ba-006008166e11}")

    /**
     * The class identifier for DWebBridgeEvents
     * @type {Guid}
     */
    static CLSID => Guid("{a6d897ff-0a95-11d1-b0ba-006008166e11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
