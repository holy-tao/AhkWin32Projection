#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDVBSLocator.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDBSLocator extends IDVBSLocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDBSLocator
     * @type {Guid}
     */
    static IID => Guid("{c9897087-e29c-473f-9e4b-7072123dea14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
