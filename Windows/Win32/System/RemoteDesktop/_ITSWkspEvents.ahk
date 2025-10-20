#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class _ITSWkspEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ITSWkspEvents
     * @type {Guid}
     */
    static IID => Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e9}")

    /**
     * The class identifier for _ITSWkspEvents
     * @type {Guid}
     */
    static CLSID => Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e9}")

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
