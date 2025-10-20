#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12ProtectedSession.ahk

/**
 * Monitors the validity of a protected resource session.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12protectedresourcesession
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ProtectedResourceSession extends ID3D12ProtectedSession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ProtectedResourceSession
     * @type {Guid}
     */
    static IID => Guid("{6cd696f4-f289-40cc-8091-5a6c0a099c3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @returns {D3D12_PROTECTED_RESOURCE_SESSION_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12protectedresourcesession-getdesc
     */
    GetDesc() {
        result := ComCall(10, this, "ptr")
        return result
    }
}
