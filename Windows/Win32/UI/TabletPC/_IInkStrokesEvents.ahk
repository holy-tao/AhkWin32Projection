#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IInkStrokesEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IInkStrokesEvents
     * @type {Guid}
     */
    static IID => Guid("{f33053ec-5d25-430a-928f-76a6491dde15}")

    /**
     * The class identifier for _IInkStrokesEvents
     * @type {Guid}
     */
    static CLSID => Guid("{f33053ec-5d25-430a-928f-76a6491dde15}")

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
