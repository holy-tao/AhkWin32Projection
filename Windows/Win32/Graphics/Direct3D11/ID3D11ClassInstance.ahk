#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\ID3D11ClassLinkage.ahk" { ID3D11ClassLinkage }
#Import ".\D3D11_CLASS_INSTANCE_DESC.ahk" { D3D11_CLASS_INSTANCE_DESC }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This interface encapsulates an HLSL class.
 * @remarks
 * This interface is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance">ID3D11ClassLinkage::CreateClassInstance</a>. The interface is used when binding shader resources to the pipeline using APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshader">ID3D11DeviceContext::VSSetShader</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11classinstance
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ClassInstance extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11ClassInstance
     * @type {Guid}
     */
    static IID := Guid("{a6cd7faa-b0b7-4a2f-9436-8662a65797cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ClassInstance interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetClassLinkage : IntPtr
        GetDesc         : IntPtr
        GetInstanceName : IntPtr
        GetTypeName     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ClassInstance.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID3D11ClassLinkage object associated with the current HLSL class.
     * @remarks
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<ID3D11ClassLinkage>} ppLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a> interface pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-getclasslinkage
     */
    GetClassLinkage(ppLinkage) {
        ComCall(7, this, ID3D11ClassLinkage.Ptr, ppLinkage)
    }

    /**
     * Gets a description of the current HLSL class.
     * @remarks
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see
     *           <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * An instance is not restricted to being used for a single type in a single shader. An instance is flexible and can be used for any shader that used the same type name or instance name when the instance was generated.
     *         
     * 
     * <ul>
     * <li>A created instance will work for any shader that contains a type of the same type name.
     *             For instance, a class instance created with the type name <b>DefaultShader</b> would work in any shader that contained a type <b>DefaultShader</b> even though several shaders could describe a different type.
     *           </li>
     * <li>A gotten instance maps directly to an instance name/index in a shader.
     *             A class instance acquired using GetClassInstance will work for any shader that contains a class instance of the name used to generate the runtime instance, the instance does not have to be the same type in all of the shaders it's used in.
     *           </li>
     * </ul>
     * An instance does not replace the importance of reflection for a particular shader since a gotten instance will not know its slot location and a created instance only specifies a type name.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<D3D11_CLASS_INSTANCE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_class_instance_desc">D3D11_CLASS_INSTANCE_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_class_instance_desc">D3D11_CLASS_INSTANCE_DESC</a> structure that describes the current HLSL class.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_CLASS_INSTANCE_DESC.Ptr, pDesc)
    }

    /**
     * Gets the instance name of the current HLSL class.
     * @remarks
     * GetInstanceName will return a valid name only for instances acquired using 
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance">ID3D11ClassLinkage::GetClassInstance</a>.
     *         
     * 
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see 
     *           <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {PSTR} pInstanceName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * The instance name of the current HLSL class.
     * @param {Pointer<Pointer>} pBufferLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * The length of the <i>pInstanceName</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-getinstancename
     */
    GetInstanceName(pInstanceName, pBufferLength) {
        pInstanceName := pInstanceName is String ? StrPtr(pInstanceName) : pInstanceName

        pBufferLengthMarshal := pBufferLength is VarRef ? "ptr*" : "ptr"

        ComCall(9, this, "ptr", pInstanceName, pBufferLengthMarshal, pBufferLength)
    }

    /**
     * Gets the type of the current HLSL class.
     * @remarks
     * GetTypeName will return a valid name only for instances acquired using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance">ID3D11ClassLinkage::GetClassInstance</a>.
     *         
     * 
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {PSTR} pTypeName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Type of the current HLSL class.
     * @param {Pointer<Pointer>} pBufferLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * The length of the <i>pTypeName</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-gettypename
     */
    GetTypeName(pTypeName, pBufferLength) {
        pTypeName := pTypeName is String ? StrPtr(pTypeName) : pTypeName

        pBufferLengthMarshal := pBufferLength is VarRef ? "ptr*" : "ptr"

        ComCall(10, this, "ptr", pTypeName, pBufferLengthMarshal, pBufferLength)
    }

    Query(iid) {
        if (ID3D11ClassInstance.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassLinkage := CallbackCreate(GetMethod(implObj, "GetClassLinkage"), flags, 2)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
        this.vtbl.GetInstanceName := CallbackCreate(GetMethod(implObj, "GetInstanceName"), flags, 3)
        this.vtbl.GetTypeName := CallbackCreate(GetMethod(implObj, "GetTypeName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassLinkage)
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetInstanceName)
        CallbackFree(this.vtbl.GetTypeName)
    }
}
