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

        result := ComCall(3, this, "ptr", lpString, RVAMarshal, RVA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RVA 
     * @param {Pointer<PWSTR>} lpString 
     * @returns {HRESULT} 
     */
    GetString(RVA, lpString) {
        result := ComCall(4, this, "uint", RVA, "ptr", lpString, "HRESULT")
        return result
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
     * @param {Pointer<IUnknown>} pIMapToken 
     * @returns {HRESULT} 
     */
    GetIMapTokenIface(pIMapToken) {
        result := ComCall(7, this, "ptr*", pIMapToken, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<Void>>} section 
     * @returns {HRESULT} 
     */
    GetIlSection(section) {
        sectionMarshal := section is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, sectionMarshal, section, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} section 
     * @returns {HRESULT} 
     */
    GetStringSection(section) {
        sectionMarshal := section is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, sectionMarshal, section, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Integer} offset 
     * @param {Pointer<Void>} relativeTo 
     * @param {Integer} relocType 
     * @returns {HRESULT} 
     */
    AddSectionReloc(section, offset, relativeTo, relocType) {
        sectionMarshal := section is VarRef ? "ptr" : "ptr"
        relativeToMarshal := relativeTo is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, sectionMarshal, section, "uint", offset, relativeToMarshal, relativeTo, "int", relocType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} flags 
     * @param {Pointer<Pointer<Void>>} section 
     * @returns {HRESULT} 
     */
    GetSectionCreate(name, flags, section) {
        name := name is String ? StrPtr(name) : name

        sectionMarshal := section is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", name, "uint", flags, sectionMarshal, section, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Pointer<Integer>} dataLen 
     * @returns {HRESULT} 
     */
    GetSectionDataLen(section, dataLen) {
        sectionMarshal := section is VarRef ? "ptr" : "ptr"
        dataLenMarshal := dataLen is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, sectionMarshal, section, dataLenMarshal, dataLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Integer} len 
     * @param {Integer} align 
     * @param {Pointer<Pointer<Void>>} ppBytes 
     * @returns {HRESULT} 
     */
    GetSectionBlock(section, len, align, ppBytes) {
        sectionMarshal := section is VarRef ? "ptr" : "ptr"
        ppBytesMarshal := ppBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, sectionMarshal, section, "uint", len, "uint", align, ppBytesMarshal, ppBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Integer} len 
     * @returns {HRESULT} 
     */
    TruncateSection(section, len) {
        sectionMarshal := section is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, sectionMarshal, section, "uint", len, "HRESULT")
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
     * @param {Pointer<Void>} section 
     * @param {Integer} RVA 
     * @param {Pointer<Pointer<Integer>>} lpBuffer 
     * @returns {HRESULT} 
     */
    ComputePointer(section, RVA, lpBuffer) {
        sectionMarshal := section is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, sectionMarshal, section, "uint", RVA, lpBufferMarshal, lpBuffer, "HRESULT")
        return result
    }
}
