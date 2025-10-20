#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * Offers base functionality that allows for a consistent way to monitor the validity of a session across the different types of sessions.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12protectedsession
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ProtectedSession extends ID3D12DeviceChild{
    /**
     * The interface identifier for ID3D12ProtectedSession
     * @type {Guid}
     */
    static IID => Guid("{a1533d18-0ac1-4084-85b9-89a96116806b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppFence 
     * @returns {HRESULT} 
     */
    GetStatusFence(riid, ppFence) {
        result := ComCall(8, this, "ptr", riid, "ptr", ppFence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSessionStatus() {
        result := ComCall(9, this, "int")
        return result
    }
}
