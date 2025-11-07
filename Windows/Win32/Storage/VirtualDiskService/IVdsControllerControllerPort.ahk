#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to enumerate controller ports for a class implementing the IVdsController interface. This is needed to support MPIO.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdscontrollercontrollerport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsControllerControllerPort extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsControllerControllerPort
     * @type {Guid}
     */
    static IID => Guid("{ca5d735f-6bae-42c0-b30e-f2666045ce71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryControllerPorts"]

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollercontrollerport-querycontrollerports
     */
    QueryControllerPorts() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
