#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersistStreamInit.ahk

/**
 * Use this interface to set properties for build objects such as word wheels and indexes. Call these methods in the document build process to define properties for all build objects.
 * @see https://docs.microsoft.com/windows/win32/api//infotech/nn-infotech-iitproplist
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IITPropList extends IPersistStreamInit{
    /**
     * The interface identifier for IITPropList
     * @type {Guid}
     */
    static IID => Guid("{1f403bb1-9997-11d0-a850-00aa006c7d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Integer} PropID 
     * @param {PWSTR} lpszwString 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     */
    Set(PropID, lpszwString, dwOperation) {
        lpszwString := lpszwString is String ? StrPtr(lpszwString) : lpszwString

        result := ComCall(9, this, "uint", PropID, "ptr", lpszwString, "uint", dwOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbData 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     */
    Set(PropID, lpvData, cbData, dwOperation) {
        result := ComCall(10, this, "uint", PropID, "ptr", lpvData, "uint", cbData, "uint", dwOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Integer} dwData 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     */
    Set(PropID, dwData, dwOperation) {
        result := ComCall(11, this, "uint", PropID, "uint", dwData, "uint", dwOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Prop 
     * @returns {HRESULT} 
     */
    Add(Prop) {
        result := ComCall(12, this, "ptr", Prop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     */
    Get(PropID, Property) {
        result := ComCall(13, this, "uint", PropID, "ptr", Property, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fPersist 
     * @returns {HRESULT} 
     */
    SetPersist(fPersist) {
        result := ComCall(15, this, "int", fPersist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {BOOL} fPersist 
     * @returns {HRESULT} 
     */
    SetPersist(PropID, fPersist) {
        result := ComCall(16, this, "uint", PropID, "int", fPersist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     */
    GetFirst(Property) {
        result := ComCall(17, this, "ptr", Property, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     */
    GetNext(Property) {
        result := ComCall(18, this, "ptr", Property, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} cProp 
     * @returns {HRESULT} 
     */
    GetPropCount(cProp) {
        result := ComCall(19, this, "int*", cProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwHdrSize 
     * @returns {HRESULT} 
     */
    SaveHeader(lpvData, dwHdrSize) {
        result := ComCall(20, this, "ptr", lpvData, "uint", dwHdrSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    SaveData(lpvHeader, dwHdrSize, lpvData, dwBufSize) {
        result := ComCall(21, this, "ptr", lpvHeader, "uint", dwHdrSize, "ptr", lpvData, "uint", dwBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwHdrSize 
     * @returns {HRESULT} 
     */
    GetHeaderSize(dwHdrSize) {
        result := ComCall(22, this, "uint*", dwHdrSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<UInt32>} dwDataSize 
     * @returns {HRESULT} 
     */
    GetDataSize(lpvHeader, dwHdrSize, dwDataSize) {
        result := ComCall(23, this, "ptr", lpvHeader, "uint", dwHdrSize, "uint*", dwDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<IStream>} pStream 
     * @returns {HRESULT} 
     */
    SaveDataToStream(lpvHeader, dwHdrSize, pStream) {
        result := ComCall(24, this, "ptr", lpvHeader, "uint", dwHdrSize, "ptr", pStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    LoadFromMem(lpvData, dwBufSize) {
        result := ComCall(25, this, "ptr", lpvData, "uint", dwBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    SaveToMem(lpvData, dwBufSize) {
        result := ComCall(26, this, "ptr", lpvData, "uint", dwBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
