#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Instantiates a service loader object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsserviceloader
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceLoader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsServiceLoader
     * @type {Guid}
     */
    static IID => Guid("{e0393303-90d4-4a97-ab71-e9b671ee2729}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadService"]

    /**
     * 
     * @param {PWSTR} pwszMachineName 
     * @param {Pointer<IVdsService>} ppService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceloader-loadservice
     */
    LoadService(pwszMachineName, ppService) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(3, this, "ptr", pwszMachineName, "ptr*", ppService, "HRESULT")
        return result
    }
}
