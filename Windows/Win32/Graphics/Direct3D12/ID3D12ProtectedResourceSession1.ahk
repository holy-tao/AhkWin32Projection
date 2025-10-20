#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12ProtectedResourceSession.ahk

/**
 * Monitors the validity of a protected resource session.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12protectedresourcesession1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ProtectedResourceSession1 extends ID3D12ProtectedResourceSession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ProtectedResourceSession1
     * @type {Guid}
     */
    static IID => Guid("{d6f12dd6-76fb-406e-8961-4296eefc0409}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1"]

    /**
     * 
     * @returns {D3D12_PROTECTED_RESOURCE_SESSION_DESC1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12protectedresourcesession1-getdesc1
     */
    GetDesc1() {
        result := ComCall(11, this, "ptr")
        return result
    }
}
