#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11ClassInstance.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * This interface encapsulates an HLSL dynamic linkage.
 * @remarks
 * 
  * A class linkage object can hold up to 64K gotten instances. A gotten instance is a handle that references a variable name in any shader that is created with that linkage object. When you create a shader with a class linkage object, the runtime gathers these instances and stores them in the class linkage object. For more information about how a class linkage object is used, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/storing-variables-and-types-for-shaders-to-share">Storing Variables and Types for Shaders to Share</a>.
  * 
  * An <b>ID3D11ClassLinkage</b> object is created using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createclasslinkage">ID3D11Device::CreateClassLinkage</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11classlinkage
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ClassLinkage extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ClassLinkage
     * @type {Guid}
     */
    static IID => Guid("{ddf57cba-9543-46e4-a12b-f207a0fe7fed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassInstance", "CreateClassInstance"]

    /**
     * 
     * @param {PSTR} pClassInstanceName 
     * @param {Integer} InstanceIndex 
     * @returns {ID3D11ClassInstance} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance
     */
    GetClassInstance(pClassInstanceName, InstanceIndex) {
        pClassInstanceName := pClassInstanceName is String ? StrPtr(pClassInstanceName) : pClassInstanceName

        result := ComCall(7, this, "ptr", pClassInstanceName, "uint", InstanceIndex, "ptr*", &ppInstance := 0, "HRESULT")
        return ID3D11ClassInstance(ppInstance)
    }

    /**
     * 
     * @param {PSTR} pClassTypeName 
     * @param {Integer} ConstantBufferOffset 
     * @param {Integer} ConstantVectorOffset 
     * @param {Integer} TextureOffset 
     * @param {Integer} SamplerOffset 
     * @returns {ID3D11ClassInstance} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance
     */
    CreateClassInstance(pClassTypeName, ConstantBufferOffset, ConstantVectorOffset, TextureOffset, SamplerOffset) {
        pClassTypeName := pClassTypeName is String ? StrPtr(pClassTypeName) : pClassTypeName

        result := ComCall(8, this, "ptr", pClassTypeName, "uint", ConstantBufferOffset, "uint", ConstantVectorOffset, "uint", TextureOffset, "uint", SamplerOffset, "ptr*", &ppInstance := 0, "HRESULT")
        return ID3D11ClassInstance(ppInstance)
    }
}
