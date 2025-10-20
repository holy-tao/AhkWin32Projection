#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is the base interface for all other attachment types.
 * @remarks
 * 
  * This interface is used strictly as a common ancestor for the various attachment types and has no members of its own.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nn-wsdattachment-iwsdattachment
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDAttachment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDAttachment
     * @type {Guid}
     */
    static IID => Guid("{5d55a616-9df8-4b09-b156-9ba351a48b76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
