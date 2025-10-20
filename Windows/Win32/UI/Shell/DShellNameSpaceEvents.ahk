#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DShellNameSpaceEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DShellNameSpaceEvents
     * @type {Guid}
     */
    static IID => Guid("{55136806-b2de-11d1-b9f2-00a0c98bc547}")

    /**
     * The class identifier for DShellNameSpaceEvents
     * @type {Guid}
     */
    static CLSID => Guid("{55136806-b2de-11d1-b9f2-00a0c98bc547}")

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
