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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatusFence", "GetSessionStatus"]

    /**
     * Retrieves the fence for the protected session. From the fence, you can retrieve the current uniqueness validity value (using ID3D12Fence::GetCompletedValue), and add monitors for changes to its value. This is a read-only fence.
     * @param {Pointer<Guid>} riid The GUID of the interface to a fence. Most commonly, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>, although it may be any GUID for any interface. If the protected session object doesn’t support the interface for this GUID, the function returns <b>E_NOINTERFACE</b>.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the fence for the given protected session.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12protectedsession-getstatusfence
     */
    GetStatusFence(riid) {
        result := ComCall(8, this, "ptr", riid, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    /**
     * Gets the status of the protected session.
     * @returns {Integer} Type: **[D3D12_PROTECTED_SESSION_STATUS](/windows/desktop/api/d3d12/ne-d3d12-d3d12_protected_session_status)**
     * 
     * The status of the protected session. If the returned value is [D3D12_PROTECTED_SESSION_STATUS_INVALID](/windows/desktop/api/d3d12/ne-d3d12-d3d12_protected_session_status), then you need to wait for a uniqueness value bump to reuse the resource if the session is an [ID3D12ProtectedResourceSession](/windows/desktop/api/d3d12/nn-d3d12-id3d12protectedresourcesession).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12protectedsession-getsessionstatus
     */
    GetSessionStatus() {
        result := ComCall(9, this, "int")
        return result
    }
}
