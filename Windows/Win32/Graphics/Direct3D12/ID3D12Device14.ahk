#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device13.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device14 extends ID3D12Device13{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device14
     * @type {Guid}
     */
    static IID => Guid("{5f6e592d-d895-44c2-8e4a-88ad4926d323}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 82

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRootSignatureFromSubobjectInLibrary"]

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Pointer<Void>} pLibraryBlob 
     * @param {Pointer} blobLengthInBytes 
     * @param {PWSTR} subobjectName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvRootSignature 
     * @returns {HRESULT} 
     */
    CreateRootSignatureFromSubobjectInLibrary(nodeMask, pLibraryBlob, blobLengthInBytes, subobjectName, riid, ppvRootSignature) {
        subobjectName := subobjectName is String ? StrPtr(subobjectName) : subobjectName

        pLibraryBlobMarshal := pLibraryBlob is VarRef ? "ptr" : "ptr"

        result := ComCall(82, this, "uint", nodeMask, pLibraryBlobMarshal, pLibraryBlob, "ptr", blobLengthInBytes, "ptr", subobjectName, "ptr", riid, "ptr*", ppvRootSignature, "HRESULT")
        return result
    }
}
