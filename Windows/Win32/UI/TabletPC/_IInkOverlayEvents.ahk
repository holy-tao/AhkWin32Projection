#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IInkOverlayEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IInkOverlayEvents
     * @type {Guid}
     */
    static IID => Guid("{31179b69-e563-489e-b16f-712f1e8a0651}")

    /**
     * The class identifier for _IInkOverlayEvents
     * @type {Guid}
     */
    static CLSID => Guid("{31179b69-e563-489e-b16f-712f1e8a0651}")

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
