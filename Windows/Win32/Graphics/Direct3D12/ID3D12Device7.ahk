#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device6.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device6](../d3d12/nn-d3d12-id3d12device6.md).
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device7
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device7 extends ID3D12Device6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device7
     * @type {Guid}
     */
    static IID => Guid("{5c014b53-68a1-4b9b-8bd1-dd6046b9358b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 66

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddToStateObject", "CreateProtectedResourceSession1"]

    /**
     * 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pAddition 
     * @param {ID3D12StateObject} pStateObjectToGrowFrom 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppNewStateObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device7-addtostateobject
     */
    AddToStateObject(pAddition, pStateObjectToGrowFrom, riid, ppNewStateObject) {
        result := ComCall(66, this, "ptr", pAddition, "ptr", pStateObjectToGrowFrom, "ptr", riid, "ptr*", ppNewStateObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_PROTECTED_RESOURCE_SESSION_DESC1>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device7-createprotectedresourcesession1
     */
    CreateProtectedResourceSession1(pDesc, riid, ppSession) {
        result := ComCall(67, this, "ptr", pDesc, "ptr", riid, "ptr*", ppSession, "HRESULT")
        return result
    }
}
