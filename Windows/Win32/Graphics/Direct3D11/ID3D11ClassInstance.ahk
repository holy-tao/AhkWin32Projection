#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * This interface encapsulates an HLSL class.
 * @remarks
 * 
 * This interface is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance">ID3D11ClassLinkage::CreateClassInstance</a>. The interface is used when binding shader resources to the pipeline using APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshader">ID3D11DeviceContext::VSSetShader</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11classinstance
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ClassInstance extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ClassInstance
     * @type {Guid}
     */
    static IID => Guid("{a6cd7faa-b0b7-4a2f-9436-8662a65797cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassLinkage", "GetDesc", "GetInstanceName", "GetTypeName"]

    /**
     * Gets the ID3D11ClassLinkage object associated with the current HLSL class.
     * @remarks
     * 
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<ID3D11ClassLinkage>} ppLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a> interface pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11classinstance-getclasslinkage
     */
    GetClassLinkage(ppLinkage) {
        ComCall(7, this, "ptr*", ppLinkage)
    }

    /**
     * Gets a description of the current HLSL class.
     * @remarks
     * 
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see
     *           <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * An instance is not restricted to being used for a single type in a single shader. An instance is flexible and can be used for any shader that used the same type name or instance name when the instance was generated.
     *         
     * 
     * <ul>
     * <li>A created instance will work for any shader that contains a type of the same type name.
     *             For instance, a class instance created with the type name <b>DefaultShader</b> would work in any shader that contained a type <b>DefaultShader</b>even though several shaders could describe a different type.
     *           </li>
     * <li>A gotten instance maps directly to an instance name/index in a shader.
     *             A class instance aquired using GetClassInstance will work for any shader that contains a class instance of the name used to generate the runtime instance, the instance does not have to be the same type in all of the shaders it's used in.
     *           </li>
     * </ul>
     * An instance does not replace the importance of reflection for a particular shader since a gotten instance will not know its slot location and a created instance only specifies a type name.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<D3D11_CLASS_INSTANCE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_class_instance_desc">D3D11_CLASS_INSTANCE_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_class_instance_desc">D3D11_CLASS_INSTANCE_DESC</a> structure that describes the current HLSL class.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11classinstance-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }

    /**
     * Gets the instance name of the current HLSL class.
     * @remarks
     * 
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
     * 
     * 
     * @param {PSTR} pInstanceName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * The instance name of the current HLSL class.
     * @param {Pointer<Pointer>} pBufferLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * The length of the <i>pInstanceName</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11classinstance-getinstancename
     */
    GetInstanceName(pInstanceName, pBufferLength) {
        pInstanceName := pInstanceName is String ? StrPtr(pInstanceName) : pInstanceName

        pBufferLengthMarshal := pBufferLength is VarRef ? "ptr*" : "ptr"

        ComCall(9, this, "ptr", pInstanceName, pBufferLengthMarshal, pBufferLength)
    }

    /**
     * Gets the type of the current HLSL class.
     * @remarks
     * 
     * GetTypeName will return a valid name only for instances acquired using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance">ID3D11ClassLinkage::GetClassInstance</a>.
     *         
     * 
     * For more information about using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {PSTR} pTypeName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Type of the current HLSL class.
     * @param {Pointer<Pointer>} pBufferLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * The length of the <i>pTypeName</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11classinstance-gettypename
     */
    GetTypeName(pTypeName, pBufferLength) {
        pTypeName := pTypeName is String ? StrPtr(pTypeName) : pTypeName

        pBufferLengthMarshal := pBufferLength is VarRef ? "ptr*" : "ptr"

        ComCall(10, this, "ptr", pTypeName, pBufferLengthMarshal, pBufferLength)
    }
}
