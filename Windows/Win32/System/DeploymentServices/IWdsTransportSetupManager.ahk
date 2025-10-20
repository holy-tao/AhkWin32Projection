#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages setup tasks on a WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportsetupmanager
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportSetupManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportSetupManager
     * @type {Guid}
     */
    static IID => Guid("{f7238425-efa8-40a4-aef9-c98d969c0b75}")

    /**
     * The class identifier for WdsTransportSetupManager
     * @type {Guid}
     */
    static CLSID => Guid("{c7beeaad-9f04-4923-9f0c-fbf52bc7590f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Version", "get_InstalledFeatures", "get_Protocols", "RegisterContentProvider", "DeregisterContentProvider"]

    /**
     * 
     * @param {Pointer<Integer>} pullVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-get_version
     */
    get_Version(pullVersion) {
        result := ComCall(7, this, "uint*", pullVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulInstalledFeatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-get_installedfeatures
     */
    get_InstalledFeatures(pulInstalledFeatures) {
        result := ComCall(8, this, "uint*", pulInstalledFeatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulProtocols 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-get_protocols
     */
    get_Protocols(pulProtocols) {
        result := ComCall(9, this, "uint*", pulProtocols, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszName 
     * @param {BSTR} bszDescription 
     * @param {BSTR} bszFilePath 
     * @param {BSTR} bszInitializationRoutine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-registercontentprovider
     */
    RegisterContentProvider(bszName, bszDescription, bszFilePath, bszInitializationRoutine) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName
        bszDescription := bszDescription is String ? BSTR.Alloc(bszDescription).Value : bszDescription
        bszFilePath := bszFilePath is String ? BSTR.Alloc(bszFilePath).Value : bszFilePath
        bszInitializationRoutine := bszInitializationRoutine is String ? BSTR.Alloc(bszInitializationRoutine).Value : bszInitializationRoutine

        result := ComCall(10, this, "ptr", bszName, "ptr", bszDescription, "ptr", bszFilePath, "ptr", bszInitializationRoutine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-deregistercontentprovider
     */
    DeregisterContentProvider(bszName) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName

        result := ComCall(11, this, "ptr", bszName, "HRESULT")
        return result
    }
}
