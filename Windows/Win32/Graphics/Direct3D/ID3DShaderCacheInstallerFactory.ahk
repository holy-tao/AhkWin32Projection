#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheInstallerFactory extends IUnknown{
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
     * 
     * @param {Pointer<ID3DShaderCacheInstallerClient>} pClient 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvInstaller 
     * @returns {HRESULT} 
     */
    CreateInstaller(pClient, riid, ppvInstaller) {
        result := ComCall(3, this, "ptr", pClient, "ptr", riid, "ptr", ppvInstaller, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvExplorer 
     * @returns {HRESULT} 
     */
    CreateExplorer(pUnknown, riid, ppvExplorer) {
        result := ComCall(4, this, "ptr", pUnknown, "ptr", riid, "ptr", ppvExplorer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
