#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IPenInputPanelEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IPenInputPanelEvents
     * @type {Guid}
     */
    static IID => Guid("{b7e489da-3719-439f-848f-e7acbd820f17}")

    /**
     * The class identifier for _IPenInputPanelEvents
     * @type {Guid}
     */
    static CLSID => Guid("{b7e489da-3719-439f-848f-e7acbd820f17}")

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
