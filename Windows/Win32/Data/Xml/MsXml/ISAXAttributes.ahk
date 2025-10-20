#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXAttributes extends IUnknown{
    /**
     * The interface identifier for ISAXAttributes
     * @type {Guid}
     */
    static IID => Guid("{f078abe1-45d2-4832-91ea-4466ce2f25c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pnLength 
     * @returns {HRESULT} 
     */
    getLength(pnLength) {
        result := ComCall(3, this, "int*", pnLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<UInt16>} ppwchUri 
     * @param {Pointer<Int32>} pcchUri 
     * @returns {HRESULT} 
     */
    getURI(nIndex, ppwchUri, pcchUri) {
        result := ComCall(4, this, "int", nIndex, "ushort*", ppwchUri, "int*", pcchUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<UInt16>} ppwchLocalName 
     * @param {Pointer<Int32>} pcchLocalName 
     * @returns {HRESULT} 
     */
    getLocalName(nIndex, ppwchLocalName, pcchLocalName) {
        result := ComCall(5, this, "int", nIndex, "ushort*", ppwchLocalName, "int*", pcchLocalName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<UInt16>} ppwchQName 
     * @param {Pointer<Int32>} pcchQName 
     * @returns {HRESULT} 
     */
    getQName(nIndex, ppwchQName, pcchQName) {
        result := ComCall(6, this, "int", nIndex, "ushort*", ppwchQName, "int*", pcchQName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<UInt16>} ppwchUri 
     * @param {Pointer<Int32>} pcchUri 
     * @param {Pointer<UInt16>} ppwchLocalName 
     * @param {Pointer<Int32>} pcchLocalName 
     * @param {Pointer<UInt16>} ppwchQName 
     * @param {Pointer<Int32>} pcchQName 
     * @returns {HRESULT} 
     */
    getName(nIndex, ppwchUri, pcchUri, ppwchLocalName, pcchLocalName, ppwchQName, pcchQName) {
        result := ComCall(7, this, "int", nIndex, "ushort*", ppwchUri, "int*", pcchUri, "ushort*", ppwchLocalName, "int*", pcchLocalName, "ushort*", ppwchQName, "int*", pcchQName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<Int32>} pnIndex 
     * @returns {HRESULT} 
     */
    getIndexFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, pnIndex) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        result := ComCall(8, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, "int*", pnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<Int32>} pnIndex 
     * @returns {HRESULT} 
     */
    getIndexFromQName(pwchQName, cchQName, pnIndex) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        result := ComCall(9, this, "ptr", pwchQName, "int", cchQName, "int*", pnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<UInt16>} ppwchType 
     * @param {Pointer<Int32>} pcchType 
     * @returns {HRESULT} 
     */
    getType(nIndex, ppwchType, pcchType) {
        result := ComCall(10, this, "int", nIndex, "ushort*", ppwchType, "int*", pcchType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<UInt16>} ppwchType 
     * @param {Pointer<Int32>} pcchType 
     * @returns {HRESULT} 
     */
    getTypeFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, ppwchType, pcchType) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        result := ComCall(11, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, "ushort*", ppwchType, "int*", pcchType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<UInt16>} ppwchType 
     * @param {Pointer<Int32>} pcchType 
     * @returns {HRESULT} 
     */
    getTypeFromQName(pwchQName, cchQName, ppwchType, pcchType) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        result := ComCall(12, this, "ptr", pwchQName, "int", cchQName, "ushort*", ppwchType, "int*", pcchType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<UInt16>} ppwchValue 
     * @param {Pointer<Int32>} pcchValue 
     * @returns {HRESULT} 
     */
    getValue(nIndex, ppwchValue, pcchValue) {
        result := ComCall(13, this, "int", nIndex, "ushort*", ppwchValue, "int*", pcchValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<UInt16>} ppwchValue 
     * @param {Pointer<Int32>} pcchValue 
     * @returns {HRESULT} 
     */
    getValueFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, ppwchValue, pcchValue) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        result := ComCall(14, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, "ushort*", ppwchValue, "int*", pcchValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<UInt16>} ppwchValue 
     * @param {Pointer<Int32>} pcchValue 
     * @returns {HRESULT} 
     */
    getValueFromQName(pwchQName, cchQName, ppwchValue, pcchValue) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        result := ComCall(15, this, "ptr", pwchQName, "int", cchQName, "ushort*", ppwchValue, "int*", pcchValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
