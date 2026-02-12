#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug4.ahk

/**
 * Adds to the debug layer the ability to configure the auto-naming of objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug5 extends ID3D12Debug4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Debug5
     * @type {Guid}
     */
    static IID => Guid("{548d6b12-09fa-40e0-9069-5dcd589a52c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEnableAutoName"]

    /**
     * Configures the auto-naming of objects.
     * @remarks
     * By default, objects are not named unless you use [ID3D12Object::SetName](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setname) or [ID3D12Object::SetPrivateData](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setprivatedata) to assign a name.
     * 
     * It's a best practice to name all of your Direct3D 12 objects; at least in debug builds. Failing that, you might find it convenient to allow automatic name assignment in order to cover the gaps. Direct3D 12 objects created with auto-name enabled are automatically assigned a name, which is used for debug layer output and for DRED page fault data.
     * 
     * So as not to create a dependency on a specific auto-naming format, you can't retrieve the auto-name strings by using ID3D12Object::GetName or [ID3D12Object::GetPrivateData](/windows/win32/api/d3d12/nf-d3d12-id3d12object-getprivatedata). But, to generate a unique name string, Direct3D 12 uses the locally-unique identifier (LUID) assigned to every **ID3D12DeviceChild** object at create time. You can retrieve that LUID by using **ID3D12Object::GetPrivateData** with the **REFGUID** value *WKPDID_D3D12UniqueObjectId*. You might find that useful for your own object-naming schemas.
     * 
     * When debugging existing software, you can control auto-naming by using the *D3DConfig* graphics tools utility and the command `d3dconfig.exe device auto-debug-name=forced-on`.
     * 
     * Any object given a name using [ID3D12Object::SetName](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setname) or [ID3D12Object::SetPrivateData](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setprivatedata) uses the assigned name instead of the auto-name.
     * @param {BOOL} Enable Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * `true` to enable auto-naming; `false` to disable auto-naming.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug5-setenableautoname
     */
    SetEnableAutoName(Enable) {
        ComCall(8, this, "int", Enable)
    }
}
