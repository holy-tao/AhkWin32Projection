#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcUtils extends IUnknown{
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
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    CreateBlobFromBlob(pBlob, offset, length, ppResult) {
        result := ComCall(3, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(4, this, "ptr", pData, "uint", size, "uint", codePage, "ptr", ppBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Pointer<IMalloc>} pIMalloc 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    MoveToBlob(pData, pIMalloc, size, codePage, ppBlobEncoding) {
        result := ComCall(5, this, "ptr", pData, "ptr", pIMalloc, "uint", size, "uint", codePage, "ptr", ppBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "ptr", pData, "uint", size, "uint", codePage, "ptr", ppBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<UInt32>} pCodePage 
     * @param {Pointer<IDxcBlobEncoding>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    LoadFile(pFileName, pCodePage, ppBlobEncoding) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        result := ComCall(7, this, "ptr", pFileName, "uint*", pCodePage, "ptr", ppBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    CreateReadOnlyStreamFromBlob(pBlob, ppStream) {
        result := ComCall(8, this, "ptr", pBlob, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcIncludeHandler>} ppResult 
     * @returns {HRESULT} 
     */
    CreateDefaultIncludeHandler(ppResult) {
        result := ComCall(9, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<IDxcBlobUtf8>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    GetBlobAsUtf8(pBlob, ppBlobEncoding) {
        result := ComCall(10, this, "ptr", pBlob, "ptr", ppBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<IDxcBlobUtf16>} ppBlobEncoding 
     * @returns {HRESULT} 
     */
    GetBlobAsWide(pBlob, ppBlobEncoding) {
        result := ComCall(11, this, "ptr", pBlob, "ptr", ppBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pShader 
     * @param {Integer} DxcPart 
     * @param {Pointer<Void>} ppPartData 
     * @param {Pointer<UInt32>} pPartSizeInBytes 
     * @returns {HRESULT} 
     */
    GetDxilContainerPart(pShader, DxcPart, ppPartData, pPartSizeInBytes) {
        result := ComCall(12, this, "ptr", pShader, "uint", DxcPart, "ptr", ppPartData, "uint*", pPartSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pData 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} ppvReflection 
     * @returns {HRESULT} 
     */
    CreateReflection(pData, iid, ppvReflection) {
        result := ComCall(13, this, "ptr", pData, "ptr", iid, "ptr", ppvReflection, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(14, this, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, "ptr", pArguments, "uint", argCount, "ptr", pDefines, "uint", defineCount, "ptr", ppArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pPDBBlob 
     * @param {Pointer<IDxcBlob>} ppHash 
     * @param {Pointer<IDxcBlob>} ppContainer 
     * @returns {HRESULT} 
     */
    GetPDBContents(pPDBBlob, ppHash, ppContainer) {
        result := ComCall(15, this, "ptr", pPDBBlob, "ptr", ppHash, "ptr", ppContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
