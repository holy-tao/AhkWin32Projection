#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_APPLICATION_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class ID3D12ApplicationIdentity extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ApplicationIdentity
     * @type {Guid}
     */
    static IID => Guid("{82dc6c85-727b-4a8d-9169-db6ce3e975a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetApplicationIdentity"]

    /**
     * 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pDesc 
     * @param {Pointer<Guid>} AppId 
     * @returns {HRESULT} 
     */
    SetApplicationIdentity(pDesc, AppId) {
        result := ComCall(3, this, "ptr", pDesc, "ptr", AppId, "HRESULT")
        return result
    }
}
