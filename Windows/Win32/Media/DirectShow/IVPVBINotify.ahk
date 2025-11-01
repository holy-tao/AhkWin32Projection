#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVPBaseNotify.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPVBINotify extends IVPBaseNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVPVBINotify
     * @type {Guid}
     */
    static IID => Guid("{ec529b01-1a1f-11d1-bad9-00609744111a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
