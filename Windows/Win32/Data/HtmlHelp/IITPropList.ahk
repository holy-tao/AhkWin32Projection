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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "Set1", "Set2", "Add", "Get", "Clear", "SetPersist", "SetPersist1", "GetFirst", "GetNext", "GetPropCount", "SaveHeader", "SaveData", "GetHeaderSize", "GetDataSize", "SaveDataToStream", "LoadFromMem", "SaveToMem"]

    /**
     * 
     * @param {Integer} PropID 
     * @param {PWSTR} lpszwString 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set(PropID, lpszwString, dwOperation) {
        lpszwString := lpszwString is String ? StrPtr(lpszwString) : lpszwString

        result := ComCall(9, this, "uint", PropID, "ptr", lpszwString, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbData 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set1(PropID, lpvData, cbData, dwOperation) {
        result := ComCall(10, this, "uint", PropID, "ptr", lpvData, "uint", cbData, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Integer} dwData 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set2(PropID, dwData, dwOperation) {
        result := ComCall(11, this, "uint", PropID, "uint", dwData, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Prop 
     * @returns {HRESULT} 
     */
    Add(Prop) {
        result := ComCall(12, this, "ptr", Prop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-get
     */
    Get(PropID, Property) {
        result := ComCall(13, this, "uint", PropID, "ptr", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-clear
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fPersist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-setpersist(propid_bool)
     */
    SetPersist(fPersist) {
        result := ComCall(15, this, "int", fPersist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {BOOL} fPersist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-setpersist(propid_bool)
     */
    SetPersist1(PropID, fPersist) {
        result := ComCall(16, this, "uint", PropID, "int", fPersist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-getfirst
     */
    GetFirst(Property) {
        result := ComCall(17, this, "ptr", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     */
    GetNext(Property) {
        result := ComCall(18, this, "ptr", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cProp 
     * @returns {HRESULT} 
     */
    GetPropCount(cProp) {
        result := ComCall(19, this, "int*", cProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwHdrSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-saveheader
     */
    SaveHeader(lpvData, dwHdrSize) {
        result := ComCall(20, this, "ptr", lpvData, "uint", dwHdrSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-savedata
     */
    SaveData(lpvHeader, dwHdrSize, lpvData, dwBufSize) {
        result := ComCall(21, this, "ptr", lpvHeader, "uint", dwHdrSize, "ptr", lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwHdrSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-getheadersize
     */
    GetHeaderSize(dwHdrSize) {
        result := ComCall(22, this, "uint*", dwHdrSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<Integer>} dwDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-getdatasize
     */
    GetDataSize(lpvHeader, dwHdrSize, dwDataSize) {
        result := ComCall(23, this, "ptr", lpvHeader, "uint", dwHdrSize, "uint*", dwDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    SaveDataToStream(lpvHeader, dwHdrSize, pStream) {
        result := ComCall(24, this, "ptr", lpvHeader, "uint", dwHdrSize, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    LoadFromMem(lpvData, dwBufSize) {
        result := ComCall(25, this, "ptr", lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    SaveToMem(lpvData, dwBufSize) {
        result := ComCall(26, this, "ptr", lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }
}
