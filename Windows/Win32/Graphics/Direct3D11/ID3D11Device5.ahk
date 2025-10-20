#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Device4.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device5 adds new methods to those in ID3D11Device4.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11device5
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device5 extends ID3D11Device4{
    /**
     * The interface identifier for ID3D11Device5
     * @type {Guid}
     */
    static IID => Guid("{8ffde202-a0e7-45df-9e01-e837801b5ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * 
     * @param {HANDLE} hFence 
     * @param {Pointer<Guid>} ReturnedInterface 
     * @param {Pointer<Void>} ppFence 
     * @returns {HRESULT} 
     */
    OpenSharedFence(hFence, ReturnedInterface, ppFence) {
        hFence := hFence is Win32Handle ? NumGet(hFence, "ptr") : hFence

        result := ComCall(67, this, "ptr", hFence, "ptr", ReturnedInterface, "ptr", ppFence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InitialValue 
     * @param {Integer} Flags 
     * @param {Pointer<Guid>} ReturnedInterface 
     * @param {Pointer<Void>} ppFence 
     * @returns {HRESULT} 
     */
    CreateFence(InitialValue, Flags, ReturnedInterface, ppFence) {
        result := ComCall(68, this, "uint", InitialValue, "int", Flags, "ptr", ReturnedInterface, "ptr", ppFence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
