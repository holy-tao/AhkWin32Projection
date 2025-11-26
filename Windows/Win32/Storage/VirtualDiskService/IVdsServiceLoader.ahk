#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsService.ahk
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
     * Launches VDS on the specified computer and returns a pointer to the service object.
     * @param {PWSTR} pwszMachineName This parameter must be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This parameter contains the name of the host computer. Setting it to <b>NULL</b> causes VDS to be loaded and initialized on the local host.
     * @returns {IVdsService} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsservice">IVdsService</a>interface pointer. Callers must release the interface when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceloader-loadservice
     */
    LoadService(pwszMachineName) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(3, this, "ptr", pwszMachineName, "ptr*", &ppService := 0, "HRESULT")
        return IVdsService(ppService)
    }
}
