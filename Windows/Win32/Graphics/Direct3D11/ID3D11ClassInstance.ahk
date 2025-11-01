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
     * 
     * @param {Pointer<ID3D11ClassLinkage>} ppLinkage 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-getclasslinkage
     */
    GetClassLinkage(ppLinkage) {
        ComCall(7, this, "ptr*", ppLinkage)
    }

    /**
     * 
     * @param {Pointer<D3D11_CLASS_INSTANCE_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }

    /**
     * 
     * @param {PSTR} pInstanceName 
     * @param {Pointer<Pointer>} pBufferLength 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-getinstancename
     */
    GetInstanceName(pInstanceName, pBufferLength) {
        pInstanceName := pInstanceName is String ? StrPtr(pInstanceName) : pInstanceName

        pBufferLengthMarshal := pBufferLength is VarRef ? "ptr*" : "ptr"

        ComCall(9, this, "ptr", pInstanceName, pBufferLengthMarshal, pBufferLength)
    }

    /**
     * 
     * @param {PSTR} pTypeName 
     * @param {Pointer<Pointer>} pBufferLength 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11classinstance-gettypename
     */
    GetTypeName(pTypeName, pBufferLength) {
        pTypeName := pTypeName is String ? StrPtr(pTypeName) : pTypeName

        pBufferLengthMarshal := pBufferLength is VarRef ? "ptr*" : "ptr"

        ComCall(10, this, "ptr", pTypeName, pBufferLengthMarshal, pBufferLength)
    }
}
