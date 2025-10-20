#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IScriptNode.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IScriptEntry extends IScriptNode{
    /**
     * The interface identifier for IScriptEntry
     * @type {Guid}
     */
    static IID => Guid("{0aee2a95-bcbb-11d0-8c72-00c04fc2b085}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetText(pbstr) {
        result := ComCall(13, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetText(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(14, this, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetBody(pbstr) {
        result := ComCall(15, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetBody(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(16, this, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetName(pbstr) {
        result := ComCall(17, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(18, this, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetItemName(pbstr) {
        result := ComCall(19, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetItemName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(20, this, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} ppti 
     * @param {Pointer<UInt32>} piMethod 
     * @returns {HRESULT} 
     */
    GetSignature(ppti, piMethod) {
        result := ComCall(21, this, "ptr", ppti, "uint*", piMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} pti 
     * @param {Integer} iMethod 
     * @returns {HRESULT} 
     */
    SetSignature(pti, iMethod) {
        result := ComCall(22, this, "ptr", pti, "uint", iMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pichMin 
     * @param {Pointer<UInt32>} pcch 
     * @returns {HRESULT} 
     */
    GetRange(pichMin, pcch) {
        result := ComCall(23, this, "uint*", pichMin, "uint*", pcch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
