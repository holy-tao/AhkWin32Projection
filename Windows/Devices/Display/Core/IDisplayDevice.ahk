#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplaySource.ahk
#Include .\DisplaySurface.ahk
#Include .\DisplayTaskPool.ahk
#Include .\DisplayFence.ahk
#Include .\DisplayScanout.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * For a [DisplaySurface](/uwp/api/windows.devices.display.core.displaysurface) or a [DisplayFence](/uwp/api/windows.devices.display.core.displayfence) object, creates a shared handle that can be used for interop with Direct3D or other graphics APIs.
 * @remarks
 * The handle returned by **CreateSharedHandle** can be used in any function that requires an "NT handle" to a GPU surface or fence (depending on what object was passed), provided that the caller has been granted access. Here are some examples.
 * 
 * * Share surfaces and fences with Direct3D 12 using [ID3D12Device::OpenSharedHandle](../d3d12/nf-d3d12-id3d12device-opensharedhandle.md).
 * * Share surfaces with Direct3D 11 using [ID3D11Device1::OpenSharedResource](../d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1.md).
 * * Share fences with Direct3D 11 using [ID3D11Device5::OpenSharedFence](../d3d11_4/nf-d3d11_4-id3d11device5-opensharedfence.md).
 * 
 * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. The following object-sharing mechanisms are available.
 * 
 * * A child process created by the [CreateProcess](../processthreadsapi/nf-processthreadsapi-createprocessa.md) function can inherit a handle to a surface or fence object if the *pSecurityAttributes* parameter of **CreateSharedHandle** enables inheritance.
 * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
 * * A process can specify the name of the object in a call to the [OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) or [ID3D12Device::OpenSharedHandleByName](../d3d12/nf-d3d12-id3d12device-opensharedhandlebyname.md) function.
 * 
 * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaydeviceinterop-createsharedhandle
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayDevice
     * @type {Guid}
     */
    static IID => Guid("{a4c9b62c-335f-5731-8cb4-c1ccd4731070}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateScanoutSource", "CreatePrimary", "CreateTaskPool", "CreatePeriodicFence", "WaitForVBlank", "CreateSimpleScanout", "IsCapabilitySupported"]

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {DisplaySource} 
     */
    CreateScanoutSource(target) {
        result := ComCall(6, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplaySource(result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @param {DisplayPrimaryDescription} desc 
     * @returns {DisplaySurface} 
     */
    CreatePrimary(target, desc) {
        result := ComCall(7, this, "ptr", target, "ptr", desc, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplaySurface(result_)
    }

    /**
     * 
     * @returns {DisplayTaskPool} 
     */
    CreateTaskPool() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayTaskPool(result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @param {TimeSpan} offsetFromVBlank 
     * @returns {DisplayFence} 
     */
    CreatePeriodicFence(target, offsetFromVBlank) {
        result := ComCall(9, this, "ptr", target, "ptr", offsetFromVBlank, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayFence(result_)
    }

    /**
     * 
     * @param {DisplaySource} source 
     * @returns {HRESULT} 
     */
    WaitForVBlank(source) {
        result := ComCall(10, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DisplaySource} pSource 
     * @param {DisplaySurface} pSurface 
     * @param {Integer} SubResourceIndex 
     * @param {Integer} SyncInterval 
     * @returns {DisplayScanout} 
     */
    CreateSimpleScanout(pSource, pSurface, SubResourceIndex, SyncInterval) {
        result := ComCall(11, this, "ptr", pSource, "ptr", pSurface, "uint", SubResourceIndex, "uint", SyncInterval, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayScanout(result_)
    }

    /**
     * 
     * @param {Integer} capability 
     * @returns {Boolean} 
     */
    IsCapabilitySupported(capability) {
        result := ComCall(12, this, "int", capability, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
