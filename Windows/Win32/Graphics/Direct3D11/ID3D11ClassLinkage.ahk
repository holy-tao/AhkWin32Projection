#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\ID3D11ClassInstance.ahk" { ID3D11ClassInstance }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This interface encapsulates an HLSL dynamic linkage.
 * @remarks
 * A class linkage object can hold up to 64K gotten instances. A gotten instance is a handle that references a variable name in any shader that is created with that linkage object. When you create a shader with a class linkage object, the runtime gathers these instances and stores them in the class linkage object. For more information about how a class linkage object is used, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/storing-variables-and-types-for-shaders-to-share">Storing Variables and Types for Shaders to Share</a>.
 * 
 * An <b>ID3D11ClassLinkage</b> object is created using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createclasslinkage">ID3D11Device::CreateClassLinkage</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11classlinkage
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ClassLinkage extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11ClassLinkage
     * @type {Guid}
     */
    static IID := Guid("{ddf57cba-9543-46e4-a12b-f207a0fe7fed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ClassLinkage interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetClassInstance    : IntPtr
        CreateClassInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ClassLinkage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the class-instance object that represents the specified HLSL class.
     * @remarks
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a> interface, see
     *           <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * A class instance must have at least 1 data member in order to be available for the runtime to use with
     *           <b>ID3D11ClassLinkage::GetClassInstance</b>.
     *           Any instance with no members will be optimized out of a compiled shader blob as a zero-sized object.
     *           If you have a class with no data members, use
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance">ID3D11ClassLinkage::CreateClassInstance</a> instead.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {PSTR} pClassInstanceName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of a class for which to get the class instance.
     * @param {Integer} InstanceIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the class instance.
     * @returns {ID3D11ClassInstance} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface to initialize.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance
     */
    GetClassInstance(pClassInstanceName, InstanceIndex) {
        pClassInstanceName := pClassInstanceName is String ? StrPtr(pClassInstanceName) : pClassInstanceName

        result := ComCall(7, this, "ptr", pClassInstanceName, "uint", InstanceIndex, "ptr*", &ppInstance := 0, "HRESULT")
        return ID3D11ClassInstance(ppInstance)
    }

    /**
     * Initializes a class-instance object that represents an HLSL class instance.
     * @remarks
     * Instances can be created (or gotten) before or after a shader is created. Use the same shader linkage object to acquire a class instance and create the shader the instance is going to be used in.
     * 
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {PSTR} pClassTypeName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The type name of a class to initialize.
     * @param {Integer} ConstantBufferOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies the constant buffer that contains the class data.
     * @param {Integer} ConstantVectorOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The four-component vector offset from the start of the constant buffer where the class data will begin. Consequently, this is not a byte offset.
     * @param {Integer} TextureOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The texture slot for the first texture; there may be multiple textures following the offset.
     * @param {Integer} SamplerOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The sampler slot for the first sampler; there may be multiple samplers following the offset.
     * @returns {ID3D11ClassInstance} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface to initialize.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance
     */
    CreateClassInstance(pClassTypeName, ConstantBufferOffset, ConstantVectorOffset, TextureOffset, SamplerOffset) {
        pClassTypeName := pClassTypeName is String ? StrPtr(pClassTypeName) : pClassTypeName

        result := ComCall(8, this, "ptr", pClassTypeName, "uint", ConstantBufferOffset, "uint", ConstantVectorOffset, "uint", TextureOffset, "uint", SamplerOffset, "ptr*", &ppInstance := 0, "HRESULT")
        return ID3D11ClassInstance(ppInstance)
    }

    Query(iid) {
        if (ID3D11ClassLinkage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassInstance := CallbackCreate(GetMethod(implObj, "GetClassInstance"), flags, 4)
        this.vtbl.CreateClassInstance := CallbackCreate(GetMethod(implObj, "CreateClassInstance"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassInstance)
        CallbackFree(this.vtbl.CreateClassInstance)
    }
}
