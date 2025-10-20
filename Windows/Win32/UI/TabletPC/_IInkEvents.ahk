#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IInkEvents extends IDispatch{
    /**
     * The interface identifier for _IInkEvents
     * @type {Guid}
     */
    static IID => Guid("{427b1865-ca3f-479a-83a9-0f420f2a0073}")

    /**
     * The class identifier for _IInkEvents
     * @type {Guid}
     */
    static CLSID => Guid("{427b1865-ca3f-479a-83a9-0f420f2a0073}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7
}
