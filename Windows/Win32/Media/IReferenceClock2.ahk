#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IReferenceClock.ahk

/**
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class IReferenceClock2 extends IReferenceClock{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceClock2
     * @type {Guid}
     */
    static IID => Guid("{36b73885-c2c8-11cf-8b46-00805f6cef60}")

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
