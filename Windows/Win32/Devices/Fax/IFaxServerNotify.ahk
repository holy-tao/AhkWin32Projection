#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServerNotify extends IDispatch{
    /**
     * The interface identifier for IFaxServerNotify
     * @type {Guid}
     */
    static IID => Guid("{2e037b27-cf8a-4abd-b1e0-5704943bea6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7
}
