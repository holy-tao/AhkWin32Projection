#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcCompilerArgs.ahk" { IDxcCompilerArgs }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import ".\DxcDefine.ahk" { DxcDefine }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\System\Com\IMalloc.ahk" { IMalloc }
#Import ".\DxcBuffer.ahk" { DxcBuffer }
#Import ".\IDxcBlob.ahk" { IDxcBlob }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDxcIncludeHandler.ahk" { IDxcIncludeHandler }
#Import ".\IDxcBlobUtf16.ahk" { IDxcBlobUtf16 }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlobUtf8.ahk" { IDxcBlobUtf8 }
#Import ".\DXC_CP.ahk" { DXC_CP }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcUtils extends IUnknown {
    /**
     * The interface identifier for IDxcUtils
     * @type {Guid}
     */
    static IID := Guid("{4605c4cb-2019-492a-ada4-65f20bb7d67f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcUtils interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateBlobFromBlob           : IntPtr
        CreateBlobFromPinned         : IntPtr
        MoveToBlob                   : IntPtr
        CreateBlob                   : IntPtr
        LoadFile                     : IntPtr
        CreateReadOnlyStreamFromBlob : IntPtr
        CreateDefaultIncludeHandler  : IntPtr
        GetBlobAsUtf8                : IntPtr
        GetBlobAsWide                : IntPtr
        GetDxilContainerPart         : IntPtr
        CreateReflection             : IntPtr
        BuildArguments               : IntPtr
        GetPDBContents               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcUtils.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @returns {IDxcBlob} 
     */
    CreateBlobFromBlob(pBlob, offset, length) {
        result := ComCall(3, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * 
     * @param {Integer} pData 
     * @param {Integer} _size 
     * @param {DXC_CP} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobFromPinned(pData, _size, codePage) {
        result := ComCall(4, this, "ptr", pData, "uint", _size, DXC_CP, codePage, "ptr*", &ppBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(ppBlobEncoding)
    }

    /**
     * 
     * @param {Integer} pData 
     * @param {IMalloc} pIMalloc 
     * @param {Integer} _size 
     * @param {DXC_CP} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    MoveToBlob(pData, pIMalloc, _size, codePage) {
        result := ComCall(5, this, "ptr", pData, "ptr", pIMalloc, "uint", _size, DXC_CP, codePage, "ptr*", &ppBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(ppBlobEncoding)
    }

    /**
     * The CreateBlob function creates an empty BLOB.
     * @param {Integer} pData 
     * @param {Integer} _size 
     * @param {DXC_CP} codePage 
     * @returns {IDxcBlobEncoding} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/createblob
     */
    CreateBlob(pData, _size, codePage) {
        result := ComCall(6, this, "ptr", pData, "uint", _size, DXC_CP, codePage, "ptr*", &ppBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(ppBlobEncoding)
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<DXC_CP>} pCodePage 
     * @returns {IDxcBlobEncoding} 
     */
    LoadFile(pFileName, pCodePage) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        pCodePageMarshal := pCodePage is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pFileName, pCodePageMarshal, pCodePage, "ptr*", &ppBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(ppBlobEncoding)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {IStream} 
     */
    CreateReadOnlyStreamFromBlob(pBlob) {
        result := ComCall(8, this, "ptr", pBlob, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * 
     * @returns {IDxcIncludeHandler} 
     */
    CreateDefaultIncludeHandler() {
        result := ComCall(9, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcIncludeHandler(ppResult)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {IDxcBlobUtf8} 
     */
    GetBlobAsUtf8(pBlob) {
        result := ComCall(10, this, "ptr", pBlob, "ptr*", &ppBlobEncoding := 0, "HRESULT")
        return IDxcBlobUtf8(ppBlobEncoding)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {IDxcBlobUtf16} 
     */
    GetBlobAsWide(pBlob) {
        result := ComCall(11, this, "ptr", pBlob, "ptr*", &ppBlobEncoding := 0, "HRESULT")
        return IDxcBlobUtf16(ppBlobEncoding)
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

        result := ComCall(12, this, DxcBuffer.Ptr, pShader, "uint", DxcPart, ppPartDataMarshal, ppPartData, pPartSizeInBytesMarshal, pPartSizeInBytes, "HRESULT")
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

        result := ComCall(13, this, DxcBuffer.Ptr, pData, Guid.Ptr, iid, ppvReflectionMarshal, ppvReflection, "HRESULT")
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
     * @returns {IDxcCompilerArgs} 
     */
    BuildArguments(pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntryPoint := pEntryPoint is String ? StrPtr(pEntryPoint) : pEntryPoint
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "ptr", pSourceName, "ptr", pEntryPoint, "ptr", pTargetProfile, pArgumentsMarshal, pArguments, "uint", argCount, DxcDefine.Ptr, pDefines, "uint", defineCount, "ptr*", &ppArgs := 0, "HRESULT")
        return IDxcCompilerArgs(ppArgs)
    }

    /**
     * 
     * @param {IDxcBlob} pPDBBlob 
     * @param {Pointer<IDxcBlob>} ppHash 
     * @param {Pointer<IDxcBlob>} ppContainer 
     * @returns {HRESULT} 
     */
    GetPDBContents(pPDBBlob, ppHash, ppContainer) {
        result := ComCall(15, this, "ptr", pPDBBlob, IDxcBlob.Ptr, ppHash, IDxcBlob.Ptr, ppContainer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDxcUtils.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBlobFromBlob := CallbackCreate(GetMethod(implObj, "CreateBlobFromBlob"), flags, 5)
        this.vtbl.CreateBlobFromPinned := CallbackCreate(GetMethod(implObj, "CreateBlobFromPinned"), flags, 5)
        this.vtbl.MoveToBlob := CallbackCreate(GetMethod(implObj, "MoveToBlob"), flags, 6)
        this.vtbl.CreateBlob := CallbackCreate(GetMethod(implObj, "CreateBlob"), flags, 5)
        this.vtbl.LoadFile := CallbackCreate(GetMethod(implObj, "LoadFile"), flags, 4)
        this.vtbl.CreateReadOnlyStreamFromBlob := CallbackCreate(GetMethod(implObj, "CreateReadOnlyStreamFromBlob"), flags, 3)
        this.vtbl.CreateDefaultIncludeHandler := CallbackCreate(GetMethod(implObj, "CreateDefaultIncludeHandler"), flags, 2)
        this.vtbl.GetBlobAsUtf8 := CallbackCreate(GetMethod(implObj, "GetBlobAsUtf8"), flags, 3)
        this.vtbl.GetBlobAsWide := CallbackCreate(GetMethod(implObj, "GetBlobAsWide"), flags, 3)
        this.vtbl.GetDxilContainerPart := CallbackCreate(GetMethod(implObj, "GetDxilContainerPart"), flags, 5)
        this.vtbl.CreateReflection := CallbackCreate(GetMethod(implObj, "CreateReflection"), flags, 4)
        this.vtbl.BuildArguments := CallbackCreate(GetMethod(implObj, "BuildArguments"), flags, 9)
        this.vtbl.GetPDBContents := CallbackCreate(GetMethod(implObj, "GetPDBContents"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBlobFromBlob)
        CallbackFree(this.vtbl.CreateBlobFromPinned)
        CallbackFree(this.vtbl.MoveToBlob)
        CallbackFree(this.vtbl.CreateBlob)
        CallbackFree(this.vtbl.LoadFile)
        CallbackFree(this.vtbl.CreateReadOnlyStreamFromBlob)
        CallbackFree(this.vtbl.CreateDefaultIncludeHandler)
        CallbackFree(this.vtbl.GetBlobAsUtf8)
        CallbackFree(this.vtbl.GetBlobAsWide)
        CallbackFree(this.vtbl.GetDxilContainerPart)
        CallbackFree(this.vtbl.CreateReflection)
        CallbackFree(this.vtbl.BuildArguments)
        CallbackFree(this.vtbl.GetPDBContents)
    }
}
