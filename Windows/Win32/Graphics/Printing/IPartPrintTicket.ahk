#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartPrintTicket extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartPrintTicket
     * @type {Guid}
     */
    static IID => Guid("{4a0f50f6-f9a2-41f0-99e7-5ae955be8e9e}")

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
