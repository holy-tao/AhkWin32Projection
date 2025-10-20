#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Exposes the math input control event handlers.
 * @see https://docs.microsoft.com/windows/win32/api//micaut/nn-micaut-_imathinputcontrolevents
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IMathInputControlEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IMathInputControlEvents
     * @type {Guid}
     */
    static IID => Guid("{683336b5-a47d-4358-96f9-875a472ae70a}")

    /**
     * The class identifier for _IMathInputControlEvents
     * @type {Guid}
     */
    static CLSID => Guid("{683336b5-a47d-4358-96f9-875a472ae70a}")

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
