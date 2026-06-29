#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\CeeSectionRelocType.ahk" { CeeSectionRelocType }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct ICeeGen extends IUnknown {
    /**
     * The interface identifier for ICeeGen
     * @type {Guid}
     */
    static IID := Guid("{7ed1bdff-8e36-11d2-9c56-00a0c9b7cc45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICeeGen interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EmitString             : IntPtr
        GetString              : IntPtr
        AllocateMethodBuffer   : IntPtr
        GetMethodBuffer        : IntPtr
        GetIMapTokenIface      : IntPtr
        GenerateCeeFile        : IntPtr
        GetIlSection           : IntPtr
        GetStringSection       : IntPtr
        AddSectionReloc        : IntPtr
        GetSectionCreate       : IntPtr
        GetSectionDataLen      : IntPtr
        GetSectionBlock        : IntPtr
        TruncateSection        : IntPtr
        GenerateCeeMemoryImage : IntPtr
        ComputePointer         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICeeGen.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} lpString 
     * @param {Pointer<Integer>} RVA 
     * @returns {HRESULT} 
     */
    EmitString(lpString, RVA) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        RVAMarshal := RVA is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", lpString, RVAMarshal, RVA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RVA 
     * @returns {PWSTR} 
     */
    GetString(RVA) {
        result := ComCall(4, this, "uint", RVA, PWSTR.Ptr, &lpString := 0, "HRESULT")
        return lpString
    }

    /**
     * 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Pointer<Integer>>} lpBuffer 
     * @param {Pointer<Integer>} RVA 
     * @returns {HRESULT} 
     */
    AllocateMethodBuffer(cchBuffer, lpBuffer, RVA) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr*" : "ptr"
        RVAMarshal := RVA is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cchBuffer, lpBufferMarshal, lpBuffer, RVAMarshal, RVA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RVA 
     * @param {Pointer<Pointer<Integer>>} lpBuffer 
     * @returns {HRESULT} 
     */
    GetMethodBuffer(RVA, lpBuffer) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", RVA, lpBufferMarshal, lpBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetIMapTokenIface() {
        result := ComCall(7, this, "ptr*", &pIMapToken := 0, "HRESULT")
        return IUnknown(pIMapToken)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GenerateCeeFile() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} _section 
     * @returns {HRESULT} 
     */
    GetIlSection(_section) {
        _sectionMarshal := _section is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, _sectionMarshal, _section, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} _section 
     * @returns {HRESULT} 
     */
    GetStringSection(_section) {
        _sectionMarshal := _section is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, _sectionMarshal, _section, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _section 
     * @param {Integer} offset 
     * @param {Pointer<Void>} relativeTo 
     * @param {CeeSectionRelocType} relocType 
     * @returns {HRESULT} 
     */
    AddSectionReloc(_section, offset, relativeTo, relocType) {
        _sectionMarshal := _section is VarRef ? "ptr" : "ptr"
        relativeToMarshal := relativeTo is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, _sectionMarshal, _section, "uint", offset, relativeToMarshal, relativeTo, CeeSectionRelocType, relocType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} flags 
     * @param {Pointer<Pointer<Void>>} _section 
     * @returns {HRESULT} 
     */
    GetSectionCreate(name, flags, _section) {
        name := name is String ? StrPtr(name) : name

        _sectionMarshal := _section is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", name, "uint", flags, _sectionMarshal, _section, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _section 
     * @param {Pointer<Integer>} dataLen 
     * @returns {HRESULT} 
     */
    GetSectionDataLen(_section, dataLen) {
        _sectionMarshal := _section is VarRef ? "ptr" : "ptr"
        dataLenMarshal := dataLen is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, _sectionMarshal, _section, dataLenMarshal, dataLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _section 
     * @param {Integer} len 
     * @param {Integer} align 
     * @param {Pointer<Pointer<Void>>} ppBytes 
     * @returns {HRESULT} 
     */
    GetSectionBlock(_section, len, align, ppBytes) {
        _sectionMarshal := _section is VarRef ? "ptr" : "ptr"
        ppBytesMarshal := ppBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, _sectionMarshal, _section, "uint", len, "uint", align, ppBytesMarshal, ppBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _section 
     * @param {Integer} len 
     * @returns {HRESULT} 
     */
    TruncateSection(_section, len) {
        _sectionMarshal := _section is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, _sectionMarshal, _section, "uint", len, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppImage 
     * @returns {HRESULT} 
     */
    GenerateCeeMemoryImage(ppImage) {
        ppImageMarshal := ppImage is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, ppImageMarshal, ppImage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _section 
     * @param {Integer} RVA 
     * @param {Pointer<Pointer<Integer>>} lpBuffer 
     * @returns {HRESULT} 
     */
    ComputePointer(_section, RVA, lpBuffer) {
        _sectionMarshal := _section is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, _sectionMarshal, _section, "uint", RVA, lpBufferMarshal, lpBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICeeGen.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EmitString := CallbackCreate(GetMethod(implObj, "EmitString"), flags, 3)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 3)
        this.vtbl.AllocateMethodBuffer := CallbackCreate(GetMethod(implObj, "AllocateMethodBuffer"), flags, 4)
        this.vtbl.GetMethodBuffer := CallbackCreate(GetMethod(implObj, "GetMethodBuffer"), flags, 3)
        this.vtbl.GetIMapTokenIface := CallbackCreate(GetMethod(implObj, "GetIMapTokenIface"), flags, 2)
        this.vtbl.GenerateCeeFile := CallbackCreate(GetMethod(implObj, "GenerateCeeFile"), flags, 1)
        this.vtbl.GetIlSection := CallbackCreate(GetMethod(implObj, "GetIlSection"), flags, 2)
        this.vtbl.GetStringSection := CallbackCreate(GetMethod(implObj, "GetStringSection"), flags, 2)
        this.vtbl.AddSectionReloc := CallbackCreate(GetMethod(implObj, "AddSectionReloc"), flags, 5)
        this.vtbl.GetSectionCreate := CallbackCreate(GetMethod(implObj, "GetSectionCreate"), flags, 4)
        this.vtbl.GetSectionDataLen := CallbackCreate(GetMethod(implObj, "GetSectionDataLen"), flags, 3)
        this.vtbl.GetSectionBlock := CallbackCreate(GetMethod(implObj, "GetSectionBlock"), flags, 5)
        this.vtbl.TruncateSection := CallbackCreate(GetMethod(implObj, "TruncateSection"), flags, 3)
        this.vtbl.GenerateCeeMemoryImage := CallbackCreate(GetMethod(implObj, "GenerateCeeMemoryImage"), flags, 2)
        this.vtbl.ComputePointer := CallbackCreate(GetMethod(implObj, "ComputePointer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EmitString)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.AllocateMethodBuffer)
        CallbackFree(this.vtbl.GetMethodBuffer)
        CallbackFree(this.vtbl.GetIMapTokenIface)
        CallbackFree(this.vtbl.GenerateCeeFile)
        CallbackFree(this.vtbl.GetIlSection)
        CallbackFree(this.vtbl.GetStringSection)
        CallbackFree(this.vtbl.AddSectionReloc)
        CallbackFree(this.vtbl.GetSectionCreate)
        CallbackFree(this.vtbl.GetSectionDataLen)
        CallbackFree(this.vtbl.GetSectionBlock)
        CallbackFree(this.vtbl.TruncateSection)
        CallbackFree(this.vtbl.GenerateCeeMemoryImage)
        CallbackFree(this.vtbl.ComputePointer)
    }
}
