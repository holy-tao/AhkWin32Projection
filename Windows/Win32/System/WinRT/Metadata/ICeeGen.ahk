#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class ICeeGen extends IUnknown{
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
     * 
     * @param {PWSTR} lpString 
     * @param {Pointer<UInt32>} RVA 
     * @returns {HRESULT} 
     */
    EmitString(lpString, RVA) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := ComCall(3, this, "ptr", lpString, "uint*", RVA, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RVA 
     * @param {Pointer<PWSTR>} lpString 
     * @returns {HRESULT} 
     */
    GetString(RVA, lpString) {
        result := ComCall(4, this, "uint", RVA, "ptr", lpString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Byte>} lpBuffer 
     * @param {Pointer<UInt32>} RVA 
     * @returns {HRESULT} 
     */
    AllocateMethodBuffer(cchBuffer, lpBuffer, RVA) {
        result := ComCall(5, this, "uint", cchBuffer, "char*", lpBuffer, "uint*", RVA, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RVA 
     * @param {Pointer<Byte>} lpBuffer 
     * @returns {HRESULT} 
     */
    GetMethodBuffer(RVA, lpBuffer) {
        result := ComCall(6, this, "uint", RVA, "char*", lpBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pIMapToken 
     * @returns {HRESULT} 
     */
    GetIMapTokenIface(pIMapToken) {
        result := ComCall(7, this, "ptr", pIMapToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GenerateCeeFile() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @returns {HRESULT} 
     */
    GetIlSection(section) {
        result := ComCall(9, this, "ptr", section, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @returns {HRESULT} 
     */
    GetStringSection(section) {
        result := ComCall(10, this, "ptr", section, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(11, this, "ptr", section, "uint", offset, "ptr", relativeTo, "int", relocType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} flags 
     * @param {Pointer<Void>} section 
     * @returns {HRESULT} 
     */
    GetSectionCreate(name, flags, section) {
        result := ComCall(12, this, "ptr", name, "uint", flags, "ptr", section, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Pointer<UInt32>} dataLen 
     * @returns {HRESULT} 
     */
    GetSectionDataLen(section, dataLen) {
        result := ComCall(13, this, "ptr", section, "uint*", dataLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Integer} len 
     * @param {Integer} align 
     * @param {Pointer<Void>} ppBytes 
     * @returns {HRESULT} 
     */
    GetSectionBlock(section, len, align, ppBytes) {
        result := ComCall(14, this, "ptr", section, "uint", len, "uint", align, "ptr", ppBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Integer} len 
     * @returns {HRESULT} 
     */
    TruncateSection(section, len) {
        result := ComCall(15, this, "ptr", section, "uint", len, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ppImage 
     * @returns {HRESULT} 
     */
    GenerateCeeMemoryImage(ppImage) {
        result := ComCall(16, this, "ptr", ppImage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} section 
     * @param {Integer} RVA 
     * @param {Pointer<Byte>} lpBuffer 
     * @returns {HRESULT} 
     */
    ComputePointer(section, RVA, lpBuffer) {
        result := ComCall(17, this, "ptr", section, "uint", RVA, "char*", lpBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
