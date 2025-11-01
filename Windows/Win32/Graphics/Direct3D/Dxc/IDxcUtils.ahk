#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcUtils extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcUtils
     * @type {Guid}
     */
    static IID => Guid("{4605c4cb-2019-492a-ada4-65f20bb7d67f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBlobFromBlob", "CreateBlobFromPinned", "MoveToBlob", "CreateBlob", "LoadFile", "CreateReadOnlyStreamFromBlob", "CreateDefaultIncludeHandler", "GetBlobAsUtf8", "GetBlobAsWide", "GetDxilContainerPart", "CreateReflection", "BuildArguments", "GetPDBContents"]

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    CreateBlobFromBlob(pBlob, offset, length, ppResult) {
        result := ComCall(3, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    CreateBlobFromPinned(pData, size, codePage, ppBlobEncoding) {
        result := ComCall(4, this, "ptr", pData, "uint", size, "uint", codePage, "ptr*", ppBlobEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {IMalloc} pIMalloc 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    MoveToBlob(pData, pIMalloc, size, codePage, ppBlobEncoding) {
        result := ComCall(5, this, "ptr", pData, "ptr", pIMalloc, "uint", size, "uint", codePage, "ptr*", ppBlobEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    CreateBlob(pData, size, codePage, ppBlobEncoding) {
        result := ComCall(6, this, "ptr", pData, "uint", size, "uint", codePage, "ptr*", ppBlobEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<Integer>} pCodePage 
     * @param {Pointer<IDxcBlobEncoding>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    LoadFile(pFileName, pCodePage, ppBlobEncoding) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        pCodePageMarshal := pCodePage is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pFileName, pCodePageMarshal, pCodePage, "ptr*", ppBlobEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    CreateReadOnlyStreamFromBlob(pBlob, ppStream) {
        result := ComCall(8, this, "ptr", pBlob, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcIncludeHandler>} ppResult 
     * @returns {HRESULT} 
     */
    CreateDefaultIncludeHandler(ppResult) {
        result := ComCall(9, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Pointer<IDxcBlobUtf8>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    GetBlobAsUtf8(pBlob, ppBlobEncoding) {
        result := ComCall(10, this, "ptr", pBlob, "ptr*", ppBlobEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Pointer<IDxcBlobUtf16>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    GetBlobAsWide(pBlob, ppBlobEncoding) {
        result := ComCall(11, this, "ptr", pBlob, "ptr*", ppBlobEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pShader 
     * @param {Integer} DxcPart 
     * @param {Pointer<Pointer<Void>>} ppPartData 
     * @param {Pointer<Integer>} pPartSizeInBytes 
     * @returns {HRESULT} 
     */
    GetDxilContainerPart(pShader, DxcPart, ppPartData, pPartSizeInBytes) {
        pPartSizeInBytesMarshal := pPartSizeInBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pShader, "uint", DxcPart, "ptr*", ppPartData, pPartSizeInBytesMarshal, pPartSizeInBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pData 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvReflection 
     * @returns {HRESULT} 
     */
    CreateReflection(pData, iid, ppvReflection) {
        result := ComCall(13, this, "ptr", pData, "ptr", iid, "ptr*", ppvReflection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pSourceName 
     * @param {PWSTR} pEntryPoint 
     * @param {PWSTR} pTargetProfile 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @param {Pointer<DxcDefine>} pDefines 
     * @param {Integer} defineCount 
     * @param {Pointer<IDxcCompilerArgs>} ppArgs 
     * @returns {HRESULT} 
     */
    BuildArguments(pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, ppArgs) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntryPoint := pEntryPoint is String ? StrPtr(pEntryPoint) : pEntryPoint
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        result := ComCall(14, this, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, "ptr", pArguments, "uint", argCount, "ptr", pDefines, "uint", defineCount, "ptr*", ppArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcBlob} pPDBBlob 
     * @param {Pointer<IDxcBlob>} ppHash 
     * @param {Pointer<IDxcBlob>} ppContainer 
     * @returns {HRESULT} 
     */
    GetPDBContents(pPDBBlob, ppHash, ppContainer) {
        result := ComCall(15, this, "ptr", pPDBBlob, "ptr*", ppHash, "ptr*", ppContainer, "HRESULT")
        return result
    }
}
