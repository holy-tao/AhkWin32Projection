#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class ICeeGen extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICeeGen
     * @type {Guid}
     */
    static IID => Guid("{7ed1bdff-8e36-11d2-9c56-00a0c9b7cc45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EmitString", "GetString", "AllocateMethodBuffer", "GetMethodBuffer", "GetIMapTokenIface", "GenerateCeeFile", "GetIlSection", "GetStringSection", "AddSectionReloc", "GetSectionCreate", "GetSectionDataLen", "GetSectionBlock", "TruncateSection", "GenerateCeeMemoryImage", "ComputePointer"]

    /**
     * 
     * @param {PWSTR} lpString 
     * @param {Pointer<Integer>} RVA 
     * @returns {HRESULT} 
     */
    EmitString(lpString, RVA) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        RVAMarshal := RVA is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", lpString, RVAMarshal, RVA, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * GetString Method Example (VC++)
     * @param {Integer} RVA 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getstring-method-example-vc
     */
    GetString(RVA) {
        result := ComCall(4, this, "uint", RVA, "ptr*", &lpString := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(5, this, "uint", cchBuffer, lpBufferMarshal, lpBuffer, RVAMarshal, RVA, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(6, this, "uint", RVA, lpBufferMarshal, lpBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetIMapTokenIface() {
        result := ComCall(7, this, "ptr*", &pIMapToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pIMapToken)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GenerateCeeFile() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} section_ 
     * @returns {HRESULT} 
     */
    GetIlSection(section_) {
        section_Marshal := section_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, section_Marshal, section_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} section_ 
     * @returns {HRESULT} 
     */
    GetStringSection(section_) {
        section_Marshal := section_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, section_Marshal, section_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section_ 
     * @param {Integer} offset 
     * @param {Pointer<Void>} relativeTo 
     * @param {Integer} relocType 
     * @returns {HRESULT} 
     */
    AddSectionReloc(section_, offset, relativeTo, relocType) {
        section_Marshal := section_ is VarRef ? "ptr" : "ptr"
        relativeToMarshal := relativeTo is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, section_Marshal, section_, "uint", offset, relativeToMarshal, relativeTo, "int", relocType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} flags 
     * @param {Pointer<Pointer<Void>>} section_ 
     * @returns {HRESULT} 
     */
    GetSectionCreate(name, flags, section_) {
        name := name is String ? StrPtr(name) : name

        section_Marshal := section_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", name, "uint", flags, section_Marshal, section_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section_ 
     * @param {Pointer<Integer>} dataLen 
     * @returns {HRESULT} 
     */
    GetSectionDataLen(section_, dataLen) {
        section_Marshal := section_ is VarRef ? "ptr" : "ptr"
        dataLenMarshal := dataLen is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, section_Marshal, section_, dataLenMarshal, dataLen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section_ 
     * @param {Integer} len 
     * @param {Integer} align 
     * @param {Pointer<Pointer<Void>>} ppBytes 
     * @returns {HRESULT} 
     */
    GetSectionBlock(section_, len, align, ppBytes) {
        section_Marshal := section_ is VarRef ? "ptr" : "ptr"
        ppBytesMarshal := ppBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, section_Marshal, section_, "uint", len, "uint", align, ppBytesMarshal, ppBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section_ 
     * @param {Integer} len 
     * @returns {HRESULT} 
     */
    TruncateSection(section_, len) {
        section_Marshal := section_ is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, section_Marshal, section_, "uint", len, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppImage 
     * @returns {HRESULT} 
     */
    GenerateCeeMemoryImage(ppImage) {
        ppImageMarshal := ppImage is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, ppImageMarshal, ppImage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section_ 
     * @param {Integer} RVA 
     * @param {Pointer<Pointer<Integer>>} lpBuffer 
     * @returns {HRESULT} 
     */
    ComputePointer(section_, RVA, lpBuffer) {
        section_Marshal := section_ is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, section_Marshal, section_, "uint", RVA, lpBufferMarshal, lpBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
