#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12SDKConfiguration extends IUnknown{
    /**
     * The interface identifier for ID3D12SDKConfiguration
     * @type {Guid}
     */
    static IID => Guid("{e9eb5314-33aa-42b2-a718-d77f58b1f1c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} SDKVersion 
     * @param {PSTR} SDKPath 
     * @returns {HRESULT} 
     */
    SetSDKVersion(SDKVersion, SDKPath) {
        result := ComCall(3, this, "uint", SDKVersion, "ptr", SDKPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
