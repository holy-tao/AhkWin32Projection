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
     * @returns {Pointer<Void>} 
     */
    CreateInstaller(pClient, riid) {
        result := ComCall(3, this, "ptr", pClient, "ptr", riid, "ptr*", &ppvInstaller := 0, "HRESULT")
        return ppvInstaller
    }

    /**
     * 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateExplorer(pUnknown, riid) {
        result := ComCall(4, this, "ptr", pUnknown, "ptr", riid, "ptr*", &ppvExplorer := 0, "HRESULT")
        return ppvExplorer
    }
}
