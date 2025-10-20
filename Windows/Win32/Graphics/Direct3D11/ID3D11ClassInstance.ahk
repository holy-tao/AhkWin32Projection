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
     * 
     * @param {Pointer<ID3D11ClassLinkage>} ppLinkage 
     * @returns {String} Nothing - always returns an empty string
     */
    GetClassLinkage(ppLinkage) {
        ComCall(7, this, "ptr", ppLinkage)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_CLASS_INSTANCE_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
        return result
    }

    /**
     * 
     * @param {PSTR} pInstanceName 
     * @param {Pointer<UIntPtr>} pBufferLength 
     * @returns {String} Nothing - always returns an empty string
     */
    GetInstanceName(pInstanceName, pBufferLength) {
        ComCall(9, this, "ptr", pInstanceName, "ptr*", pBufferLength)
        return result
    }

    /**
     * 
     * @param {PSTR} pTypeName 
     * @param {Pointer<UIntPtr>} pBufferLength 
     * @returns {String} Nothing - always returns an empty string
     */
    GetTypeName(pTypeName, pBufferLength) {
        ComCall(10, this, "ptr", pTypeName, "ptr*", pBufferLength)
        return result
    }
}
