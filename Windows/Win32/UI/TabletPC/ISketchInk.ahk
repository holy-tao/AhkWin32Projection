#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ISketchInk extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISketchInk
     * @type {Guid}
     */
    static IID => Guid("{b4563688-98eb-4646-b279-44da14d45748}")

    /**
     * The class identifier for SketchInk
     * @type {Guid}
     */
    static CLSID => Guid("{f0291081-e87c-4e07-97da-a0a03761e586}")

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
