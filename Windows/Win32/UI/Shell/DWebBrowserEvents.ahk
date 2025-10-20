#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DWebBrowserEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DWebBrowserEvents
     * @type {Guid}
     */
    static IID => Guid("{eab22ac2-30c1-11cf-a7eb-0000c05bae0b}")

    /**
     * The class identifier for DWebBrowserEvents
     * @type {Guid}
     */
    static CLSID => Guid("{eab22ac2-30c1-11cf-a7eb-0000c05bae0b}")

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
