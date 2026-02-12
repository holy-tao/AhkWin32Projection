#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcBlob.ahk
#Include .\IDxcBlobEncoding.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include .\IDxcIncludeHandler.ahk
#Include .\IDxcBlobUtf8.ahk
#Include .\IDxcBlobUtf16.ahk
#Include .\IDxcCompilerArgs.ahk
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
     * @returns {Pointer<IDxcBlob>} 
     */
    CreateBlobFromBlob(pBlob, offset, length) {
        result := ComCall(3, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} size_ 
     * @param {Integer} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    CreateBlobFromPinned(pData, size_, codePage) {
        result := ComCall(4, this, "ptr", pData, "uint", size_, "uint", codePage, "ptr*", &ppBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlobEncoding
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {IMalloc} pIMalloc 
     * @param {Integer} size_ 
     * @param {Integer} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    MoveToBlob(pData, pIMalloc, size_, codePage) {
        result := ComCall(5, this, "ptr", pData, "ptr", pIMalloc, "uint", size_, "uint", codePage, "ptr*", &ppBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlobEncoding
    }

    /**
     * The CreateBlob function creates an empty BLOB.
     * @param {Pointer} pData 
     * @param {Integer} size_ 
     * @param {Integer} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/createblob
     */
    CreateBlob(pData, size_, codePage) {
        result := ComCall(6, this, "ptr", pData, "uint", size_, "uint", codePage, "ptr*", &ppBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlobEncoding
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<Integer>} pCodePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    LoadFile(pFileName, pCodePage) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        pCodePageMarshal := pCodePage is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pFileName, pCodePageMarshal, pCodePage, "ptr*", &ppBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlobEncoding
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {Pointer<IStream>} 
     */
    CreateReadOnlyStreamFromBlob(pBlob) {
        result := ComCall(8, this, "ptr", pBlob, "ptr*", &ppStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppStream
    }

    /**
     * 
     * @returns {Pointer<IDxcIncludeHandler>} 
     */
    CreateDefaultIncludeHandler() {
        result := ComCall(9, this, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {Pointer<IDxcBlobUtf8>} 
     */
    GetBlobAsUtf8(pBlob) {
        result := ComCall(10, this, "ptr", pBlob, "ptr*", &ppBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlobEncoding
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {Pointer<IDxcBlobUtf16>} 
     */
    GetBlobAsWide(pBlob) {
        result := ComCall(11, this, "ptr", pBlob, "ptr*", &ppBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlobEncoding
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
        ppPartDataMarshal := ppPartData is VarRef ? "ptr*" : "ptr"
        pPartSizeInBytesMarshal := pPartSizeInBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pShader, "uint", DxcPart, ppPartDataMarshal, ppPartData, pPartSizeInBytesMarshal, pPartSizeInBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        ppvReflectionMarshal := ppvReflection is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pData, "ptr", iid, ppvReflectionMarshal, ppvReflection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<IDxcCompilerArgs>} 
     */
    BuildArguments(pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntryPoint := pEntryPoint is String ? StrPtr(pEntryPoint) : pEntryPoint
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, pArgumentsMarshal, pArguments, "uint", argCount, "ptr", pDefines, "uint", defineCount, "ptr*", &ppArgs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppArgs
    }

    /**
     * 
     * @param {IDxcBlob} pPDBBlob 
     * @param {Pointer<Pointer<IDxcBlob>>} ppHash 
     * @param {Pointer<Pointer<IDxcBlob>>} ppContainer 
     * @returns {HRESULT} 
     */
    GetPDBContents(pPDBBlob, ppHash, ppContainer) {
        result := ComCall(15, this, "ptr", pPDBBlob, "ptr*", ppHash, "ptr*", ppContainer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
