#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheInstallerFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DShaderCacheInstallerFactory
     * @type {Guid}
     */
    static IID => Guid("{09b2dfe4-840f-401a-804c-0dd8aadc9e9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstaller", "CreateExplorer"]

    /**
     * 
     * @param {ID3DShaderCacheInstallerClient} pClient 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvInstaller 
     * @returns {HRESULT} 
     */
    CreateInstaller(pClient, riid, ppvInstaller) {
        ppvInstallerMarshal := ppvInstaller is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pClient, "ptr", riid, ppvInstallerMarshal, ppvInstaller, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvExplorer 
     * @returns {HRESULT} 
     */
    CreateExplorer(pUnknown, riid, ppvExplorer) {
        ppvExplorerMarshal := ppvExplorer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pUnknown, "ptr", riid, ppvExplorerMarshal, ppvExplorer, "HRESULT")
        return result
    }
}
