#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheInstallerClient extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DShaderCacheInstallerClient
     * @type {Guid}
     */
    static IID => Guid("{a16ee930-d9f6-4222-a514-244473e5d266}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInstallerName", "GetInstallerScope", "HandleDriverUpdate"]

    /**
     * 
     * @param {Pointer<Pointer>} pNameLength 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    GetInstallerName(pNameLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(0, this, "ptr*", pNameLength, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInstallerScope() {
        result := ComCall(1, this, "int")
        return result
    }

    /**
     * 
     * @param {ID3DShaderCacheInstaller} pInstaller 
     * @returns {HRESULT} 
     */
    HandleDriverUpdate(pInstaller) {
        result := ComCall(2, this, "ptr", pInstaller, "HRESULT")
        return result
    }
}
