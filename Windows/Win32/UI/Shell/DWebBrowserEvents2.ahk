#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DWebBrowserEvents2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DWebBrowserEvents2
     * @type {Guid}
     */
    static IID => Guid("{34a715a0-6587-11d0-924a-0020afc7ac4d}")

    /**
     * The class identifier for DWebBrowserEvents2
     * @type {Guid}
     */
    static CLSID => Guid("{34a715a0-6587-11d0-924a-0020afc7ac4d}")

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
