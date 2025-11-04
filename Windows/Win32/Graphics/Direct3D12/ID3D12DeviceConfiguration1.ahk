#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceConfiguration.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceConfiguration1 extends ID3D12DeviceConfiguration{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceConfiguration1
     * @type {Guid}
     */
    static IID => Guid("{ed342442-6343-4e16-bb82-a3a577874e56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary"]

    /**
     * 
     * @param {Pointer} pLibraryBlob 
     * @param {Pointer} Size 
     * @param {PWSTR} RootSignatureSubobjectName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvDeserializer 
     * @returns {HRESULT} 
     */
    CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary(pLibraryBlob, Size, RootSignatureSubobjectName, riid, ppvDeserializer) {
        RootSignatureSubobjectName := RootSignatureSubobjectName is String ? StrPtr(RootSignatureSubobjectName) : RootSignatureSubobjectName

        ppvDeserializerMarshal := ppvDeserializer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pLibraryBlob, "ptr", Size, "ptr", RootSignatureSubobjectName, "ptr", riid, ppvDeserializerMarshal, ppvDeserializer, "HRESULT")
        return result
    }
}
