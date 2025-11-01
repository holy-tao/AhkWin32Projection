#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DataSourceObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DataSourceObject
     * @type {Guid}
     */
    static IID => Guid("{0ae9a4e4-18d4-11d1-b3b3-00aa00c1a924}")

    /**
     * The class identifier for DataSourceObject
     * @type {Guid}
     */
    static CLSID => Guid("{0ae9a4e4-18d4-11d1-b3b3-00aa00c1a924}")

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
