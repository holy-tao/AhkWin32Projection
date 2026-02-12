#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides SDK configuration methods.
 * @remarks
 * Tools that play back API capture such as PIX, and test harnesses such as the HLK, require modification to support the redist. Such tools can choose to ship with the latest redist. Direct3D's API compatibility through updates should mean that an API capture tool can capture on an older version of the Direct3D 12 SDK, and play it back on the newer version. However, some scenarios require more flexibility in selecting the SDK version.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nn-d3d12-id3d12sdkconfiguration
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12SDKConfiguration extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSDKVersion"]

    /**
     * Configures the SDK version to use.
     * @remarks
     * This method can be used only in Windows Developer Mode.
     * 
     * To set the SDK version using this API, you must call it before you create the Direct3D 12 device. Calling this API *after* creating the Direct3D 12 device will cause the Direct3D 12 runtime to remove the device.
     * 
     * If the `d3d12core.dll` installed with the OS is newer than the SDK version specified, then the OS version is used instead.
     * 
     * You can retrieve the version of a particular `D3D12Core.dll` from the exported symbol [**D3D12SDKVersion**](/windows/win32/direct3d12/nf-d3d12-d3d12sdkversion), which is a variable of type **UINT**, just like the variables exported from applications to enable use of the Agility SDK.
     * @param {Integer} SDKVersion Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The SDK version to set.
     * @param {PSTR} SDKPath Type: \_In\_z\_ **[LPCSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A NULL-terminated string that provides the relative path to `d3d12core.dll` at the specified *SDKVersion*. The path is relative to the process exe of the caller. If `d3d12core.dll` isn't found, or isn't of the specified *SDKVersion*, then Direct3D 12 device creation fails.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, then it returns **S_OK**. Otherwise, it returns one of the [Direct3D 12 return codes](/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12sdkconfiguration-setsdkversion
     */
    SetSDKVersion(SDKVersion, SDKPath) {
        SDKPath := SDKPath is String ? StrPtr(SDKPath) : SDKPath

        result := ComCall(3, this, "uint", SDKVersion, "ptr", SDKPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
