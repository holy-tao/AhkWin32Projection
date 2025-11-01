#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class AppEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AppEvents
     * @type {Guid}
     */
    static IID => Guid("{fc7a4252-78ac-4532-8c5a-563cfe138863}")

    /**
     * The class identifier for AppEvents
     * @type {Guid}
     */
    static CLSID => Guid("{fc7a4252-78ac-4532-8c5a-563cfe138863}")

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
